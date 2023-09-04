//
//  TableModel.swift
//  task5_app
//
//  Created by Mesut Gedik on 4.09.2023.
//

import Foundation
import UIKit

class TableViewModel{
    static let listOfSounds: [String] = [
    "wakeup",
    "getup",
    "bell",
    "who let the dogs out"
    ]
    static let playlist = [
        TableModel(imageViewImage: UIImage(systemName: "figure.taichi"), nameLabel: "Let's Party", numberLabel: "24"),
    TableModel(imageViewImage: UIImage(systemName: "touchid"), nameLabel: "Secure", numberLabel: "7"),
    TableModel(imageViewImage: UIImage(systemName: "arrow.up.and.person.rectangle.turn.left"), nameLabel: "Turning", numberLabel: "17"),
    TableModel(imageViewImage: UIImage(systemName: "play.fill"), nameLabel: "Relax", numberLabel: "34")
    ]
    
}
struct TableModel {
    let imageViewImage: UIImage!
    let nameLabel: String
    let numberLabel: String
}

