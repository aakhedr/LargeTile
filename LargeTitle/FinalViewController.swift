//
//  FinalViewController.swift
//  LargeTitle
//
//  Created by Ahmed Khedr on 10/3/17.
//  Copyright © 2017 Ahmed Khedr. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {

    @IBOutlet weak var objectLabel: UILabel!
    var object: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        objectLabel.text = object
        
        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .never
        }
    }
}
