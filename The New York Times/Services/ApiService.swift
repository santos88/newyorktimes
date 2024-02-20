//
//  ApiService.swift
//  The New York Times
//
//  Created by Santos Ramon on 19/02/24.
//

import Foundation

class ApiService {
    static let shared = ApiService()
    private let apiKey = "qTl6HA9lEk9bHwEMNSrdjRAceMnSqQEZ"
    private let baseUrl = "https://api.nytimes.com/svc/mostpopular/v2/emailed/"

    func getMostPopularArticles(period: Int, completion: @escaping ([Result]?, Error?) -> Void) {
        let urlString = "\(baseUrl)\(period).json?api-key=\(apiKey)"
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }

            guard let data = data else {
                completion(nil, NSError(domain: "No data", code: 0, userInfo: nil))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let responseJSON = try decoder.decode(ArticlesResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(responseJSON.results, nil)
                }
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}
