//
//  SearchViewModel.swift
//  BeautyMNL-MacNoble-Search
//
//  Created by Mac Romel D. Noble on 8/1/22.
//

import Foundation

typealias IsLoading = Bool

protocol SearchViewModel: AnyObject {
    var items: [SearchCellViewModel] { get }
    var onLoadingChanged: ((IsLoading) -> Void)? { get set }
    var onReload: (() -> Void)? { get set }
    func search(_ searchString: String)
}

class ItunesSearchViewModel: SearchViewModel {
    
    private(set) var items: [SearchCellViewModel] = []
    
    var onLoadingChanged: ((IsLoading) -> Void)?
    
    var onReload: (() -> Void)?
    
    private let itemRepository: ItemRepository
    
    // MARK: - Init
    
    init(_ itemRepository: ItemRepository) {
        self.itemRepository = itemRepository
    }
    
    func search(_ searchString: String) {
        onLoadingChanged?(true)
        itemRepository.getItems(searchString: searchString) { [weak self] itemList in
            DispatchQueue.main.async {
                self?.items = itemList.map({
                    MovieCellViewModel($0)
                })
                self?.onLoadingChanged?(false)
                self?.onReload?()
            }
        }
    }
}
