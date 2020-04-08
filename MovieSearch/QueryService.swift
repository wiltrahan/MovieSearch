//
//  QueryService.swift
//  MovieSearch
//
//  Created by William Trahan on 4/6/20.
//  Copyright © 2020 Wil Trahan. All rights reserved.
//

//import Foundation
//
//class QueryService {
//
//    let defaultSession = URLSession(configuration: .default)
//
//    var dataTask: URLSessionDataTask?
//    var errorMessage = ""
//    var movies: [Movie] = []
//
//    typealias JSONDictionary = [String: Any]
//    typealias QueryResult = ([Movie]?, String) -> Void
//
//    func getSearchResults(searchTerm: String) {
//
//        dataTask?.cancel()
//
//        if var urlComponents = URLComponents(string: "https://api.themoviedb.org/3/search/") {
//            urlComponents.query = "movie?api_key=2696829a81b1b5827d515ff121700838&query=\(searchTerm)&page=1"
//            print(searchTerm)
//            guard let url = urlComponents.url else {
//                return
//            }
//
//            dataTask = defaultSession.dataTask(with: url) { [weak self] data, response, error in
//                defer {
//                    self?.dataTask = nil
//                }
//
//                // 5
//                if let error = error {
//                    self?.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
//                } else if
//                    let data = data,
//                    let response = response as? HTTPURLResponse,
//                    response.statusCode == 200 {
//
//                    self?.updateSearchResults(data)
//
//                    // 6
////                    DispatchQueue.main.async {
////                        completion(self?.tracks, self?.errorMessage ?? "")
////                    }
//                }
//            }
//
//            // 7
//            dataTask?.resume()
//        }
//    }
//
//
//    private func updateSearchResults(_ data: Data) {
//        var response: JSONDictionary?
//        movies.removeAll()
//
//        do {
//            response = try JSONSerialization.jsonObject(with: data, options: []) as? JSONDictionary
//        } catch let parseError as NSError {
//            errorMessage += "JSONSerialization error: \(parseError.localizedDescription)\n"
//            return
//        }
//
//        guard let array = response!["results"] as? [Any] else {
//            errorMessage += "Dictionary does not contain results key\n"
//            return
//        }
//
//        var index = 0
//
//        for movieDictionary in array {
//            if let movieDictionary = movieDictionary as? JSONDictionary,
//                let title = movieDictionary["title"] as? String,
//                let date = movieDictionary["date"] as? String {
//                movies.append(Movie(title: title, release_date: date))
//                index += 1
//            } else {
//                errorMessage += "Problem parsing movieDictionary\n"
//            }
//        }
//    }
//
//}
