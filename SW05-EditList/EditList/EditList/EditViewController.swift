//
//  EditViewController.swift
//  EditList
//
//  Created by Jonas Hansen on 14/10/15.
//  Copyright © 2015 Jonas Hansen. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var firstnameTextfield: UITextField!
    @IBOutlet weak var lastnameTextfield: UITextField!
    @IBOutlet weak var plzTextfield: UITextField!
    
    var person : Person?
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Appearance
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        firstnameTextfield.text = person?.firstname
        lastnameTextfield.text = person?.lastname
        plzTextfield.text = person?.plz.description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation
    @IBAction func onSaveAndExitButtonPressed(sender: UIButton) {
        person?.firstname = firstnameTextfield.text!
        person?.lastname = lastnameTextfield.text!
        person?.plz = Int(plzTextfield.text!)!
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
