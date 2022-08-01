//
//  ItemRepository.swift
//  BeautyMNL-MacNoble-Search
//
//  Created by Mac Romel D. Noble on 8/1/22.
//

import Foundation

protocol ItemRepository {
    func getItems(searchString: String, completionHandler: @escaping ((_ itemList: [Item]) -> Void))
}

struct ItunesRepository: ItemRepository {
    func getItems(searchString: String, completionHandler: @escaping ((_ itemList: [Item]) -> Void)) {
        guard !searchString.isEmpty else {
            return
        }
        
        let queryItems = [
            URLQueryItem(name: "term", value: searchString),
            URLQueryItem(name: "media", value: "movie")
        ]
        
        var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")
        urlComponents?.queryItems = queryItems
        
        guard let finalURL = urlComponents?.url else {
            completionHandler([])
            return
        }
        
        let request = URLRequest(url: finalURL)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completionHandler([])
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(SearchResult.self, from: data)
                completionHandler(decoded.results)
            } catch {
                assertionFailure("Decoding error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
