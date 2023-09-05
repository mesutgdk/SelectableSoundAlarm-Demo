//
//  SoundSelectVC.swift
//  task5_app
//
//  Created by Mesut Gedik on 3.09.2023.
//

import UIKit

final class MainViewController: UITabBarController {
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setupViews()
        setupBars()
    }
    
    private func setupViews(){
        UITabBar.appearance().tintColor = .red
        let alarmVC = AlarmViewController()
        let timerVC = TimerVC()
        let stopWatchVC = StopWatchVC()
        
        alarmVC.setTabBarImage(imageName: "alarm.waves.left.and.right", title: "Alarms")
        timerVC.setTabBarImage(imageName: "timer", title: "Timer")
        stopWatchVC.setTabBarImage(imageName: "timelapse", title: "StopWatch")
        
        let alarmNC = UINavigationController(rootViewController: alarmVC)
        let timerNC = UINavigationController(rootViewController: timerVC)
        let stopwatchNC = UINavigationController(rootViewController: stopWatchVC)
        
        alarmNC.navigationBar.barTintColor = .red
        hideNavigationBarLine(alarmNC.navigationBar)
        
        let tabBarList = [alarmNC,timerNC,stopwatchNC]
        
        setViewControllers(tabBarList, animated: true)
//        viewControllers = tabBarList
        
    }
    
    private func hideNavigationBarLine (_ navigationBar: UINavigationBar){
        let img = UIImage()
        navigationBar.shadowImage = img
        navigationBar.setBackgroundImage(img, for: .default)
//        navigationBar.isTranslucent = false
    }
    
    private func setupBars(){
        tabBar.tintColor = appColor
        tabBar.backgroundColor = .systemBackground
//        tabBar.isTranslucent = false
    }
}






