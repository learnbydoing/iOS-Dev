//
//  dvrController.swift
//  pateluRemoteControl
//
//  Created by Urvi Patel on 2/6/16.
//  Copyright © 2016 Urvi Patel. All rights reserved.
//

import UIKit

class dvrController: UIViewController {
    
    enum DVRState: String {
                case Stopped = "Stopped"
                case Playing = "Playing"
                case Paused = "Paused"
                case FastForwarding = "Fast forwarding"
                case FastRewinding = "Fast rewinding"
                case Recording = "Recording"
                var name: String {return self.rawValue}
    }
    
    @IBOutlet weak var dvrPowerLabel: UILabel!
    
    @IBOutlet weak var dvrStateLabel: UILabel!

    @IBOutlet weak var dvrSwitch: UISwitch!
    
    
    @IBOutlet weak var playButton: UIButton!
    
    
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var pauseButton: UIButton!
    
    @IBOutlet weak var fastForwardButton: UIButton!
    
    @IBOutlet weak var rewindButton: UIButton!
    
    @IBOutlet weak var recordButton: UIButton!
    

    @IBAction func play(sender: UIButton) {
        if dvrStateLabel.text! != DVRState.Recording.name{
            dvrStateLabel.text = DVRState.Playing.name;
        }
        else
        {
            let optionMenu = UIAlertController(title: nil, message: "\(DVRState.Playing.name) not allowed from \(DVRState.Recording.name) state", preferredStyle: .ActionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
                (alert: UIAlertAction!) -> Void in
                return;
            })
            let forceAction = UIAlertAction(title: "Force", style: .Default, handler: {
                (alert: UIAlertAction!) -> Void in
                let alertController = UIAlertController(title: "Force Action",
                    message: "\(DVRState.Recording.name) has been stopped and DVR put in \(DVRState.Playing.name) state", preferredStyle: .Alert)
                let cancelAlertAction = UIAlertAction(title: "OK",
                    style: .Cancel, handler: nil)
                alertController.addAction(cancelAlertAction)
                self.presentViewController(alertController, animated: true,completion: {self.dvrStateLabel.text =  DVRState.Playing.name})
                })
            optionMenu.addAction(cancelAction);
            optionMenu.addAction(forceAction);
            self.presentViewController(optionMenu, animated: true, completion: nil)
        }
    }

    
    @IBAction func stop(sender: UIButton) {
        dvrStateLabel.text = DVRState.Stopped.name;
    }
    
    @IBAction func pause(sender: UIButton) {
        if dvrStateLabel.text! == DVRState.Playing.name {
            dvrStateLabel.text = DVRState.Paused.name;
            return;
        }
            
        if dvrStateLabel.text! == DVRState.Paused.name {
            dvrStateLabel.text = DVRState.Playing.name;
            return;
        }
        else
        {
            let state = dvrStateLabel.text!;
            let optionMenu = UIAlertController(title: nil, message: "\(DVRState.Paused.name) only allowed from \(DVRState.Playing.name) state", preferredStyle: .ActionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
                (alert: UIAlertAction!) -> Void in
                return;
            })
            let forceAction = UIAlertAction(title: "Force", style: .Default, handler: {
                (alert: UIAlertAction!) -> Void in
                let alertController = UIAlertController(title: "Force Action",
                    message: "Current state \"\(state)\" has been stopped and DVR put in \(DVRState.Paused.name) state", preferredStyle: .Alert)
                let cancelAlertAction = UIAlertAction(title: "OK",
                    style: .Cancel, handler: nil)
                alertController.addAction(cancelAlertAction)
                self.presentViewController(alertController, animated: true,completion: {self.dvrStateLabel.text = DVRState.Paused.name})
            })
            optionMenu.addAction(cancelAction);
            optionMenu.addAction(forceAction);
            self.presentViewController(optionMenu, animated: true, completion: nil)
        }
    }
    
    @IBAction func fastForward(sender: UIButton) {
        if dvrStateLabel.text! == DVRState.Playing.name || dvrStateLabel.text! == DVRState.FastForwarding.name {
                dvrStateLabel.text = DVRState.FastForwarding.name;
            }
           else
            {
                let state = dvrStateLabel.text!;
                let optionMenu = UIAlertController(title: nil, message: "\(DVRState.FastForwarding.name) only allowed from \(DVRState.Playing.name) state", preferredStyle: .ActionSheet)
                let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
                    (alert: UIAlertAction!) -> Void in
                    return;
                })
                let forceAction = UIAlertAction(title: "Force", style: .Default, handler: {
                    (alert: UIAlertAction!) -> Void in
                    let alertController = UIAlertController(title: "Force Action",
                        message: "Current state \"\(state)\" has been stopped and DVR put in \(DVRState.FastForwarding.name) state", preferredStyle: .Alert)
                    let cancelAlertAction = UIAlertAction(title: "OK",
                        style: .Cancel, handler: nil)
                    alertController.addAction(cancelAlertAction)
                    self.presentViewController(alertController, animated: true,completion: {self.dvrStateLabel.text = DVRState.FastForwarding.name})
                })
                optionMenu.addAction(cancelAction);
                optionMenu.addAction(forceAction);
                self.presentViewController(optionMenu, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func rewind(sender: UIButton) {
        if dvrStateLabel.text! == DVRState.Playing.name || dvrStateLabel.text! == DVRState.FastRewinding.name{
            dvrStateLabel.text = DVRState.FastRewinding.name;
        }
            
        else
        {
            let state = dvrStateLabel.text!;
            let optionMenu = UIAlertController(title: nil, message: "\(DVRState.FastRewinding.name) only allowed from \(DVRState.Playing.name) state", preferredStyle: .ActionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
                (alert: UIAlertAction!) -> Void in
                return;
            })
            let forceAction = UIAlertAction(title: "Force", style: .Default, handler: {
                (alert: UIAlertAction!) -> Void in
                let alertController = UIAlertController(title: "Force Action",
                    message: "Current state \"\(state)\" has been stopped and DVR put in \(DVRState.FastRewinding.name) state", preferredStyle: .Alert)
                let cancelAlertAction = UIAlertAction(title: "OK",
                    style: .Cancel, handler: nil)
                alertController.addAction(cancelAlertAction)
                self.presentViewController(alertController, animated: true,completion: {self.dvrStateLabel.text = DVRState.FastRewinding.name})
            })
            optionMenu.addAction(cancelAction);
            optionMenu.addAction(forceAction);
            self.presentViewController(optionMenu, animated: true, completion: nil)
        }
    }
    
    @IBAction func powerToggled(sender: UISwitch) {
        dvrStateLabel.text = dvrSwitch.on ? "On" : "Off";
        dvrPowerLabel.text = dvrSwitch.on ? "On" : "Off";
        playButton.enabled = dvrSwitch.on;
        stopButton.enabled = dvrSwitch.on;
        pauseButton.enabled = dvrSwitch.on;
        fastForwardButton.enabled = dvrSwitch.on;
        rewindButton.enabled = dvrSwitch.on;
        recordButton.enabled = dvrSwitch.on;
        
        if dvrSwitch.on {
            dvrStateLabel.text = DVRState.Stopped.name;
        }
    }
    
    @IBAction func record(sender: UIButton) {
        if dvrStateLabel.text! == DVRState.Stopped.name{
            dvrStateLabel.text = DVRState.Recording.name;
        }
            
        else
        {
            let state = dvrStateLabel.text!;
            let optionMenu = UIAlertController(title: nil, message: "\(DVRState.Recording.name) only allowed from \(DVRState.Stopped.name) state", preferredStyle: .ActionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
                (alert: UIAlertAction!) -> Void in
                return;
            })
            let forceAction = UIAlertAction(title: "Force", style: .Default, handler: {
                (alert: UIAlertAction!) -> Void in
                let alertController = UIAlertController(title: "Force Action",
                    message: "Current state \"\(state)\" has been stopped and DVR put in \(DVRState.Recording.name) state", preferredStyle: .Alert)
                let cancelAlertAction = UIAlertAction(title: "OK",
                    style: .Cancel, handler: nil)
                alertController.addAction(cancelAlertAction)
                self.presentViewController(alertController, animated: true,completion: {self.dvrStateLabel.text = DVRState.Recording.name})
            })
            optionMenu.addAction(cancelAction);
            optionMenu.addAction(forceAction);
            self.presentViewController(optionMenu, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func switchToTV(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true , completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dvrSwitch.setOn(false, animated: false)
        dvrPowerLabel.text = "Off";
        playButton.enabled = false;
        stopButton.enabled = false;
        pauseButton.enabled = false;
        fastForwardButton.enabled = false;
        rewindButton.enabled = false;
        recordButton.enabled = false;
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
