//
//  serviceCellTableViewCell.swift
//  PuertaDeHierro
//
//  Created by Juan Andrés Rocha Díaz on 26/01/17.
//  Copyright © 2017 Juan Andrés Rocha Díaz. All rights reserved.
//

import UIKit

class serviceCellTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
