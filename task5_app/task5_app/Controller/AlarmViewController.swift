//
//  ViewController.swift
//  task2_app
//
//  Created by Mesut Gedik on 29.08.2023.
//

import UIKit

final class AlarmViewController: UIViewController {
    
    private let alarmManager = AlarmManager()
    
    private let timePicker: UIPickerView = {
        var picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private let setButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 25
        button.backgroundColor = .systemIndigo
        button.setTitle("Set alarm", for: [])
        button.addTarget(self, action: #selector(setButtonTapped), for: .primaryActionTriggered)
        
        return button
    }()
    
    private let stopButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = SoundManager.shared.stopButtonHiden
        button.configuration = .plain()
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemRed
        button.tintColor = .systemBackground
        button.setTitle("Stop", for: [])
        button.addTarget(self, action: #selector(stopButtonTapped), for: .primaryActionTriggered)
        
        return button
    }()
    
    private let soundButton: UIButton = {
        let button = UIButton(type: .contactAdd)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .plain()
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 25
        button.backgroundColor = .systemFill
        button.tintColor = .systemIndigo
        button.setTitle("Sound", for: [])
        button.addTarget(self, action: #selector(soundButtonTapped), for: .primaryActionTriggered)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layout()
        
        
    }
    
    private func setup (){
        view.addSubviews(timePicker,setButton,stopButton,soundButton)
      
        view.backgroundColor = .systemBackground
        
        timePicker.delegate = self
        timePicker.dataSource = self

    }
    private func layout() {
        // datePicker
        NSLayoutConstraint.activate([
            timePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
            timePicker.heightAnchor.constraint(equalToConstant: 175),
            timePicker.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            timePicker.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
        ])
        // setButton
        NSLayoutConstraint.activate([
            setButton.heightAnchor.constraint(equalToConstant: 50),
            setButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
            setButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            setButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50)
        ])
        //stopButton
        NSLayoutConstraint.activate([
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.widthAnchor.constraint(equalTo: stopButton.heightAnchor, constant: 20),
            stopButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            stopButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
        
        //soundButton
        NSLayoutConstraint.activate([
            soundButton.heightAnchor.constraint(equalToConstant: 50),
            soundButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -75),
            soundButton.topAnchor.constraint(equalTo: setButton.bottomAnchor, constant: 50),
            soundButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 75)
        ])
    }
    
}
// MARK: - Actions
extension AlarmViewController{
    @objc func setButtonTapped(){
        alarmManager.getSelectedTimeFromPicker(pickerView: timePicker)
    }
    @objc func stopButtonTapped (){
        SoundManager.shared.stopAlarmSound()
        stopButton.isHidden = true
    }
    public func makeStopButtonVisible(_ isVisible: Bool){
        stopButton.isHidden = isVisible
    }
    
    @objc func soundButtonTapped (){
        let soundSelectionVC = SoundSelectionVC()
        soundSelectionVC.setStatusBar()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().tintColor = UIColor.systemRed
        UINavigationBar.appearance().backgroundColor = .systemGray
        navigationController?.pushViewController(soundSelectionVC, animated: true)
        print("soundVC is tapped")
        
    }
    
}

// MARK: - PickerView Delegate and DataSourse
extension AlarmViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? alarmManager.hourArray.count : alarmManager.minuteArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            let hour = alarmManager.hourArray[row] < 10 ? "0\(alarmManager.hourArray[row])" : "\(alarmManager.hourArray[row])"
            return hour
        } else {
            let minute = alarmManager.minuteArray[row] < 10 ? "0\(alarmManager.minuteArray[row])" : "\(alarmManager.minuteArray[row])"
            return minute
        }
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 70
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 35
    }

}

