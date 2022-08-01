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
}

class MovieCellViewModel {
    
}

extension MovieCellViewModel: SearchCellViewModel {
    var title: String {
        "Title 123"
    }
    
    var price: String? {
        "$ 4.99"
    }
    
    var subtitle: String {
        "Subtitle test"
    }
    
    var thumbURL: URL? {
        URL(string: "https://is4-ssl.mzstatic.com/image/thumb/Video124/v4/30/89/2d/30892d85-8849-79c7-ee97-aa14b9145f77/pr_source.lsr/100x100bb.jpg")
    }
}
