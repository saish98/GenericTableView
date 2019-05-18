//
//  ImageCell.swift
//  GenericTableView
//
//  Created by saish chachad on 18/05/19.
//  Copyright © 2019 Heady. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell, ConfigurableCell {

    @IBOutlet weak var imageBanner: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(data image: Image) {
        self.imageBanner.image = UIImage(named: image.name)
    }
    
}
