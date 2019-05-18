//
//  UserCell.swift
//  GenericTableView
//
//  Created by saish chachad on 18/05/19.
//  Copyright © 2019 Heady. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell, ConfigurableCell {

    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imageUser.layer.cornerRadius = 5.0
        self.imageUser.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(data user: User) {
        self.imageUser.image = UIImage(named: user.image)
        self.labelName.text = user.name
        self.labelDescription.text = user.description
    }
    
}
