//
//  ViewController.swift
//  UniversalApp
//
//  Created by Jonas Hansen on 24/10/15.
//  Copyright © 2015 Jonas Hansen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var byLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let localizedText = NSLocalizedString("CustomLocalization", comment: "reeekt")
        byLabel.text = byLabel.text! + localizedText
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

