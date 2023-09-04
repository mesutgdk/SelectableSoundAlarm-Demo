//
//  NewSelectionVC.swift
//  task5_app
//
//  Created by Mesut Gedik on 4.09.2023.
//

import UIKit

final class NewSelectionVC: UIViewController {
    
    var numberOfSegments = 0
    
    private var tableView: UITableView = {
        let tableview = UITableView ()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.backgroundColor = .systemBackground
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

        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = TableViewCell.cellColor
        tableView.alpha = 0.8
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.cellIdentifier)
        
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
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150)
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
            numberOfSegments = 0
            reloadTableView()
        case 1:
            segmentControl.backgroundColor = .systemGray3
            numberOfSegments = 1
            reloadTableView()
        case 2:
            segmentControl.backgroundColor = .systemGray3
            numberOfSegments = 2
            reloadTableView()
        default:
            break
        }
    }
    private func reloadTableView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}
// MARK: - TableView Delegate and Datasource
extension NewSelectionVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch numberOfSegments {
        case 0:
            return TableViewModel.listOfSounds.count
        case 1:
            return TableViewModel.playlist.count
        case 2:
            return TableViewModel.listOfSounds.count
        default:
            break
        }
        return TableViewModel.listOfSounds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch numberOfSegments {
        case 0:
            let cell = UITableViewCell()
            cell.textLabel?.text = TableViewModel.listOfSounds[indexPath.row]
            cell.backgroundColor = TableViewCell.cellColor
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.cellIdentifier, for: indexPath) as! TableViewCell
            cell.playlistImageView.image = TableViewModel.playlist[indexPath.row].imageViewImage
            cell.playlistNameLabel.text = TableViewModel.playlist[indexPath.row].nameLabel
            cell.songNumberLabel.text = TableViewModel.playlist[indexPath.row].numberLabel
            cell.backgroundColor = TableViewCell.cellColor
            return cell
        case 2:
            let cell = UITableViewCell()
            cell.textLabel?.text = TableViewModel.listOfSounds[indexPath.row]
            cell.backgroundColor = TableViewCell.cellColor
            return cell
        default:
            let cell = UITableViewCell()
            cell.textLabel?.text = TableViewModel.listOfSounds[indexPath.row]
            cell.backgroundColor = TableViewCell.cellColor
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TableViewCell.rowHeight
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.tintColor = .systemTeal
        cell.textLabel?.textColor = .systemTeal
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            cell.tintColor = .systemGray6
            cell.textLabel?.textColor = .systemGray6
            
        })
    }
}
