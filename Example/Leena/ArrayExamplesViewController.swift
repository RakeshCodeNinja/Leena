//
//  ArrayExamplesViewController.swift
//  Project Name: Leena
//
//  Created by Rakesh Sharma on 15/07/19.
//  
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import Leena

class ArrayExamplesViewController: UIViewController {
    @IBOutlet weak var numberOfArrayTextField: OnlyNumberTextFields!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        submitButton.onTap { (sender) in
            let arrayOptionsVC = ArrayOptionsViewController.instantiate(fromAppStoryboard: .Main)
            arrayOptionsVC.totalArraysValue = Int(self.numberOfArrayTextField.text ?? "0") ?? 0
            self.navigationController?.pushViewController(arrayOptionsVC, animated: true)
        }
        
    }
    

  
}
