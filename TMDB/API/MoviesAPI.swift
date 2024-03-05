//
//  MoviesAPI.swift
//  TMDB
//
//  Created by Nicolle on 17/02/24.
//

import Foundation

class MoviesAPI {
    func requestDecodable<T: Decodable>(url: URL, completion: @escaping (T?) -> Void) {
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
                        let json = try decoder.decode(T.self, from: data)
                        DispatchQueue.main.async {
                            completion(json)
                        }
                    } catch {
                        print(error)
                        DispatchQueue.main.async {
                            completion(nil)
                        }
                    }
                }
            }
        )

        dataTask.resume()
    }

    func getTrailer(for movieId: Int, completion: @escaping (URL?) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)/videos?language=en-US")!

        requestDecodable(url: url) { (json: VideosJSON?) in
            guard let json else {
                completion(nil)
                return
            }
            print(json)
            let trailer = json.results.first { video in
                video.type == "Trailer" && video.site == "YouTube"
            }
            if let trailer {
                let url = URL(string: "https://www.youtube.com/embed/\(trailer.key)")
                completion(url)
            } else {
                completion(nil)
            }
        }
    }

    func getCast(for movieId: Int, completion: @escaping ([Actor]?) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)/credits?language=en-US")!

        requestDecodable(url: url) { (json: CreditsJSON?) in
            guard let json else {
                completion(nil)
                return
            }
            print(json)
            let cast = json.cast.map { actorJson in
                Actor(
                    name: actorJson.name,
                    profileURL: actorJson.profilePath.map { path in
                        URL(string: "https://image.tmdb.org/t/p/w185/\(path)")!
                    },
                    character: actorJson.character
                )
            }
            completion(cast)
        }
    }

    func getMovieSummary(for movieId: Int, completion: @escaping (MovieSummary?) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)?language=en-US")!

        requestDecodable(url: url) { (json: MovieDetailsJSON?) in
            if let json {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let releaseDate = dateFormatter.string(from: json.releaseDate)
                dateFormatter.dateFormat = "yyyy"
                let releaseYear = dateFormatter.string(from: json.releaseDate)

                let interval = json.runtime * 60
                let formatter = DateComponentsFormatter()
                formatter.allowedUnits = [.hour, .minute]
                formatter.unitsStyle = .abbreviated
                let runtime = formatter.string(from: TimeInterval(interval))!

                let movieSummary = MovieSummary(
                    title: json.title,
                    genres: json.genres
                        .map { $0.name }
                        .joined(separator: ", "),
                    backdropURL: URL(string: "https://image.tmdb.org/t/p/w1280/\(json.backdropPath)")!,
                    posterURL: URL(string: "https://image.tmdb.org/t/p/w500/\(json.posterPath)")!,
                    overview: json.overview,
                    releaseDate: releaseDate,
                    releaseYear: releaseYear,
                    runtime: runtime,
                    tagline: json.tagline,
                    voteAverage: json.voteAverage
                )
                completion(movieSummary)
            } else {
                completion(nil)
            }
        }
    }

    func getMovies(for selectedList: SelectedList, completion: @escaping ([Movie]?) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(selectedList.rawValue)?language=en-US&page=1")!
        requestDecodable(url: url) { (json: MovieListJSON?) in
            if let json {

                let movies = json.results.map { movieJson in
                    let dateFormatter = DateFormatter()
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

                completion(movies)
            } else {
                completion(nil)
            }
        }
    }
}
