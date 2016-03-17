//
//  ViewController.swift
//  pateluRemoteControl
//
//  Created by Urvi Patel on 1/30/16.
//  Copyright © 2016 Urvi Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    
    @IBOutlet weak var favorites: UISegmentedControl!
    
    var isTyping: Bool = false;
    
    var channel: String = "";
    
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
            channelLabel.text = "1";
        }
        
        else
        {
            channelLabel.text = String(Int(channelLabel.text!)! + 1);
        }
    }
    
    
    
    @IBAction func channelDecremented(sender: UIButton) {
        
        if channelLabel.text == "1"
        {
            channelLabel.text = "99";
        }
        
        else
        {
            channelLabel.text = String(Int(channelLabel.text!)! - 1);
        }
    }
    
    
    @IBAction func favoriteSelected(sender: UISegmentedControl) {
        
        if(sender.selectedSegmentIndex == 0) {
            channelLabel.text = "02"
        }
        
        if(sender.selectedSegmentIndex == 1) {
            channelLabel.text = "05"
        }
        
        if(sender.selectedSegmentIndex == 2) {
            channelLabel.text = "07"
        }
        
        if(sender.selectedSegmentIndex == 3) {
            channelLabel.text = "09"
        }
        
        
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        powerLabel.text = powerSwitch.on ? "On" : "Off";
        
        let val = Int(volumeSlider.value * 100);
        volumeLabel.text = "\(val)";
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

