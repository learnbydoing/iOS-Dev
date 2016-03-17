//
//  ViewController.swift
//  pateluShoppingList
//
//  Created by Urvi Patel on 2/6/16.
//  Copyright © 2016 Urvi Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum Errors { case ZeroQuantity, NonIntegerQuantity, EmptyDescription, EmptyQuantity}
    
    @IBOutlet weak var listContents: UITextView!
 
    
    @IBOutlet weak var descriptionTextField: UITextField!

    
    @IBOutlet weak var quantityTextField: UITextField!
    
    
    @IBOutlet var textFields: [UITextField]!
    
    var output: String = "";
    
    
    @IBAction func descriptionEntered(sender: UITextField) {
        sender.resignFirstResponder();
    }
    
    @IBAction func bacdgroundTouched(sender: UIControl) {
        for tf in textFields {
            tf.resignFirstResponder();
        }
    }
    
    @IBAction func quantityEntered(sender: UITextField) {
        sender.resignFirstResponder();
    }
 
    
    
    @IBAction func newList(sender: UIButton) {
        descriptionTextField.text = "";
        quantityTextField.text = "";
        listContents.text = "";
    }
    
    
    @IBAction func newItem(sender: UIButton) {
        descriptionTextField.text = "";
        quantityTextField.text = "";
    }
    
    
    @IBAction func addToList(sender: UIButton) {
        
        if descriptionTextField.text == "" {
            showAlert(Errors.EmptyDescription);
            return;
        }
        if quantityTextField.text == "" {
            showAlert(Errors.EmptyQuantity)
            return;
        }
        let q = Int(quantityTextField.text!)
        if q == nil {
            showAlert(Errors.NonIntegerQuantity);
            return;
        }
        if q  == 0 {
            showAlert(Errors.ZeroQuantity);
            return;
        }
  
        output = output + quantityTextField.text! + "x ";
        output +=  descriptionTextField.text! + "\n";
        listContents.text = output;
    }
    
    private func showAlert(error: Errors) {
            var message = "";
            if error == Errors.EmptyDescription {
                message = "Description field cannot be empty";
            }
            else if(error == Errors.EmptyQuantity) {
                message = "Quantity field cannot be empty";
            }
            else if(error == Errors.NonIntegerQuantity) {
                message = "Quantity must be an integer";
            }
            else {
                message = "Quantity cannot be zero"
            }
            
            let alertController = UIAlertController(title: "Invalid input", message: message, preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            alertController.addAction(cancelAction)
            presentViewController(alertController, animated: true,completion: nil);
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

