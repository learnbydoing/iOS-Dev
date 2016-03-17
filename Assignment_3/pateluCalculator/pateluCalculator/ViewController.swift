//
//  ViewController.swift
//  pateluCalculator
//
//  Created by Urvi Patel on 1/23/16.
//  Copyright © 2016 Urvi Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var result: UILabel!
    
    var isTyping: Bool = false;
    var op = "";
    var operand1: Double? = 0;
    var operand2: Double? = 0;
    var resultText: String? = "";
    var isFirstOperand: Bool = true
;
    
    @IBAction func numberPressed(sender: UIButton) {
        if let operand  = sender.currentTitle {
            if isTyping {
                result.text = result.text! + "\(operand)";
            }
            else {
                result.text = operand;
                isTyping = true;
            }
        }
           resultText = result.text;
    }

    
    @IBAction func operatorPressed(sender: UIButton) {
        isTyping = false;
        operand1 = Double(result.text!);
        op = sender.currentTitle!
        resultText = "";
        isFirstOperand = false;
    }
    
    
    @IBAction func equalPressed(sender: UIButton) {
        
        operand2 = Double(result.text!);
        var res: Double = 0.0;

        if op == "+" {
            res = operand1! + operand2!;
        }
        
        else if op == "-" {
            res = operand1! - operand2!;
        }
        
        
        else if op == "*" {
            res = operand1! * operand2!;
        }
        
       else {
            if operand2 == 0 {
                result.text = "NaN";
                return;
            }
            else {
                res = operand1! / operand2!;
            }
        }
        result.text = String(res);
    }
    
    @IBAction func clear(sender: UIButton) {
        result.text = "0";
        resultText = "";
        isTyping = false;
        operand1 = 0;
        operand2 = 0;
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

