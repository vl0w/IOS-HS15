//
//  ViewController.swift
//  ModalDemo
//
//  Created by Jonas Hansen on 07/10/15.
//  Copyright © 2015 Jonas Hansen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewCounterLabel: UILabel?
    
    let secondViewController = SecondViewController()
    var appearanceCounter : Int = 0 {
        didSet {
            viewCounterLabel?.text = "ViewCounter: " + appearanceCounter.description
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondViewController.modalTransitionStyle = .CrossDissolve
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showSecondView(sender: UIButton) {
        presentViewController(secondViewController, animated: true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        appearanceCounter++;
    }
    
    @IBAction func backToMainViewClicked(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func dismissWithUnwindAndGoBackToMainView(seque: UIStoryboardSegue){
        // nothing...
    }

}

