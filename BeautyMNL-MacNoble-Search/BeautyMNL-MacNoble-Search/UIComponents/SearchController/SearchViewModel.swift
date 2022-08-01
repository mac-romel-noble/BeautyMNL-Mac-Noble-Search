//
//  SearchViewModel.swift
//  BeautyMNL-MacNoble-Search
//
//  Created by Mac Romel D. Noble on 8/1/22.
//

import Foundation

protocol SearchViewModel {
    func search(_ searchString: String)
}

class ItunesSearchViewModel {
    
}

// MARK: - SearchViewModel

extension ItunesSearchViewModel: SearchViewModel {
    func search(_ searchString: String) {
        
    }
}
