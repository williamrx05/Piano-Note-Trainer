//
//  ViewController.swift
//  Piano Thing
//
//  Created by William on 2019-07-20.
//  Copyright © 2019 Aa. All rights reserved.
//

import UIKit

class PianoView: UIViewController {

    @IBOutlet var scoreLabel: UILabel! // Correct/Total Label
    @IBOutlet var noteLabel: UILabel! // Shows number of note (Testing purposes)
    var currentNote: Int = 15 // Note shown
    var numCorrect: Int = 0
    var totalDone: Int = 0
    var botNote: Int = 0
    var topNote: Int = 29
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func randomNumber(MIN: Int, MAX: Int)-> Int{
        return Int(arc4random_uniform(UInt32(MAX-MIN)) + UInt32(MIN));
    }
    
    func checkKey (key: Int) {
        totalDone += 1
        if (currentNote - key) % 7 == 0 {
            numCorrect += 1
        }
        scoreLabel.text = "\(numCorrect) / \(totalDone)"
        currentNote = randomNumber (MIN: botNote, MAX: topNote)
        noteLabel.text = "\(convertNum (num: currentNote))" // Testing
    }
    
    func convertNum (num: Int)-> String { // Testing
        if (num) % 7 == 0 {
            return "B"
        } else if (num) % 7 == 1 {
            return "C"
        } else if (num) % 7 == 2 {
            return "D"
        } else if (num) % 7 == 3 {
            return "E"
        } else if (num) % 7 == 4 {
            return "F"
        } else if (num) % 7 == 5 {
            return "G"
        } else {
            return "A"
        }
    }
    
    @IBAction func aKey (_ sender: UIButton) {
        checkKey (key: 6)
    }
    
    @IBAction func bKey (_ sender: UIButton) {
        checkKey (key: 7)
    }
    
    @IBAction func cKey (_ sender: UIButton) {
        checkKey (key: 1)
    }
    
    @IBAction func dKey (_ sender: UIButton) {
        checkKey (key: 2)
    }
    
    @IBAction func eKey (_ sender: UIButton) {
        checkKey (key: 3)
    }
    
    @IBAction func fKey (_ sender: UIButton) {
        checkKey (key: 4)
    }
    
    @IBAction func gKey (_ sender: UIButton) {
        checkKey (key: 5)
    }
    
    @IBAction func reset (_ sender: UIButton) {
        currentNote = 15
        noteLabel.text = "\(convertNum (num: currentNote))" // Testing
        numCorrect = 0
        totalDone = 0
        scoreLabel.text = "? / ?"
    }
}

