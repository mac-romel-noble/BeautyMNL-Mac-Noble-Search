//
//  TrailerController.swift
//  BeautyMNL-MacNoble-Search
//
//  Created by Mac Romel D. Noble on 8/1/22.
//

import Foundation
import UIKit
import AVFoundation
import AVKit

class VideoPlayerController: UIViewController {
    
    private let spinner = UIActivityIndicatorView(style: .large)
    
    private var player: AVPlayer?
    
    init(videoURL: URL) {
        player = AVPlayer(url: videoURL)
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        setupSpinner()
        setupPlayer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        player?.pause()
        player = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Show errors if detected.
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let playerItem = object as? AVPlayerItem else { return }
        
        if keyPath == "status", playerItem.status != .readyToPlay {
            if let error = playerItem.error as NSError? {
                let errorCode = error.code
                
                let alert = UIAlertController(
                    title: "Failed to load video",
                    message: errorCode.description,
                    preferredStyle: .alert
                )
                
                present(alert, animated: true)
            }
        }
    }
}

// MARK: - Setup

private extension VideoPlayerController {
    func setupPlayer() {
        player?.addPeriodicTimeObserver(
            forInterval: CMTime(value: 1, timescale: 600), queue: DispatchQueue.main
        ) { [weak self] _ in
            if self?.player?.currentItem?.status == AVPlayerItem.Status.readyToPlay,
               self?.player?.currentItem?.isPlaybackLikelyToKeepUp != nil {
                self?.spinner.stopAnimating()
            }
        }
        
        player?.currentItem?.addObserver(self, forKeyPath: "status", options: .new, context: nil)

        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspect
        playerLayer.frame = view.frame
        
        view.layer.addSublayer(playerLayer)
        
        player?.play()
    }
    
    func setupSpinner() {
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        view.addSubview(spinner)
        spinner.centerInSuperview()
        spinner.transform = CGAffineTransform(
            translationX: 0,
            y: -100
        )
    }
}
