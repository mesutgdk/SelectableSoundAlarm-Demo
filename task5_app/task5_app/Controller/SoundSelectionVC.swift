//
//  SoundSelectVC.swift
//  task5_app
//
//  Created by Mesut Gedik on 3.09.2023.
//

import UIKit

class SoundSelectionVC: UITabBarController {
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setupViews()
        setupBars()
    }
    
    private func setupViews(){
        
        let soundVC = SoundsVC()
        let playlistVC = PlaylistVC()
        let songVC = SongsVC()
        
        soundVC.setTabBarImage(imageName: "speaker.wave.1", title: "Sounds")
        playlistVC.setTabBarImage(imageName: "list.bullet.clipboard", title: "PlayList")
        songVC.setTabBarImage(imageName: "music.quarternote.3", title: "Songs")
        
        let soundNC = UINavigationController(rootViewController: soundVC)
        let playlistNC = UINavigationController(rootViewController: playlistVC)
        let songNC = UINavigationController(rootViewController: songVC)
        
        soundNC.navigationBar.barTintColor = .red
        hideNavigationBarLine(soundNC.navigationBar)
        
        let tabBarList = [soundNC,playlistNC,songNC]
        
//        setViewControllers(tabBarList, animated: true)
        viewControllers = tabBarList
        
        navigationController?.navigationBar.tintColor = .red
        title = "Select Sound"
    }
    
    private func hideNavigationBarLine (_ navigationBar: UINavigationBar){
        let img = UIImage()
        navigationBar.shadowImage = img
        navigationBar.setBackgroundImage(img, for: .default)
        navigationBar.isTranslucent = false
    }
    
    private func setupBars(){
        tabBar.tintColor = appColor
        tabBar.backgroundColor = .systemGray3
        tabBar.isTranslucent = false
    }
}

class SoundsVC: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemBlue
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


