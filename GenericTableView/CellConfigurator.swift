//
//  CellConfigurator.swift
//  GenericTableView
//
//  Created by saish chachad on 18/05/19.
//  Copyright © 2019 Heady. All rights reserved.
//

import Foundation
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
//protocol Reusable: class {
//    static var reuseIdentifier: String { get }
//    static var nib: UINib? { get }
//}
//
//extension Reusable {
//    static var reuseIdentifier: String { return String(Self) }
//    static var nib: UINib? { return nil }
//}
//
//extension UITableView {
//    func registerReusableCell<T: UITableViewCell>(_: T.Type) where T: Reusable {
//        if let nib = T.nib {
//            self.register(nib, forCellReuseIdentifier: T.reuseIdentifier)
//        } else {
//            self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
//        }
//    }
//
//    func dequeueReusableCell<T: UITableViewCell>(indexPath: NSIndexPath) -> T where T: Reusable {
//        return self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as! T
//    }
//
//    func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_: T.Type) where T: Reusable {
//        if let nib = T.nib {
//            self.register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
//        } else {
//            self.register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
//        }
//    }
//
//    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T? where T: Reusable {
//        return self.dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as! T?
//    }
//}
//
//extension UICollectionView {
//    func registerReusableCell<T: UICollectionViewCell>(_: T.Type) where T: Reusable {
//        if let nib = T.nib {
//            self.register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
//        } else {
//            self.register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
//        }
//    }
//
//    func dequeueReusableCell<T: UICollectionViewCell>(indexPath: NSIndexPath) -> T where T: Reusable {
//        return self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as! T
//    }
//
//    func registerReusableSupplementaryView<T: Reusable>(elementKind: String, _: T.Type) {
//        if let nib = T.nib {
//            self.register(nib, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.reuseIdentifier)
//        } else {
//            self.register(T.self, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.reuseIdentifier)
//        }
//    }
//
//    func dequeueReusableSupplementaryView<T: UICollectionViewCell>(elementKind: String, indexPath: NSIndexPath) -> T where T: Reusable {
//        return self.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as! T
//    }
//}

