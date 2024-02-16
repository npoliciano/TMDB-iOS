//
//  MoviesViewModel.swift
//  TMDB
//
//  Created by Nicolle on 15/02/24.
//

import Foundation

class MoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoading = false

    func getMovies() {
        isLoading = true
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1")!
        var request = URLRequest(url: url)

        request.httpMethod = "GET"
        
        let headers = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MzEyMTA2OTNlNzQyODIxNTQ3YWNiZjA0NDNhYWQ1YSIsInN1YiI6IjY1Y2EzMWU2MjY2Nzc4MDE2MzU4YjE4MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.nzD-8uhSCI6Rr0x46xm0aNQeLNlwKb2EX2DnlyI_mdA"
        ]

        request.allHTTPHeaderFields = headers

        let session = URLSession.shared

        let dataTask = session.dataTask(
            with: request,
            completionHandler: {
                (data, response, error) -> Void in
                if (error != nil) {
                    print(error as Any)
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
                        DispatchQueue.main.async {//asyncAfter(deadline: .now() + 2) {
                            self.isLoading = false
                            self.movies = movies
                        }
                    } catch {
                        print(error)
                    }
                }
            }
        )

        dataTask.resume()
    }
}