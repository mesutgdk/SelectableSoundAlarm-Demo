//
//  StopWatchVC.swift
//  task5_app
//
//  Created by Mesut Gedik on 5.09.2023.
//

import UIKit

final class StopWatchVC: UIViewController {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "STOPWATCH"
        label.font = UIFont.systemFont(ofSize: 25)
        label.tintColor = .systemGray4
        return label
    }()
    
    override func viewDidLoad() {
        setup()
        layout()
    }
    private func setup(){
        view.addSubviews(backgroundImageView,timeLabel)
        view.backgroundColor = .systemBackground
        backgroundImageView.image = UIImage(named: "stopWatch")
    }
    private func layout(){
        //backgroundImageView
            NSLayoutConstraint.activate([
                backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                backgroundImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                backgroundImageView.heightAnchor.constraint(equalToConstant: view.frame.height/2)
            ])
        //timeLabel
        NSLayoutConstraint.activate([
            timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50),
            timeLabel.widthAnchor.constraint(equalToConstant: view.frame.width/2)
        ])
    }
}
