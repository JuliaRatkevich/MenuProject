//
//  GroupCell.swift
//  menyProject
//
//  Created by Yuliya Ratkevcih on 19.06.20.
//  Copyright © 2020 Yuliya Ratkevcih. All rights reserved.
//

import UIKit

class GroupCell: UICollectionViewCell {
    
    @IBOutlet var groupNameLabel: UILabel!
    
    func setupCell(group: Group) {
        groupNameLabel.text = group.name
    }
}
