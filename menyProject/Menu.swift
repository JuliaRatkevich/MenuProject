//
//  Menu.swift
//  menyProject
//
//  Created by Yuliya Ratkevcih on 17.06.20.
//  Copyright © 2020 Yuliya Ratkevcih. All rights reserved.
//

import Foundation
import UIKit

struct Group {
    var name: String
    var products: [Product]
}

struct Product {
    var name: String
    var price: Float
    var image: UIImage
}

class Menu {
    var groups: [Group] = []
    
    init() {
        setup()
    }
    
    
    func setup(){
        let r1 = Product(name: "JINYA Tonkotsu Black", price: 12, image: UIImage(named: "r1")!)
        let r2 = Product(name: "Spicy Umami Miso Ramen", price: 12.50, image: UIImage(named: "r2")!)
        let r3 = Product(name: "Tonkotsu Spicy", price: 9, image: UIImage(named: "r3")!)
        
        
        let b1 = Product(name: "Tokyo Curry Rice", price: 13, image: UIImage(named: "b1")!)
        let b2 = Product(name: "Vegan Rice Bowl", price: 19, image: UIImage(named: "b2")!)
        
        let ramenGroup = Group(name: "Ramen",
                               products: [r1, r2, r3])
        
        let bowlGroup = Group(name: "Bowls",
                              products: [b1, b2])
                
        groups = [ramenGroup, bowlGroup];

    }
}

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = (self as NSString).size(withAttributes: fontAttributes)
        return ceil(size.width)
    }
}
