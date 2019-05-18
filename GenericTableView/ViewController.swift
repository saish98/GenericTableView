//
//  ViewController.swift
//  GenericTableView
//
//  Created by saish chachad on 18/05/19.
//  Copyright © 2019 Heady. All rights reserved.
//

import UIKit

class ViewController: BaseTableViewController {
    
    override func viewDidLoad() {
        
        //1: Initialisation
        super.viewDidLoad()
        
        //2: Registration
        self.tableView.registerCell(UserCell.self)
        self.tableView.registerCell(MessageCell.self)
        self.tableView.registerCell(ImageCell.self)
        
        //3: Data Transmission
        self.viewModel = TableViewModel()
    }
    
}

