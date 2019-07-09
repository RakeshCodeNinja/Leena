//
//  ViewController.swift
//  Leena
//
//  Created by rakeshios786@gmail.com on 07/09/2019.
//  Copyright (c) 2019 rakeshios786@gmail.com. All rights reserved.
//

import UIKit
import Leena


class ViewController: UIViewController {
    @IBOutlet weak var sampleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sampleView.addLongPressGesture {[weak self] (gesture) in
            print("clicked")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

