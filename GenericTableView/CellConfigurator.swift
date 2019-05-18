//
//  CellConfigurator.swift
//  GenericTableView
//
//  Created by saish chachad on 18/05/19.
//  Copyright © 2019 Heady. All rights reserved.
//

import UIKit

protocol ConfigurableCell {
    associatedtype DataType
    func configure(data: DataType)
}

protocol CellConfigurator {
    var reuseId: String { get }
    func configure(cell: UIView)
}

protocol Reusable {}

extension UITableViewCell: Reusable {}

extension Reusable where Self: UITableViewCell {
    static var nameId: String {
        return String(describing: self)
    }
}

class TableCellConfigurator<CellType: ConfigurableCell, DataType>: CellConfigurator where CellType.DataType == DataType, CellType: UITableViewCell {
    
    var reuseId: String { return String(describing: CellType.self) }
    
    let item: DataType
    
    init(item: DataType) {
        self.item = item
    }
    
    func configure(cell: UIView) {
        (cell as! CellType).configure(data: item)
    }
}

extension UITableView {
    
    func registerCell<Cell: UITableViewCell>(_ cellClass: Cell.Type) {
        register(UINib(nibName: cellClass.nameId, bundle: nil), forCellReuseIdentifier: cellClass.nameId)
    }
    
    func dequeueReusableCell<Cell: UITableViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withIdentifier: Cell.nameId, for: indexPath) as? Cell else { fatalError("Fatal error for cell at \(indexPath)")}
        return cell
    }
    
}

