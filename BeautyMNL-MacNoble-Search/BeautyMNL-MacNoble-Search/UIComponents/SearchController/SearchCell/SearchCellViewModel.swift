//
//  SearchCellViewModel.swift
//  BeautyMNL-MacNoble-Search
//
//  Created by Mac Romel D. Noble on 8/1/22.
//

import Foundation

protocol SearchCellViewModel {
    var title: String { get }
    var price: String? { get }
    var subtitle: String { get }
    var thumbURL: URL? { get }
    var videoURL: URL? { get }
}

class MovieCellViewModel {
    
    private let item: Item
    
    init(_ item: Item) {
        self.item = item
    }
    
}

// MARK: - SearchCellViewModel

extension MovieCellViewModel: SearchCellViewModel {
    var title: String {
        item.trackName
    }
    
    var price: String? {
        guard let trackPrice = item.trackPrice else { return nil }
        let number = NSNumber(value: trackPrice)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: number)
    }
    
    var subtitle: String {
        let genre = item.primaryGenreName
        
        let releaseDate: String? = {
            guard let releaseDate = item.releaseDate else { return nil }
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy"
            return dateFormatter.string(from: releaseDate)
        }()
        
        let duration: String? = {
            guard let duration = item.trackTimeMillis else { return nil }
            let timeInterval: TimeInterval = Double(duration) * 0.001
            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.hour, .minute]
            return formatter.string(from: timeInterval)
        }()
        
        return [genre, releaseDate, duration].compactMap({ $0 }).joined(separator: " • ")
    }
    
    var thumbURL: URL? {
        item.artworkUrl100
    }
    
    var videoURL: URL? {
        item.previewUrl
    }
}
