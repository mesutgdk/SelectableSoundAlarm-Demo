//
//  TableViewCell.swift
//  task5_app
//
//  Created by Mesut Gedik on 4.09.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let cellIdentifier = "tableCell"
    static let rowHeight:CGFloat = 70
    static let cellColor:UIColor = .systemGray6
    static var isSelectedCell = false
    
    let playlistImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let playlistNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .systemGray
        label.text = ""
//        label.backgroundColor = TableViewCell.cellColor
        return label
    }()
    let songNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .systemGray
        label.text = ""
//        label.backgroundColor = TableViewCell.cellColor
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setup()
        layout()
    }
    
    private func setup(){
        contentView.addSubviews(playlistImageView,playlistNameLabel,songNumberLabel)
    }
    private func layout(){
        //playlistImageView
        NSLayoutConstraint.activate([
            playlistImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8),
            playlistImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 8),
            playlistImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -8),
            playlistImageView.heightAnchor.constraint(equalTo: playlistImageView.widthAnchor)
        ])
        
        //playlistNameLabel
        NSLayoutConstraint.activate([
            playlistNameLabel.topAnchor.constraint(equalTo: playlistImageView.topAnchor),
            playlistNameLabel.leftAnchor.constraint(equalTo: playlistImageView.rightAnchor,constant: 8),
            playlistNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -8),
            playlistNameLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        //songNumberLabel
        NSLayoutConstraint.activate([
            songNumberLabel.topAnchor.constraint(equalTo: playlistNameLabel.bottomAnchor,constant: 2),
            songNumberLabel.leftAnchor.constraint(equalTo: playlistNameLabel.leftAnchor),
            songNumberLabel.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor,constant: -8),
            songNumberLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
}
