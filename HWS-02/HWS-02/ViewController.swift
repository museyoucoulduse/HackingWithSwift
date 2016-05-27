//
//  ViewController.swift
//  HWS-02
//
//  Created by Szymon Blaszczynski on 26/05/16.
//  Copyright © 2016 Szymon Blaszczynski. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var numberOfFlags = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        countries += ["estonia", "france", "germany", "ireland", "italy",
                      "monaco", "nigeria", "poland", "russia", "spain",
                      "uk", "us"]
        
        for button in view.subviews where button is UIButton {
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.lightGrayColor().CGColor
        }
        
        // My color (e.g. orange)
//        UIColor(red: 1.0, green: 0.6, blue: 0.2, alpha: 1.0).CGColor

        
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries = GKRandomSource.sharedRandom()
            .arrayByShufflingObjectsInArray(countries) as! [String]
        
        button1.setImage(UIImage(named: countries[0]), forState: .Normal)
        button2.setImage(UIImage(named: countries[1]), forState: .Normal)
        button3.setImage(UIImage(named: countries[2]), forState: .Normal)
        
        correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(numberOfFlags)
        
        title = countries[correctAnswer].uppercaseString
    }
    
    @IBAction func buttonTapped(sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        }
        else {
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
        presentViewController(ac, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

