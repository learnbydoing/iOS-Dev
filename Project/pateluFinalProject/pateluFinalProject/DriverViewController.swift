//
//  DriverViewController.swift
//  pateluFinalProject
//
//  Created by Urvi Patel on 3/7/16.
//  Copyright © 2016 Urvi Patel. All rights reserved.
//

import UIKit

class DriverViewController: UIViewController {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let target = segue.destinationViewController as? ViewController {
            
            if sender!.currentTitle == "TEN"
            {
                target.MODE = 10;
            }
            else
            {
                target.MODE = 11;
            }
        }
    }

    
    
    @IBAction func exitGame(sender: UIButton) {
        exit(0);
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
