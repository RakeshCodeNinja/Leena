//
//  UIRefreshControl+Extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 10/07/19.
//  
//  
//

#if os(iOS)
import UIKit

public extension UIRefreshControl {
   
    func beginRefreshing(in tableView: UITableView, animated: Bool, sendAction: Bool = false) {
        assert(superview == tableView, "Refresh control does not belong to the receiving table view")
        
        beginRefreshing()
        let offsetPoint = CGPoint(x: 0, y: -frame.height)
        tableView.setContentOffset(offsetPoint, animated: animated)
        
        if sendAction {
            sendActions(for: .valueChanged)
        }
    }
    
}

#endif

