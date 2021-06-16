//
//  MenuViewController.swift
//  menyProject
//
//  Created by Yuliya Ratkevcih on 17.06.20.
//  Copyright © 2020 Yuliya Ratkevcih. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet var menuView: UICollectionView!
    
    @IBOutlet var groupsCollectionView: UICollectionView!
    
    var menu: Menu = Menu()
    var selectedGroup: Group!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.menuView.register(UINib(nibName: "ProductCell", bundle: nil),
                               forCellWithReuseIdentifier: "ProductCell")
        self.menuView.dataSource = self
        self.menuView.delegate = self
        
        
        groupsCollectionView.dataSource = self
        groupsCollectionView.delegate = self
        groupsCollectionView.register(UINib(nibName: "GroupCell", bundle: nil),
                                      forCellWithReuseIdentifier:"GroupCell")
        

        selectedGroup = menu.groups.first
    }

}

extension MenuViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView === groupsCollectionView {
            return menu.groups.count
        } else if collectionView === menuView {
            return selectedGroup.products.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView === groupsCollectionView {
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupCell", for: indexPath) as! GroupCell
                    let group = menu.groups[indexPath.item]
                    cell.setupCell(group: group)
                    return cell
            
            
            
             } else if collectionView === menuView {
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
                    let product = selectedGroup.products[indexPath.item]
                    cell.setupCell(product: product)
                    return cell
            
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView === menuView {
            return CGSize(width: UIScreen.main.bounds.width - 10, height: UIScreen.main.bounds.width)
        }
        
        return CGSize(width: 120, height: 44)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView === groupsCollectionView {
            selectedGroup = menu.groups[indexPath.row]
            menuView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .left, animated: true)
            menuView.reloadData()
        }
    }
    
}



