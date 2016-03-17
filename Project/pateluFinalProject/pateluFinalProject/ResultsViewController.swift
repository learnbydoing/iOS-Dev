//
//  ResultsViewController.swift
//  pateluFinalProject
//
//  Created by Urvi Patel on 3/7/16.
//  Copyright © 2016 Urvi Patel. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    enum Direction { case Up, Down }
    var result: String = "";
    let size: CGFloat = 50;
    var direction = Direction.Up;
    let win = UIImageView(image: UIImage(named: "win"));
    let lose = UIImageView(image: UIImage(named: "lose"));

    @IBOutlet weak var resultsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsLabel.text = result;
        let y1: CGFloat = view.bounds.height - size * 2 // start from the bottom of the view
        let x1: CGFloat = view.bounds.width * 0.2;
        win.frame = CGRect(x: x1, y: y1, width: size, height: size)
        lose.frame = CGRect(x: x1, y: y1, width: size, height: size)
    }
    
    override func viewWillAppear(animated: Bool) {
        let duration = 1.5
        let x: CGFloat = view.bounds.width * 0.5;
        let y: CGFloat = view.bounds.height * 0.2;
        
        if result == "You win!" {
            view.addSubview(win)
            view.backgroundColor = UIColor.greenColor();
            resultsLabel.textColor = UIColor.whiteColor();
            resultsLabel.font = UIFont.boldSystemFontOfSize(17);
            UIView.animateWithDuration(duration, animations: {
            self.win.frame = CGRect(x: x, y: y, width: self.size, height: self.size)
        })
        }
        else {
            view.addSubview(lose);
            view.backgroundColor = UIColor.grayColor();
            resultsLabel.textColor = UIColor.whiteColor();
            resultsLabel.font = UIFont.boldSystemFontOfSize(17);
            UIView.animateWithDuration(duration, animations: {
                self.lose.frame = CGRect(x: x, y: y, width: self.size, height: self.size)
            })
        }
    }
    

    @IBAction func goBack(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil);
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
