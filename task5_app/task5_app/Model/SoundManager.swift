//
//  SoundManager.swift
//  task2_app
//
//  Created by Mesut Gedik on 30.08.2023.
//

import AVFoundation
import UIKit
import MediaPlayer

final class SoundManager {
    static let shared = SoundManager()
    
    var player: AVAudioPlayer?
    var volumeTimer: Timer?
    let maxVolume: Float = 1.0
    let duration: TimeInterval = 30.0
    var selectedTime: Double = 0
    
    var stopButtonHiden: Bool = true
    
    private init() {
    }
    
    func playAlarmSound() {
        guard let audioFilePath = Bundle.main.path(forResource: "wakeup", ofType: "mp3") else {
            return
        }
        let audioFileURL = URL(fileURLWithPath: audioFilePath)
        
        do {
            player = try AVAudioPlayer(contentsOf: audioFileURL)
            player?.volume = 0.3
            player?.setVolume(maxVolume, fadeDuration: duration)
            player?.prepareToPlay()
            player?.play()
            callTheAlart()
        } catch {
            print("Error playing alarm sound: \(error.localizedDescription)")
        }
    }

    func stopAlarmSound(){
        player?.stop()
        stopButtonHiden = true
    }
    private func callTheAlart(){
        // Show success message using UIAlertController
        let alert = UIAlertController(title: "Ding Dang", message: "Time To Wake Up", preferredStyle: .alert)
        let action = UIAlertAction(title: "Too Hard but OK", style: .default) { (action) in
//            self.stopAlarmSound()
        }
        alert.addAction(action)
        
        // Present the alert
        if let VC = UIApplication.shared.windows.first?.rootViewController {
            VC.present(alert, animated: true, completion: nil)
        }
    }

    func getUserPlaylists() {
        let query = MPMediaQuery.playlists()
        if let collections = query.collections {
            for collection in collections {
                if let playlistName = collection.value(forProperty: MPMediaPlaylistPropertyName) as? String {
                    // Access the playlist name
//                    print("Playlist Name: \(playlistName)")
                    TableModel.playlist.append(playlistName)
                }
            }
        }
    }

}


