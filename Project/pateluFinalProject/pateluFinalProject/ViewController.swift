//
//  ViewController.swift
//  pateluFinalProject
//
//  Created by Urvi Patel on 3/6/16.
//  Copyright © 2016 Urvi Patel. All rights reserved.
//

import UIKit

class Payload {
    var imageView: DraggableImageView! = nil;
    var index: Int = -1;
}

class ViewController: UIViewController {
    
    @IBOutlet weak var c1: DraggableImageView!
    
    @IBOutlet weak var c2: DraggableImageView!
    
    @IBOutlet weak var c3: DraggableImageView!
    
    @IBOutlet weak var c4: DraggableImageView!
    
    @IBOutlet weak var c5: DraggableImageView!
    
    @IBOutlet weak var c6: DraggableImageView!
    
    @IBOutlet weak var c7: DraggableImageView!
    
    @IBOutlet weak var c8: DraggableImageView!
    
    @IBOutlet weak var c9: DraggableImageView!
    
    @IBOutlet weak var sumLabel: UILabel!
    
    @IBOutlet weak var modeLabel: UILabel!
    
    @IBOutlet weak var dealPile: UIButton!
    
    @IBOutlet weak var discard: DraggableImageView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    

//All
var cards:[String] = ["1C", "2C", "3C", "4C", "5C", "6C", "7C", "8C", "9C", "10C", "11C", "12C", "13C", "1D", "2D", "3D", "4D", "5D", "6D", "7D", "8D", "9D", "10D", "11D", "12D", "13D", "1S", "2S", "3S", "4S", "5S", "6S", "7S", "8S", "9S", "10S", "11S", "12S", "13S", "1H", "2H", "3H", "4H", "5H", "6H", "7H", "8H", "9H", "10H", "11H", "12H", "13H"];
    
    var board:[DraggableImageView] = [];
    var cardCount: Int = 0;
    var MODE:Int = 10;
    var origFrame: CGRect = CGRectZero;
    
    var validSpots: [Int]!;
    var JQK: [Int:Int] = [:];
    var sumJQK: [Int] = [];
    var sumNum: Int = 0;
    
    var outcome: String = "";
    let mappings: [Int:String] = [11:"J", 12:"Q", 13:"K"];
    
    var score: Int = 0;
    @IBOutlet weak var noMoves: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modeLabel.text = String(MODE);
        noMoves.hidden = true;
        dealPile.hidden = true;
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func newGame(sender: UIBarButtonItem) {
        shuffle();
        setupGame();
        cardCount = 0;
        createBoard();
        JQK = [:];
        sumJQK = [];
        sumNum = 0;
        score = 0;
        scoreLabel.text = String(score);
        sumLabel.text = "";
        getValidSpots();
        if validSpots == [] {
            noMoves.hidden = false;
            dealPile.hidden = true;
            discard.hidden = true;
        }
        else {
            noMoves.hidden = true;
            dealPile.hidden = false;
            discard.hidden = false;
        }
        let image = UIImage(named: "back");
        dealPile.setImage(image, forState: .Normal);
        discard.image = nil;
        origFrame = discard.frame;
    }
    
    private func shuffle() {
        let size = cards.count - 1
        let ran = UInt32(cards.count);
        for i in 0...size {
            let index = Int(arc4random_uniform(ran))
            let tmp = cards[index];
            cards[index] = cards[i];
            cards[i] = tmp;
        }
    }
    
    private func setupGame() {
        board.append(c1);
        board.append(c2);
        board.append(c3);
        board.append(c4);
        board.append(c5);
        board.append(c6);
        board.append(c7);
        board.append(c8);
        board.append(c9);
    }
    
    private func createBoard() {
        for i in 0...8 {
            let image = UIImage(named: cards[i]);
            board[i].image = image;
            board[i].Name = cards[i];
            cardCount += 1;
        }
    }
    
    @IBAction func dealCard(sender: UIButton) {
        if cardCount == cards.count {
            let image = UIImage(named: "background");
            dealPile.setImage(image, forState: .Normal);
            outcome = "You win!"; //Results page code
            self.performSegueWithIdentifier("resultsSegue", sender:nil)
            dealPile.hidden = true;
            discard.hidden = true;
            return;
        }
         if discard.image == nil {
            discard.image = UIImage(named: cards[cardCount])
            discard.Name = cards[cardCount];
            cardCount = cardCount + 1;
            return;
        }
        if validSpots == [] && noMoves.hidden == true {
            noMoves.hidden = false;
            outcome = "You lose!"; //Results page code
            self.performSegueWithIdentifier("resultsSegue", sender:nil)
            return;
        }
    }
    
    
    @IBAction func exitGame(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil);
    }
    
    
    @IBAction func goBack(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil);
    }
//    
//    @IBAction func exitGame(sender: UIBarButtonItem) {
//        dismissViewControllerAnimated(true, completion: nil);
//    }

    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch: UITouch! = touches.first! as UITouch!
        let touchPoint = touch.locationInView(self.view);
        if CGRectContainsPoint(discard.frame, touchPoint) {
            discard.center = touch.locationInView(self.view.superview)
            view.bringSubviewToFront(discard);
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch: UITouch! = touches.first! as UITouch!
        let touchPoint = touch.locationInView(self.view);
        
        if(validSpots == nil) {
            return;
        }
        
        if sumLabel.text == String(MODE) || JQKComplete(){
            sumLabel.text = "";
        }
        
        if validSpots == [] && noMoves.hidden == true {
            noMoves.hidden = false;
            outcome = "You lose!"; //Results page code
            self.performSegueWithIdentifier("resultsSegue", sender:nil)
            return;
        }
        
        let payld: Payload = findFrame(touchPoint);
        var spot: Int = -1;
        
        if payld.index == -1 {
            discard.frame = origFrame;
            return;
        }
        let cardUnderneath: DraggableImageView = payld.imageView
        let ind: Int = payld.index;
        
        if !validSpots.contains(ind) {
            discard.frame = origFrame;
            return;
        }
        
        let cardUnderneathVal: Int = Int(String(cardUnderneath.Name.characters.dropLast()))!;
        
        if cardUnderneathVal >= 11 && sumNum != 0 { //Puts card on card < 10 then a face card
            discard.frame = origFrame;
            return;
        }
        
        if cardUnderneathVal < 11 && sumJQK == [] {
            if sumNum == 0 {
                sumNum = sumNum + cardUnderneathVal;
                sumLabel.text = String(sumNum);
                cardUnderneath.image = discard.image;
                cardUnderneath.Name = discard.Name;
                spot = validSpots.indexOf(payld.index)!;
                validSpots.removeAtIndex(spot);
                score += 1;
                scoreLabel.text = String(score);
                discard.image = nil;
                if sumNum == 10 && MODE == 10 {
                    sumNum = 0;
                    getValidSpots();
                    scoreLabel.text = String(score);
                    if validSpots == [] && noMoves.hidden == true {
                        noMoves.hidden = false;
                        outcome = "You lose!"; //Results page code
                        self.performSegueWithIdentifier("resultsSegue", sender:nil)
                        dealPile.hidden = true;
                        discard.hidden = true;
                    }

                }
                return;
            }
            else {
                if cardUnderneathVal + sumNum == MODE {
                    sumLabel.text = String(sumNum + cardUnderneathVal);
                    cardUnderneath.image = discard.image;
                    cardUnderneath.Name = discard.Name;
                    discard.image = nil;
                    sumNum = 0;
                    score += 1;
                    scoreLabel.text = String(score);
                    getValidSpots();
                    if validSpots == [] && noMoves.hidden == true {
                        noMoves.hidden = false;
                        outcome = "You lose!"; //RESULTS PAGE CODE
                        self.performSegueWithIdentifier("resultsSegue", sender:nil)
                        dealPile.hidden = true;
                        discard.hidden = true;
                    }
                    return;
                }
                else {
                    discard.frame = origFrame;
                }
            }
        }
        else {
            if cardUnderneathVal < 11 {
                discard.frame = origFrame;
                return;
            }
            else if sumJQK.count <= 1 && !sumJQK.contains(cardUnderneathVal) {
                cardUnderneath.image = discard.image;
                cardUnderneath.Name = discard.Name;
                spot = validSpots.indexOf(payld.index)!;
                validSpots.removeAtIndex(spot);
                discard.image = nil;
                sumJQK.append(cardUnderneathVal);
                sumLabel.text = sumLabel.text! + mappings[cardUnderneathVal]!;
                score += 1;
                scoreLabel.text = String(score);
                return;
            }
            else if sumJQK.count == 2 && !sumJQK.contains(cardUnderneathVal) {
                cardUnderneath.image = discard.image;
                cardUnderneath.Name = discard.Name;
                sumJQK.append(cardUnderneathVal);
                sumLabel.text = sumLabel.text! + mappings[cardUnderneathVal]!;
                sumJQK = [];
                discard.image = nil;
                score += 1;
                scoreLabel.text = String(score);
                getValidSpots();
                if validSpots == [] && noMoves.hidden == true {
                    noMoves.hidden = false;
                    outcome = "You lose!"; //Results page code
                    self.performSegueWithIdentifier("resultsSegue", sender:nil)
                    dealPile.hidden = true;
                    discard.hidden = true;
                }
                return;
            }
            else {
                discard.frame = origFrame;
            }
        }
    }

    private func JQKComplete() -> Bool {
        return sumLabel.text == "JQK" || sumLabel.text == "JKQ" ||
           sumLabel.text == "QJK" || sumLabel.text == "QKJ" ||
           sumLabel.text == "KJQ" || sumLabel.text == "KQJ"
    }
    
    private func getValidSpots() {
        validSpots = [];
        for i in 0...8 {
            let cardName = String(board[i].Name);
            let cardStr = String(cardName.characters.dropLast());
            let cardValue = Int(cardStr)
            
            if(cardValue < 11) {
                checkSum(i, val: cardValue!);
            }
                
            else {
                checkJQK(i, val: cardValue!);
            }
        }
    }
    
    private func findFrame(touchPoint: CGPoint) -> Payload {
        let p: Payload = Payload();
        //Check each image in board {
        for k in 0...board.count - 1 {
            if CGRectContainsPoint(board[k].frame, touchPoint) && validSpots.contains(k) {
                p.imageView = board[k];
                p.index = k;
                return p;
            }
        }
        p.imageView = discard;
        p.index = -1;
        return p;
    }

    
    private func checkSum(i: Int, val: Int) {
        let target: Int = MODE - val;
        if target == 0 && MODE == 10 {
            validSpots.append(i);
            return;
        }
        
        for j in 0...8 {
            let cardName2 = String(board[j].Name);
            let value2 = String(cardName2.characters.dropLast());
            if i != j  && Int(value2)  == target {
                if !validSpots.contains(i) {
                    validSpots.append(i);
                    
                }
                if !validSpots.contains(j) {
                    validSpots.append(j);
                }
            }
        }
        
    }
    

    private func checkJQK(i: Int, val:Int) {
        JQK = [:];
        var array = [11, 12, 13];
        JQK[val] = i;
        array.removeAtIndex(array.indexOf(val)!)
        
        for k in 0...8 {
            let cardName = String(board[k].Name)
            let cardString = String(cardName.characters.dropLast());
            let cardValue = Int(cardString);
            if i != k && cardValue > 10 {
                if array.contains(cardValue!) {
                    JQK[cardValue!] = k;
                    array.removeAtIndex(array.indexOf(cardValue!)!)
                }
            }
        }
        if JQK.count == 3 {
            for (_, value) in JQK {
                if !validSpots.contains(value) {
                    validSpots.append(value)
                }
            }
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        discard.frame = origFrame;
    }


    //Results page
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let target = segue.destinationViewController as? ResultsViewController {
            target.result = outcome;
        }
    }

    //Portrait only
    override func shouldAutorotate() -> Bool {
        if (UIDevice.currentDevice().orientation == UIDeviceOrientation.Portrait ||
            UIDevice.currentDevice().orientation == UIDeviceOrientation.PortraitUpsideDown ||
            UIDevice.currentDevice().orientation == UIDeviceOrientation.Unknown) {
                return true
        }
        else {
            return false
        }
    }
    
    //Portrait only
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return [UIInterfaceOrientationMask.Portrait ,UIInterfaceOrientationMask.PortraitUpsideDown]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

