//
//  SearchTableViewController.swift
//  BeautyMNL-MacNoble-Search
//
//  Created by Mac Romel D. Noble on 8/1/22.
//

import UIKit
import RxSwift
import RxCocoa

class SearchTableViewController: UITableViewController {
    
    private let viewModel: SearchViewModel
    
    // MARK: - Private properties
    
    internal var searchController = UISearchController()
    private var disposeBag = DisposeBag()
    
    // MARK: - Init
    
    init(_ viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        disposeBag = .init()
    }
}

// MARK: - Setup

private extension SearchTableViewController {
    func setup() {
        title = "Search Movies"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupTable()
        setupSearch()
        setupBindings()
    }
    
    func setupTable() {
        tableView.register(
            SearchCell.self,
            forCellReuseIdentifier: SearchCell.description()
        )
        tableView.keyboardDismissMode = .onDrag
    }
    
    func setupSearch() {
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.hidesSearchBarWhenScrolling = false
        
        definesPresentationContext = true
        
        navigationItem.searchController = searchController
        searchController.hidesNavigationBarDuringPresentation = true
    }
    
    func setupBindings() {
        searchController.searchBar.rx.text.orEmpty
            .debounce(.milliseconds(500), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] (searchString) in
                self?.viewModel.search(searchString)
            }).disposed(by: disposeBag)
    }
}

// MARK: - UITableViewDataSource

extension SearchTableViewController {
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 10
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SearchCell.description(),
            for: indexPath
        ) as? SearchCell else {
            fatalError("Failed to dequeue cell.")
        }
        
        cell.viewModel = MovieCellViewModel()
        
        return cell
    }
}

// MARK: - UIT

extension SearchTableViewController {
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        #warning("handle tap")
    }
}
