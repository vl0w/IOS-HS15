//
//  ViewController.swift
//  SwiftProgrammers
//
//  Created by Jonas Hansen on 23/09/15.
//  Copyright © 2015 Jonas Hansen. All rights reserved.
//

import UIKit

struct UIConstants{
    static let TITLE_LABEL_HEIGHT:CGFloat = 50
    static let TITLE_LABEL_Y : CGFloat = 50
    static let TITLE_LABEL_MARGIN_BOTTOM:CGFloat = 30
    
    static let NAME_LABEL_HEIGHT:CGFloat = 30
    static let NAME_LABEL_OFFSET:CGFloat = 10
    
    static let USE_PERSON_DATE : Bool = true
}


class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blackColor()
        
        // Title frame
        let titleFrame = CGRect(x: 0, y: UIConstants.TITLE_LABEL_Y, width: self.view.bounds.width, height: UIConstants.TITLE_LABEL_HEIGHT)
        let titleLabel = UILabel(frame: titleFrame)
        titleLabel.text="Swift is the shit!"
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.font = UIFont.systemFontOfSize(UIConstants.TITLE_LABEL_HEIGHT*0.9)
        titleLabel.textColor = UIColor.orangeColor()
        
        // Add labels
        if(UIConstants.USE_PERSON_DATE){
            for (index,person) in DataProvider.sharedInstance.memberPersons.enumerate(){
                addLabel(person, inPosition: index)
            }
        }else{
            for (index, name) in DataProvider.sharedInstance.memberNames.enumerate(){
                addLabel(name, inPosition: index)
            }
        }
        self.view.addSubview(titleLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addLabel(name: String, inPosition position:Int){
        // Initialize label
        let nameLabel = UILabel(frame: getLabelPosition(position))
        nameLabel.text = name
        nameLabel.font = UIFont.systemFontOfSize(UIConstants.NAME_LABEL_HEIGHT*0.9)
        
        // Font color
        switch(position%3){
        case 1:
            nameLabel.textColor = UIColor.redColor()
        case 2:
            nameLabel.textColor = UIColor.blueColor()
        default:
            nameLabel.textColor = UIColor.greenColor()
        }
        
        // Position
        switch(position%2){
        case 1:
            nameLabel.textAlignment = NSTextAlignment.Left
        default:
            nameLabel.textAlignment = NSTextAlignment.Right
        }
        
        self.view.addSubview(nameLabel)
    }
    
    func addLabel(person: Person, inPosition position:Int){
        let firstNameLabel = UILabel(frame: getLabelPosition(position))
        firstNameLabel.text = person.firstname
        firstNameLabel.font = UIFont.systemFontOfSize(UIConstants.NAME_LABEL_HEIGHT*0.9)
        firstNameLabel.textColor = UIColor.greenColor()
        firstNameLabel.textAlignment = NSTextAlignment.Left
        self.view.addSubview(firstNameLabel)
        
        let lastNameLabel = UILabel(frame: getLabelPosition(position))
        lastNameLabel.text = person.lastname
        lastNameLabel.font = UIFont.systemFontOfSize(UIConstants.NAME_LABEL_HEIGHT*0.9)
        lastNameLabel.textColor = UIColor.greenColor()
        lastNameLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(lastNameLabel)
        
        let plzNameLabel = UILabel(frame: getLabelPosition(position))
        plzNameLabel.text = person.plz.description
        plzNameLabel.font = UIFont.systemFontOfSize(UIConstants.NAME_LABEL_HEIGHT*0.9)
        plzNameLabel.textColor = UIColor.greenColor()
        plzNameLabel.textAlignment = NSTextAlignment.Right
        self.view.addSubview(plzNameLabel)
    }
    
    private func getLabelPosition(position:Int) -> CGRect{
        let yPos = UIConstants.TITLE_LABEL_Y+UIConstants.TITLE_LABEL_HEIGHT+UIConstants.TITLE_LABEL_MARGIN_BOTTOM + CGFloat(position) * (UIConstants.NAME_LABEL_HEIGHT+UIConstants.NAME_LABEL_OFFSET);
        return CGRect(x: 0, y: yPos, width: self.view.bounds.width, height: UIConstants.NAME_LABEL_HEIGHT)
    }
}

