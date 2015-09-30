//
//  ViewController.swift
//  IB-DEMO
//
//  Created by Jonas Hansen on 30/09/15.
//  Copyright © 2015 Jonas Hansen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var startStopSpinnerButton: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    private var zone : Bool  = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderValueChanged(slider)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderValueChanged(sender: UISlider) {
        sliderLabel.text = String(format: "Value: %.2f", sender.value)
        
        if(sender.value>=90 && !zone){
            showSimpleOkAlert("Slider Alert", withMessage: "You entered the zone")
            zone=true
        }
        
        if(sender.value<90 && zone){
            showSimpleOkAlert("Slider Alert", withMessage: "You exited the zone")
            zone=false
        }
    }
    
    private func showSimpleOkAlert(title: String, withMessage message: String ){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil));
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    @IBAction func backgroundColorChanged(sender: UISegmentedControl) {
        
        let colorIndex = sender.selectedSegmentIndex
        
        if(colorIndex==0){
            self.view.backgroundColor = UIColor.whiteColor()
        }else{
            self.view.backgroundColor = UIColor.grayColor()
        }
    }
    
    @IBAction func startStopSpinnerClicked(sender: UIButton) {
        if(spinner.isAnimating()){
            spinner.stopAnimating()
            startStopSpinnerButton.setTitle("Start spinning", forState: .Normal)
        }else{
            spinner.startAnimating()
            startStopSpinnerButton.setTitle("Stop spinning", forState: .Normal)
        }
        
    }
    
    @IBAction func infoButtonPressed(sender: UIButton) {
        let alertController = UIAlertController(title: "Information", message: "Wow, you did it.", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        alertController.addAction(UIAlertAction(title: "...really?", style: .Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}

