//
//  DetailViewController.swift
//  EditList
//
//  Created by Jonas Hansen on 14/10/15.
//  Copyright © 2015 Jonas Hansen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var firstnameLabel: UILabel!
    @IBOutlet weak var lastnameLabel: UILabel!
    @IBOutlet weak var postalCodeLabel: UILabel!

    var detailItem: Person?
    
    override func viewWillAppear(animated: Bool) {
        firstnameLabel.text=detailItem?.firstname
        lastnameLabel.text=detailItem?.lastname
        postalCodeLabel.text=detailItem?.plz.description
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let editViewController = segue.destinationViewController as! EditViewController
        editViewController.modalTransitionStyle = .CrossDissolve
        editViewController.person = detailItem
    }
}

