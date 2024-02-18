//
//  MovieListViewModel.swift
//  TMDB
//
//  Created by Nicolle on 17/02/24.
//

import Foundation

class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoading = false
    private let selectedList: String

    init(selectedList: String) {
        self.selectedList = selectedList
    }
    
    func getMovies() {
        isLoading = true
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(selectedList)?language=en-US&page=1")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let headers = [
            "accept": "application/json",
            "Authorization": Bundle.apiKey
        ]
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(
            with: request,
            completionHandler: { (data, response, error) -> Void in
                if (error != nil) {
                    DispatchQueue.main.async {
                        self.isLoading = false
                    }
                    return
                }

                if let httpResponse = response as? HTTPURLResponse,
                   httpResponse.statusCode == 200,

                    let data {
                    let decoder = JSONDecoder()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    do {
                        let json = try decoder.decode(NowPlayingJSON.self, from: data)
                        print(json)
                        let movies = json.results.map { movieJson in
                            dateFormatter.dateFormat = "MMM dd, yyyy"
                            let formattedDate = dateFormatter.string(from: movieJson.releaseDate)

                            return Movie(
                                title: movieJson.title,
                                score: movieJson.voteAverage,
                                releaseDate: formattedDate,
                                backdropURL: URL(string: "https://image.tmdb.org/t/p/w780/\(movieJson.posterPath)")!
                            )
                        }
                        DispatchQueue.main.async {
                            self.isLoading = false
                            self.movies = movies
                        }
                    } catch {
                        DispatchQueue.main.async {
                            self.isLoading = false
                        }
                    }
                }
            }
        )
        dataTask.resume()
    }
}
