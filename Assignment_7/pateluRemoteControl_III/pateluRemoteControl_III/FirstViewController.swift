//
//  FirstViewController.swift
//  pateluRemoteControl_III
//
//  Created by Urvi Patel on 2/11/16.
//  Copyright © 2016 Urvi Patel. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var powerSwitch: UISwitch!
    @IBOutlet weak var volumeSlider: UISlider!
    

    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    
    @IBOutlet weak var button6: UIButton!
    
    @IBOutlet weak var button7: UIButton!
    
    @IBOutlet weak var button8: UIButton!
    
    @IBOutlet weak var button9: UIButton!
    
    @IBOutlet weak var buttonChPlus: UIButton!
    
    @IBOutlet weak var buttonChMinus: UIButton!
    
    @IBAction func channelPressed(sender: UIButton) {
        channel = channel + sender.currentTitle!;
        channelLabel.text = channel;
        
        if channel == "00" {
            channelLabel.text = "0";
        }
        
        if channel.characters.count > 2 {
            channel = sender.currentTitle!;
            channelLabel.text = channel;
        }
        
    }
    
    
    
    @IBAction func channelIncremented(sender: UIButton) {
        if channelLabel.text == "99"
        {
            channelLabel.text = "01";
        }
            
        else
        {
            let chInt = Int(channelLabel.text!)! + 1;
            if(chInt < 10) {
                channelLabel.text = "0" + String(chInt);
            }
            else {
                channelLabel.text = String(chInt);
            }
        }
        
    }
    
    
    
    @IBAction func channelDecremented(sender: UIButton) {
        if channelLabel.text == "01"
        {
            channelLabel.text = "99";
        }
            
        else
        {
            let chInt = Int(channelLabel.text!)! - 1;
            if(chInt < 10) {
                channelLabel.text = "0" + String(chInt);
            }
            else {
                 channelLabel.text = String(chInt);
            }
        }
    }
    
    
    
    @IBOutlet weak var favorites: UISegmentedControl!
    
    var channel: String = "";
    
    var favoritesDictionary = ["2":"CBS", "5":"NBC", "7":"ABC", "9":"WGN"];
    
    @IBAction func powerToggled(sender: UISwitch) {
        powerLabel.text = powerSwitch.on ? "On" : "Off";
        volumeSlider.enabled = powerSwitch.on;
        favorites.enabled = powerSwitch.on;
        button0.enabled = powerSwitch.on;
        button1.enabled = powerSwitch.on;
        button2.enabled = powerSwitch.on;
        button3.enabled = powerSwitch.on;
        button4.enabled = powerSwitch.on;
        button5.enabled = powerSwitch.on;
        button6.enabled = powerSwitch.on;
        button7.enabled = powerSwitch.on;
        button8.enabled = powerSwitch.on;
        button9.enabled = powerSwitch.on;
        buttonChPlus.enabled = powerSwitch.on;
        buttonChMinus.enabled = powerSwitch.on;
    }
    
    
    @IBAction func volumeChanged(sender: UISlider) {
        let vol = Int(volumeSlider.value * 100);
        volumeLabel.text = "\(vol)";
    }
    
    
    
    
    @IBAction func favoritesSelected(sender: UISegmentedControl) {
        let zero: String = "0";
        let value = favorites.titleForSegmentAtIndex(favorites.selectedSegmentIndex)
        var channelFromDictionary = findKey(value!);
        
        let chInt = Int(channelFromDictionary);
        if chInt < 10 {
            channelFromDictionary = zero + channelFromDictionary;
        }
        
        channelLabel.text = channelFromDictionary;
    }
    
    func findKey(val: String) -> String
    {
        for(key, value) in favoritesDictionary {
            if(value == val) {
                return key;
            }
        }
        return "";
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        powerLabel.text = powerSwitch.on ? "On" : "Off";
        let val = Int(volumeSlider.value * 100);
        volumeLabel.text = "\(val)";
        favorites.selectedSegmentIndex = -1;
        channelLabel.text = "01";

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        //channelLabel.text = ConfigurationSettings.sharedInstance.favoriteChannel;
        let favChannel = ConfigurationSettings.sharedInstance.favoriteChannel;
        let favLabel = ConfigurationSettings.sharedInstance.favoriteLabel;
        favoritesDictionary[favChannel] = favLabel;
       favorites.setTitle(ConfigurationSettings.sharedInstance.favoriteLabel, forSegmentAtIndex: ConfigurationSettings.sharedInstance.favoriteIndex);
       
    }

}

