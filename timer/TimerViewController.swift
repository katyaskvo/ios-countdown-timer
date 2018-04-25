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
        button2.cornerRadius = (buttonUnit * 1.1) / 2
        button3.cornerRadius = (buttonUnit * 1.2) / 2
        button4.cornerRadius = (buttonUnit * 1.3) / 2
        button5.cornerRadius = (buttonUnit * 1.4) / 2
        button6.cornerRadius = (buttonUnit * 1.5) / 2
        button7.cornerRadius = (buttonUnit * 1.6) / 2
        button8.cornerRadius = (buttonUnit * 1.7) / 2
        button9.cornerRadius = (buttonUnit * 1.8) / 2
        button10.cornerRadius = (buttonUnit * 1.9) / 2
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC : CountDownViewController = segue.destination as! CountDownViewController
        
        // 1 min
        if (segue.identifier == "timer1min") {
            destVC.numberOfSeconds = 60
            destVC.circleSize = 0.37
            destVC.circleColor = colorPurple
            destVC.runTimer()
        }
        
        // 2 mins
        if (segue.identifier == "timer2mins") {
            destVC.numberOfSeconds = 120
            destVC.circleSize = 0.44
            destVC.circleColor = colorPurple
            destVC.runTimer()
        }
        
        // 3 mins
        if (segue.identifier == "timer3mins") {
            destVC.numberOfSeconds = 180
            destVC.circleSize = 0.51
            destVC.circleColor = colorPink
            destVC.runTimer()
        }
        
        // 4 mins
        if (segue.identifier == "timer4mins") {
            destVC.numberOfSeconds = 240
            destVC.circleSize = 0.58
            destVC.circleColor = colorPink
            destVC.runTimer()
        }
        
        // 5 mins
        if (segue.identifier == "timer5mins") {
            destVC.numberOfSeconds = 300
            destVC.circleSize = 0.65
            destVC.circleColor = colorOrange
            destVC.runTimer()
        }

        // 6 mins
        if (segue.identifier == "timer6mins") {
            destVC.numberOfSeconds = 360
            destVC.circleSize = 0.72
            destVC.circleColor = colorOrange
            destVC.runTimer()
        }
        
        // 7 mins
        if (segue.identifier == "timer7mins") {
            destVC.numberOfSeconds = 420
            destVC.circleSize = 0.79
            destVC.circleColor = colorOrange
            destVC.runTimer()
        }
        
        // 8 mins
        if (segue.identifier == "timer8mins") {
            destVC.numberOfSeconds = 480
            destVC.circleSize = 0.86
            destVC.circleColor = colorYellow
            destVC.runTimer()
        }
        
        // 9 mins
        if (segue.identifier == "timer9mins") {
            destVC.numberOfSeconds = 540
            destVC.circleSize = 0.93
            destVC.circleColor = colorYellow
            destVC.runTimer()
        }
        
        // 10 mins
        if (segue.identifier == "timer10mins") {
            destVC.numberOfSeconds = 600
            destVC.circleSize = 1
            destVC.circleColor = colorYellow
            destVC.runTimer()
        }
    }
}
