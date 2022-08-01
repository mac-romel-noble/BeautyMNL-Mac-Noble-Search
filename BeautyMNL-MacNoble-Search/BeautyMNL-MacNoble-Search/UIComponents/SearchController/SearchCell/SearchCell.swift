//
//  SearchCell.swift
//  BeautyMNL-MacNoble-Search
//
//  Created by Mac Romel D. Noble on 8/1/22.
//

import LBTATools
import Kingfisher

class SearchCell: UITableViewCell {
    
    var viewModel: SearchCellViewModel? {
        didSet {
            setupViewModel()
        }
    }
    
    // MARK: - Private properties
    
    private let mainStack = UIStackView()
    private let titleLabel = UILabel()
    private let priceLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let thumbImageView = UIImageView()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Setup

private extension SearchCell {
    func setup() {
        setupMainStack()
        setupThumbImageView()
        setupLabels()
    }
    
    func setupViewModel() {
        titleLabel.text = viewModel?.title
        titleLabel.numberOfLines = 2
        titleLabel.minimumScaleFactor = 0.8
        priceLabel.text = viewModel?.price
        subtitleLabel.text = viewModel?.subtitle
        thumbImageView.kf.setImage(
            with: viewModel?.thumbURL,
            placeholder: UIImage(systemName: "photo")
        )
    }
    
    func setupMainStack() {
        mainStack.alignment = .center
        mainStack.spacing = 12
        contentView.addSubview(mainStack)
        mainStack.fillSuperview(padding: .init(
            top: 20,
            left: 16,
            bottom: 20,
            right: 16
        ))
    }
    
    func setupLabels() {
        titleLabel.font = .boldSystemFont(ofSize: 18)
        priceLabel.font = .systemFont(ofSize: 14)
        priceLabel.textColor = .systemBlue
        subtitleLabel.font = .systemFont(ofSize: 12)
        subtitleLabel.textColor = .systemGray
        
        let textStack = UIStackView(arrangedSubviews: [
            titleLabel,
            priceLabel,
            subtitleLabel
        ])
        textStack.spacing = 3
        textStack.axis = .vertical
        
        mainStack.addArrangedSubview(textStack)
    }
    
    func setupThumbImageView() {
        thumbImageView.withSize(.init(width: 70, height: 70))
        thumbImageView.layer.cornerRadius = 10
        thumbImageView.layer.masksToBounds = true
        thumbImageView.contentMode = .scaleAspectFill
        thumbImageView.kf.indicatorType = .activity
        thumbImageView.tintColor = .systemGray
        
        mainStack.addArrangedSubview(thumbImageView)
    }
}
