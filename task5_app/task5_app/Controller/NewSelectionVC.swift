//
//  NewSelectionVC.swift
//  task5_app
//
//  Created by Mesut Gedik on 4.09.2023.
//

import UIKit

final class NewSelectionVC: UIViewController {
    
    private var tableView: UITableView = {
        let tableview = UITableView ()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.backgroundColor = .systemGray2
        return tableview
    } ()
    
    private let selectedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Sound Selected"
        label.font = UIFont.systemFont(ofSize: 18)
        label.tintColor = .systemGray4
        return label
    }()
    
    private let segmentControl: UISegmentedControl = {
        let items = ["Sounds","Playlists","Songs"]
        let sC = UISegmentedControl(items: items)
        sC.translatesAutoresizingMaskIntoConstraints = false
        sC.selectedSegmentIndex = 0
        sC.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        
        return sC
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setup()
        layout()
    }
    
    private func setup(){
        view.addSubviews(selectedLabel,segmentControl,tableView)
        segmentControl.backgroundColor = .systemGray3
        view.backgroundColor = .systemRed
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func layout(){
        // selectedLAbel
        NSLayoutConstraint.activate([
            selectedLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            selectedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectedLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -75),
            selectedLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 75)
        ])
        // segmentedControl
        NSLayoutConstraint.activate([
            segmentControl.topAnchor.constraint(equalTo: selectedLabel.bottomAnchor, constant: 8),
            segmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentControl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -75),
            segmentControl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 75)
        ])
        // tableView
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 8),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        // Handle the segmented control value change
        showViewController(atIndex: sender.selectedSegmentIndex)
    }
    private func showViewController(atIndex index: Int) {
        
        switch segmentControl.selectedSegmentIndex{
        case 0:
            segmentControl.backgroundColor = .systemGray3
            view.backgroundColor = .systemRed
            
        case 1:
            segmentControl.backgroundColor = .systemGray3
            view.backgroundColor = .systemBlue
        case 2:
            segmentControl.backgroundColor = .systemGray3
            view.backgroundColor = .systemMint
        default:
            break
        }
    }
}
// MARK: - TableView Delegate and Datasource
extension NewSelectionVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    
}
