//
//  TableModel.swift
//  task5_app
//
//  Created by Mesut Gedik on 4.09.2023.
//

import Foundation
import UIKit

final class TableModel{
   
    static var playlist: [String] = []
    static let listOfSounds: [String] = [
    "wakeup",
    "getup",
    "bell",
    "who let the dogs out"
    ]
    static let songs: [String] = [
    "California",
    "Cedarwood",
    "Volcano",
    "Iris",
    "A Song fro Someone",
    "The Miracle"]
    
    static var images: [String] = [
        "aGirlWithNoName",
        "bees",
        "black",
        "flower",
        "flower2",
        "moon",
        "rammstain",
        "spring",
        "sunset"
    ]
    
}
struct CellModel {
    let nameLabel: String
}

