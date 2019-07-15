//
//  ArrayOptionsViewController.swift
//  Project Name: Leena
//
//  Created by Rakesh Sharma on 15/07/19.
//  
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import Leena

class ArrayOptionsViewController: UIViewController {
    @IBOutlet weak var arrayTableView: UITableView!
    @IBOutlet weak var submitButton: UIButton!
    
    var totalArraysValue = 0
    var allValues = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if totalArraysValue > 0 {
            for _ in 0..<totalArraysValue {
                self.allValues.append(0)
            }
        }
        
        arrayTableView.tableFooterView = UIView()
        
        arrayTableView.delegate = self
        arrayTableView.dataSource = self
        arrayTableView.reloadData()
        
        submitButton.onTap {[weak self] (_) in
            if self?.allValues.count ?? 0 > 0 {
               let arrayManupulateViewController = ArrayManupulateViewController.instantiate(fromAppStoryboard: .Main)
                arrayManupulateViewController.allValues = self?.allValues ?? [Int]()
                self?.navigationController?.pushViewController(arrayManupulateViewController)
            }
        }
        
    }
    

}

extension ArrayOptionsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArrayTableViewCell") as? ArrayTableViewCell else { return UITableViewCell() }
        cell.arrayTextField.text = "\(self.allValues[indexPath.row])"
        
        cell.arrayTextField.on(.editingChanged) {[weak self] (sender) in
            self?.allValues[indexPath.row] = Int(sender.text ?? "0") ?? 0
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}


class ArrayTableViewCell: UITableViewCell {
    @IBOutlet weak var arrayTextField: OnlyNumberTextFields!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
}
