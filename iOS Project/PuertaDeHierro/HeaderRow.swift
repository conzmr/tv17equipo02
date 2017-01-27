//
//  HeaderRow.swift
//  PuertaDeHierro
//
//  Created by Juan Andrés Rocha Díaz on 27/01/17.
//  Copyright © 2017 Juan Andrés Rocha Díaz. All rights reserved.
//

import UIKit

class HeaderRow: UITableViewCell, UICollectionViewDataSource {
    
    var cat:Header? = nil
    var phone:String = ""
    var maps:String = ""
    
    
    var delegate: ShowOptionsDelegate? = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cat!.object.count
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "subCell", for: indexPath) as! subCellCollectionViewCell
        cell.image.image = cat?.object[indexPath.row].img
        cell.label.text = cat?.object[indexPath.row].name
        cell.descLabel.text = cat?.object[indexPath.row].address
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.showOptions(name: (self.cat?.name)!, option: indexPath.row)
    }
    
}

extension HeaderRow : UICollectionViewDelegateFlowLayout {
    
   /* func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow:CGFloat = 1.25
        let hardCodedPadding:CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - (2*hardCodedPadding)
        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
        return CGSize(width: itemWidth, height: itemHeight)
    }*/
    
}

