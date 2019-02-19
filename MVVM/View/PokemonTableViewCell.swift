//
//  PokemonTableViewCell.swift
//  MVVM
//
//  Created by Thobio on 19/02/19.
//  Copyright © 2019 Zerone Consulting. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet var imagePokemon: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var subnameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
