//
//  ProductCell.swift
//  menyProject
//
//  Created by Yuliya Ratkevcih on 17.06.20.
//  Copyright © 2020 Yuliya Ratkevcih. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet var productImage: UIImageView!
    
    @IBOutlet var nameProduct: UILabel!
    
    @IBOutlet var priceProduct: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.productImage.image = nil
    }
    
    func setupCell(product: Product) {
        self.productImage.image = product.image
        self.nameProduct.text = product.name
        self.priceProduct.text = "\(product.price)"
        

    }

}
