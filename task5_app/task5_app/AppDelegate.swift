//
//  AppDelegate.swift
//  task2_app
//
//  Created by Mesut Gedik on 29.08.2023.
//

import UIKit
import AVFoundation
import MediaPlayer

let appColor : UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var audioPlayer: AVAudioPlayer?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (approved, error) in
            if approved {
                print("PlayAlarm&Sound İzin Alındı Hadi İyisin")
            } else {
                print("PlayAlarm&Sound ve ses'e İzin Verilmedi, Malesef")
            }
        }
        MPMediaLibrary.requestAuthorization { status in
            if status == .authorized {
                print("MediaLibraryUsage - İzin Alındı Hadi İyisin")
                // User granted access
                // You can now use MusicKit to search the Apple Music catalog or access user playlists
            } else {
                print("MediaLibraryUsage - İzin Verilmedi, Malesef")
                // Handle denied access
            }
        }
        
        UINavigationBar.appearance().tintColor = .systemGray
       return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        let vc = AlarmViewController ()
        
        SoundManager.shared.playAlarmSound()
        
        vc.makeStopButtonVisible(false)
        
        print("i tried to play the sound")
        completionHandler(.newData)
    }
    
}

