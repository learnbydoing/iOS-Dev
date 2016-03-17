//
//  SettingsViewController.swift
//  pateluRemoteControl_III
//
//  Created by Urvi Patel on 2/13/16.
//  Copyright © 2016 Urvi Patel. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {

    @IBOutlet weak var favorites: UISegmentedControl!
    @IBOutlet weak var labelTextField: UITextField!
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    var index: Int = -1;
    var initialChannelValue = "";
    var initialLabel  = "";
    
    @IBAction func stepperPressed(sender: UIStepper) {
        channelLabel.text = String(Int(sender.value));
    }
    
    @IBAction func cancel(sender: UIButton) {
        labelTextField.text = initialLabel;
        channelLabel.text = initialChannelValue;
    }
    
    @IBAction func save(sender: UIButton) {
        if labelTextField.text?.characters.count > 4 || labelTextField.text?.characters.count < 1 {
            let alertController = UIAlertController(title: "Invalid input",
                message: "Label must be 1 to 4 characters in length", preferredStyle: .Alert)
            let cancelAlertAction = UIAlertAction(title: "OK",
                style: .Cancel, handler: nil)
            alertController.addAction(cancelAlertAction)
            self.presentViewController(alertController, animated: true,completion: nil);
            return;
        }
        ConfigurationSettings.sharedInstance.favoriteChannel = channelLabel.text!;
        ConfigurationSettings.sharedInstance.favoriteIndex = index;
        ConfigurationSettings.sharedInstance.favoriteLabel = labelTextField.text!;
    }
    
    
    
    @IBAction func enteredLabelName(sender: UITextField) {
        sender.resignFirstResponder();
    }
    

    @IBAction func favoriteButtonSelected(sender: UISegmentedControl) {
        index = sender.selectedSegmentIndex;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        channelLabel.text = "1";
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        channelLabel.text = ConfigurationSettings.sharedInstance.favoriteChannel;
        initialChannelValue = channelLabel.text!;
        index = ConfigurationSettings.sharedInstance.favoriteIndex;
        labelTextField.text = ConfigurationSettings.sharedInstance.favoriteLabel;
        initialLabel = labelTextField.text!;
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
