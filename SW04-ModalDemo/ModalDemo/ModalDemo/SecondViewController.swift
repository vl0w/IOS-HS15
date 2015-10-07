//
//  SecondViewController.swift
//  ModalDemo
//
//  Created by Jonas Hansen on 07/10/15.
//  Copyright © 2015 Jonas Hansen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backButtonPressed(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
