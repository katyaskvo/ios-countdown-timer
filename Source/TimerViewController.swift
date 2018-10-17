//
//  ViewController.swift
//  timer
//
//  Created by Ekaterina Zdorov on 3/29/18.
//  Copyright © 2018 Ekaterina Zdorov. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    @IBOutlet var superView: UIView!
    @IBOutlet weak var onebutton: RoundButton!
    @IBOutlet weak var button2: RoundButton!
    @IBOutlet weak var button3: RoundButton!
    @IBOutlet weak var button4: RoundButton!
    @IBOutlet weak var button5: RoundButton!
    @IBOutlet weak var button6: RoundButton!
    @IBOutlet weak var button7: RoundButton!
    @IBOutlet weak var button8: RoundButton!
    @IBOutlet weak var button9: RoundButton!
    @IBOutlet weak var button10: RoundButton!
    
    let colorPurple = UIColor(displayP3Red: 133/255, green: 70/255, blue: 158/255, alpha: 1.0)
    let colorPink   = UIColor(displayP3Red: 221/255, green: 62/255, blue: 118/255, alpha: 1.0)
    let colorOrange = UIColor(displayP3Red: 248/255, green: 118/255, blue: 66/255, alpha: 1.0)
    let colorYellow = UIColor(displayP3Red: 246/255, green: 196/255, blue: 84/255, alpha: 1.0)
    
    override func viewDidLoad() {
        let buttonUnit = superView.frame.size.height * 0.0435
        super.viewDidLoad()
        onebutton.cornerRadius = buttonUnit / 2
        button2.cornerRadius  = (buttonUnit * 1.1) / 2
        button3.cornerRadius  = (buttonUnit * 1.2) / 2
        button4.cornerRadius  = (buttonUnit * 1.3) / 2
        button5.cornerRadius  = (buttonUnit * 1.4) / 2
        button6.cornerRadius  = (buttonUnit * 1.5) / 2
        button7.cornerRadius  = (buttonUnit * 1.6) / 2
        button8.cornerRadius  = (buttonUnit * 1.7) / 2
        button9.cornerRadius  = (buttonUnit * 1.8) / 2
        button10.cornerRadius = (buttonUnit * 1.9) / 2
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC : CountDownViewController = segue.destination as! CountDownViewController
        let circleDecrement: CGFloat = 0.07
        let tappedButton = sender as! RoundButton
        let minutes = Int(tappedButton.title(for: .normal)!)!
        let color = tappedButton.backgroundColor!

        destVC.numberOfSeconds = 60 * minutes
        destVC.circleSize = 1 - (10 - CGFloat(minutes)) * circleDecrement
        destVC.circleColor = color
        destVC.runTimer()
    }
}
