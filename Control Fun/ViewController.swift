//
//  ViewController.swift
//  Control Fun
//
//  Created by tujiaw on 14-9-21.
//  Copyright (c) 2014年 tujiaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.sliderLabel.text = "50"
        var buttonImageNormal = UIImage(named:"whiteButton.png")
        var insets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        var stretchableButtonImageNormal = buttonImageNormal.resizableImageWithCapInsets(insets)
        self.doSomethingButton.setBackgroundImage(stretchableButtonImageNormal, forState: UIControlState.Normal)
        
        var buttonImagePressed = UIImage(named: "blueButton.png")
        var stretchableButtonImagePressed = buttonImagePressed.resizableImageWithCapInsets(insets)
        self.doSomethingButton.setBackgroundImage(stretchableButtonImagePressed, forState: UIControlState.Highlighted)
        
        self.doSomethingButton.sizeToFit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var doSomethingButton: UIButton!
    
    @IBAction func textFieldDoneEditing(sender:AnyObject) {
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTap(sender: AnyObject) {
        self.nameField.resignFirstResponder()
        self.numberField.resignFirstResponder()
    }
    
    @IBAction func sliderChanged(sender: AnyObject) {
        self.sliderLabel.text = "\(lroundf(sender.value))"
        
    }
    
    @IBAction func toggleControls(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.leftSwitch.hidden = false
            self.rightSwitch.hidden = false
            self.doSomethingButton.hidden = true
        } else {
            self.leftSwitch.hidden = true
            self.rightSwitch.hidden = true
            self.doSomethingButton.hidden = false
        }
    }
    
    @IBAction func switchChanged(sender: UISwitch) {
        self.leftSwitch.setOn(sender.on, animated: true)
        self.rightSwitch.setOn(sender.on, animated: true)
    }
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        var title = "Something was done"
        var message = ""
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.ActionSheet);
        var actionOk = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default) {
            (a:UIAlertAction!) in
            println("Ok")
        }
        
        var actionCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) {
            (a:UIAlertAction!) -> Void in
            var str = "Cancel"
            println(str)
        }
        
        alert.addAction(actionOk)
        alert.addAction(actionCancel)
        self.presentViewController(alert, animated: true, nil)
    }
}

