//
//  UITableView+Extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

#if canImport(UIKit)
import UIKit

public extension UITableView {
    
    var indexPathForLastRow: IndexPath? {
        return indexPathForLastRow(inSection: lastSection)
    }
    
    var lastSection: Int {
        return numberOfSections > 0 ? numberOfSections - 1 : 0
    }
    
}

public extension UITableView {
    func registerIDCells<T: UITableViewCell>(cellTypes: [T.Type]) {
        cellTypes.forEach { self.registerIDCell(cellType: $0) }
    }
    
    func registerIDCells<T: UITableViewCell>(cellClasses: [T.Type]) {
        cellClasses.forEach { self.registerIDCell(cellClass: $0) }
    }
    
    func registerIDCell<T: UITableViewCell>(cellType: T.Type) {
        let nib = UINib(nibName: cellType.identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: cellType.identifier)
    }
    
    func registerIDCell<T: UITableViewCell>(cellClass: T.Type) {
        self.register(cellClass, forCellReuseIdentifier: cellClass.identifier)
    }
    
    func dequeueReusableIDCell<T: UITableViewCell>(_ type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as! T
    }
    
    func removeExtraSeparatorLines() {
        self.tableFooterView = UIView(frame: .zero)
    }
    
    func setHeights(rowHeight: CGFloat, estimatedRowHeight: CGFloat) {
        self.rowHeight = rowHeight
        self.estimatedRowHeight = estimatedRowHeight
    }
    
    func setAutomaticDimensionHeights() {
        self.rowHeight = UITableView.automaticDimension
        self.estimatedRowHeight = UITableView.automaticDimension
    }
    
    
    func setDelegateAndDataSource<T: UITableViewDelegate & UITableViewDataSource>(to object: T) {
        self.delegate = object
        self.dataSource = object
    }
    
    func removeBackgroundView() {
        self.backgroundView = nil
    }
    
    func reloadDataWithAutoSizingCellWorkAround() {
        self.reloadData()
        self.setNeedsLayout()
        self.layoutIfNeeded()
        self.reloadData()
    }
    
    func numberOfRows() -> Int {
        var section = 0
        var rowCount = 0
        while section < numberOfSections {
            rowCount += numberOfRows(inSection: section)
            section += 1
        }
        return rowCount
    }
    
    func indexPathForLastRow(inSection section: Int) -> IndexPath? {
        guard section >= 0 else { return nil }
        guard numberOfRows(inSection: section) > 0  else {
            return IndexPath(row: 0, section: section)
        }
        return IndexPath(row: numberOfRows(inSection: section) - 1, section: section)
    }
    
    func reloadData(_ completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0, animations: {
            self.reloadData()
        }, completion: { _ in
            completion()
        })
    }
    
    func removeTableFooterView() {
        tableFooterView = nil
    }
    
    func removeTableHeaderView() {
        tableHeaderView = nil
    }
    
    func scrollToBottom(animated: Bool = true) {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
        setContentOffset(bottomOffset, animated: animated)
    }
    
    func scrollToTop(animated: Bool = true) {
        setContentOffset(CGPoint.zero, animated: animated)
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(withClass name: T.Type) -> T {
        guard let headerFooterView = dequeueReusableHeaderFooterView(withIdentifier: String(describing: name)) as? T else {
            fatalError("Couldn't find UITableViewHeaderFooterView for \(String(describing: name)), make sure the view is registered with table view")
        }
        return headerFooterView
    }
    
    func register<T: UITableViewHeaderFooterView>(nib: UINib?, withHeaderFooterViewClass name: T.Type) {
        register(nib, forHeaderFooterViewReuseIdentifier: String(describing: name))
    }
    
    func register<T: UITableViewHeaderFooterView>(headerFooterViewClassWith name: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: String(describing: name))
    }
    
    func register<T: UITableViewCell>(cellWithClass name: T.Type) {
        register(T.self, forCellReuseIdentifier: String(describing: name))
    }
    
    func register<T: UITableViewCell>(nib: UINib?, withCellClass name: T.Type) {
        register(nib, forCellReuseIdentifier: String(describing: name))
    }
    
    func register<T: UITableViewCell>(nibWithCellClass name: T.Type, at bundleClass: AnyClass? = nil) {
        let identifier = String(describing: name)
        var bundle: Bundle?
        
        if let bundleName = bundleClass {
            bundle = Bundle(for: bundleName)
        }
        
        register(UINib(nibName: identifier, bundle: bundle), forCellReuseIdentifier: identifier)
    }
   
    func isValidIndexPath(_ indexPath: IndexPath) -> Bool {
        return indexPath.section < numberOfSections && indexPath.row < numberOfRows(inSection: indexPath.section)
    }
    
    func safeScrollToRow(at indexPath: IndexPath, at scrollPosition: UITableView.ScrollPosition, animated: Bool) {
        guard indexPath.section < numberOfSections else { return }
        guard indexPath.row < numberOfRows(inSection: indexPath.section) else { return }
        scrollToRow(at: indexPath, at: scrollPosition, animated: animated)
    }

    func heightOfVisibleCells() -> CGFloat {
        return self.visibleCells.map({ $0.frame.height }).reduce(0, +)
    }
    
}

#endif
