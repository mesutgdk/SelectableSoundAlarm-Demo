//
//  Extensions.swift
//  task2_app
//
//  Created by Mesut Gedik on 29.08.2023.
//

import UIKit

extension UIView{
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}

extension UIViewController {
    func setStatusBar(){
        
       let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithTransparentBackground() // to hide Nav Bar Line also
        navBarAppearance.backgroundColor = .systemBackground
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        
    }
    
    func setTabBarImage(imageName: String, title: String){
        
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName,withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 2)
        
    }
}
