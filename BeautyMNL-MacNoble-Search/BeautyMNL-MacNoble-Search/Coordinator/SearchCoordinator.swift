//
//  SearchCoordinator.swift
//  BeautyMNL-MacNoble-Search
//
//  Created by Mac Romel D. Noble on 8/1/22.
//

import Foundation
import UIKit

protocol SearchCoordinator {
    func didSelectItem(at index: Int)
}

class ItunesMovieSearchCoordinator {
    
    let nav: UINavigationController
    
    let searchVM: SearchViewModel
    
    init(
        _ navigationController: UINavigationController,
        searchVM: SearchViewModel = ItunesSearchViewModel(ItunesRepository())
    ) {
        nav = navigationController
        self.searchVM = searchVM
    }
    
    func start() {
        let searchController = SearchTableViewController(searchVM)
        searchController.coordinator = self
        nav.pushViewController(searchController, animated: false)
    }
    
    func showTrailer(videURL: URL, movieName: String) {
        let trailerController = VideoPlayerController(videoURL: videURL)
        trailerController.title = movieName
        
        nav.pushViewController(trailerController, animated: true)
    }
    
}

// MARK: -  SearchCoordinator

extension ItunesMovieSearchCoordinator: SearchCoordinator {
    func didSelectItem(at index: Int) {
        let item = searchVM.items[index]
        guard let url = item.videoURL else { return }
        showTrailer(videURL: url, movieName: item.title)
    }
}
