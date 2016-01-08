//
//  ViewController.swift
//  Frameworks
//
//  Created by Jonas Hansen on 11/11/15.
//  Copyright © 2015 Jonas Hansen. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI
import MapKit

class ViewController: UIViewController, CNContactPickerDelegate, MKMapViewDelegate {

    @IBOutlet weak var firstnameLabel: UILabel!
    @IBOutlet weak var lastnameLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var hsluAnnotation : MKPointAnnotation?
    var trainAnnotation:MKPointAnnotation?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // HSLU annotation
        let hslu = MKPointAnnotation()
        hslu.coordinate = CLLocationCoordinate2DMake(47.014084, 8.305793)
        hslu.title="HSLU"
        hslu.subtitle = "Technik & Architektur"
        self.hsluAnnotation = hslu
        self.mapView.addAnnotation(self.hsluAnnotation!)
        
        // Train annotation
        let train = MKPointAnnotation()
        train.coordinate = CLLocationCoordinate2DMake(47.018337,8.3053473)
        train.title="Horw"
        train.subtitle="Bahnhof"
        self.trainAnnotation = train
        self.mapView.addAnnotation(trainAnnotation!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Button events
    
    @IBAction func pickContactButtonPressed(sender: UIButton) {
        let controller = CNContactPickerViewController()
        controller.delegate = self
        controller.modalTransitionStyle = .CrossDissolve
        self.presentViewController(controller, animated: true, completion: nil)
    }

    @IBAction func editEventButtonPressed(sender: UIButton) {
        
    }
    
    @IBAction func showHSLUButtonPressed(sender: UIButton) {
    }
 
    // MARK: Contact
    func contactPicker(picker: CNContactPickerViewController, didSelectContact contact: CNContact) {
        firstnameLabel.text = contact.givenName
        lastnameLabel.text = contact.familyName
    }
    
    // MARK: Map
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if(annotation.isEqual(self.hsluAnnotation)){
            let view = MKAnnotationView()
            view.image = UIImage(named: "hslu")
            view.canShowCallout = true
            
            // Info button (right callout
            let infoButton = UIButton(type:.InfoLight)
            infoButton.addTarget(self, action: Selector("onHSLUInfoButtonPressed:"), forControlEvents: .TouchUpInside)
            
            view.rightCalloutAccessoryView = infoButton
            
            return view
        }else if(annotation.isEqual(self.trainAnnotation)){
            let view = MKPinAnnotationView()
            view.pinTintColor = UIColor.greenColor()
            view.canShowCallout = true
            return view
        }
        return nil
    }
    
    func onHSLUInfoButtonPressed(sender: UIButton){
        let alertController = UIAlertController(title: "Map Information", message: "Nice, you found it", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}

