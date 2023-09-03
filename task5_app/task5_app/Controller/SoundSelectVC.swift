//
//  SoundSelectVC.swift
//  task5_app
//
//  Created by Mesut Gedik on 3.09.2023.
//

import UIKit

class SoundSelectVC: UITabBarController {
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setupViews()
        setupBars()
    }
    
    private func setupViews(){
        
        let soundVC = SoundsVC()
        let playlistVC = PlaylistVC()
        let songVC = SongsVC()
        
        soundVC.setTabBarImage(imageName: "list.dash.header.rectangle", title: "Summary")
        playlistVC.setTabBarImage(imageName: "arrow.left.arrow.right", title: "Move Money")
        songVC.setTabBarImage(imageName: "ellipsis.circle", title: "More")
        
        let soundNC = UINavigationController(rootViewController: soundVC)
        let playlistNC = UINavigationController(rootViewController: playlistVC)
        let songNC = UINavigationController(rootViewController: songVC)
        
        soundNC.navigationBar.barTintColor = appColor
        hideNavigationBarLine(soundNC.navigationBar)
        
        let tabBarList = [soundNC,playlistNC,songNC]
        
        viewControllers = tabBarList
    }
    
    private func hideNavigationBarLine (_ navigationBar: UINavigationBar){
        let img = UIImage()
        navigationBar.shadowImage = img
        navigationBar.setBackgroundImage(img, for: .default)
        navigationBar.isTranslucent = false
    }
    
    private func setupBars(){
        
        tabBar.tintColor = appColor
        tabBar.isTranslucent = false
    }
}

class SoundsVC: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemRed
    }
}

class PlaylistVC: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemRed
    }
}

class SongsVC: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemMint
    }
}


