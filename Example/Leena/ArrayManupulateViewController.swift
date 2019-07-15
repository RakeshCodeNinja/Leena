//
//  ArrayManupulateViewController.swift
//  Project Name: Leena
//
//  Created by Rakesh Sharma on 15/07/19.
//  
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class ArrayManupulateViewController: UIViewController {
    enum ArrayManipulation: String {
        case contains = "Contains an Element"
    }
    
    @IBOutlet weak var arrayTableView: UITableView!
    
    var allValues = [Int]()
    var allOptions = [ArrayManipulation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allOptions = [.contains]
        
        arrayTableView.delegate = self
        arrayTableView.dataSource = self
        arrayTableView.reloadData()
        
        arrayTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

    }

    func containsFunction() {
        let ac = UIAlertController(title: "Enter a number to find in existing array", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned ac] _ in
            let answer = ac.textFields![0]
            if !answer.isEmpty {
                let result = self.allValues.contains(Int(answer.text ?? "0") ?? 0)
                if result {
                        self.showAlert(title: "Success!!!", message: "Found")
                } else {
                    self.showAlert(title: "Error!!!", message: "Not Found")
                }
            } else {
                self.showAlert(title: "Warning!!!", message: "Enter a number")
            }
        }
        
        ac.addAction(submitAction)
        
        present(ac, animated: true)
    }

}

extension ArrayManupulateViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let exampleAtIndex = self.allOptions[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.textLabel?.text = exampleAtIndex.rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let exampleAtIndex = self.allOptions[indexPath.row]
        switch exampleAtIndex {
        case .contains:
            self.containsFunction()
        }
    }
    
    
}

