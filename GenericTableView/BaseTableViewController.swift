//
//  BaseTableViewController.swift
//  GenericTableView
//
//  Created by saish chachad on 18/05/19.
//  Copyright © 2019 Heady. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    
    var viewModel:TableViewModel = TableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.items[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: item.reuseId) else {
            fatalError("XXX Fatal error for cell not found at \(indexPath) XXX")
        }
        
        item.configure(cell: cell)
        
        return cell
    }
}
