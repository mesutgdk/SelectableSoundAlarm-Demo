//
//  TimerVC.swift
//  task5_app
//
//  Created by Mesut Gedik on 5.09.2023.
//

import UIKit

final class TimerVC: UIViewController {
    
    private let bacgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    override func viewDidLoad() {
        setup()
        layout()
        
    }
    private func setup(){
        bacgroundImageView.image = UIImage(named: "timer")
        view.addSubview(bacgroundImageView)
    }
    private func layout(){
            NSLayoutConstraint.activate([
                bacgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
                bacgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                view.trailingAnchor.constraint(equalTo: bacgroundImageView.trailingAnchor),
                bacgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}
