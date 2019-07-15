//
//  ViewController.swift
//  Leena
//
//  Created by rakeshios786@gmail.com on 07/09/2019.
//  Copyright (c) 2019 rakeshios786@gmail.com. All rights reserved.
//

import UIKit
import Leena

enum Examples: String {
    case array = "Array Examples"
}

class ViewController: UIViewController {
    @IBOutlet weak var exampleOptionTableView: UITableView!
    
    var examples: [Examples] = [.array]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exampleOptionTableView.delegate = self
        exampleOptionTableView.dataSource = self
        exampleOptionTableView.reloadData()
        
        exampleOptionTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
   
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.examples.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let exampleAtIndex = self.examples[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        cell.selectionStyle = .none
        
        if exampleAtIndex == .array {
            cell.textLabel?.text = exampleAtIndex.rawValue
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let exampleAtIndex = self.examples[indexPath.row]
        if exampleAtIndex == .array {
            let arrayExampleVC = ArrayExamplesViewController.instantiate(fromAppStoryboard: .Main)
            self.navigationController?.pushViewController(arrayExampleVC, animated: true)
        }
    }
    
    
}

