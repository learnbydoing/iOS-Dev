//
//  ViewController.swift
//  pateluListViewApp
//
//  Created by Urvi Patel on 2/20/16.
//  Copyright © 2016 Urvi Patel. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    @IBOutlet weak var infoTextField: UITextView!
    
   
    @IBOutlet weak var flagField: UIImageView!
    
    
    var nation: EUNation?
    
    override func viewWillAppear(animated: Bool) {
        if let n = nation {
            titleLabel.text = n.name;
            infoTextField.text = n.data;
            flagField.image = UIImage(imageLiteral: n.name);
        
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

