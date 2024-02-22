//
//  MoviesAPI.swift
//  TMDB
//
//  Created by Nicolle on 17/02/24.
//

import Foundation

class MoviesAPI {
    func getMovies(url: URL, completion: @escaping ([Movie]?) -> Void) {
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
            completionHandler: {
                (data, response, error) -> Void in
                if (error != nil) {
                    DispatchQueue.main.async {
                        completion(nil)
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
                                id: movieJson.id,
                                title: movieJson.title,
                                score: movieJson.voteAverage,
                                releaseDate: formattedDate,
                                backdropURL: URL(string: "https://image.tmdb.org/t/p/w1280/\(movieJson.backdropPath)")!,
                                posterURL: URL(string: "https://image.tmdb.org/t/p/w500/\(movieJson.posterPath)")!
                            )
                        }
                        DispatchQueue.main.async {
                            completion(movies)
                        }
                    } catch {
                        DispatchQueue.main.async {
                            completion(nil)
                        }
                    }
                }
            }
        )

        dataTask.resume()
    }
}
