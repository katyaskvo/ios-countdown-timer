//
//  ViewController.swift
//  timer
//
//  Created by Ekaterina Zdorov on 3/29/18.
//  Copyright © 2018 Ekaterina Zdorov. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 1 min
        if (segue.identifier == "timer1min") {
            let destVC : CountDownViewController = segue.destination as! CountDownViewController
            destVC.numberOfSeconds = 60
            destVC.circleSize = 0.37
            destVC.circleColor = UIColor(displayP3Red: 235/255, green: 50/255, blue: 50/255, alpha: 1.0)
            destVC.runTimer()
        }
        
        // 2 mins
        if (segue.identifier == "timer2mins") {
            let destVC : CountDownViewController = segue.destination as! CountDownViewController
            destVC.numberOfSeconds = 120
            destVC.circleSize = 0.44
            destVC.circleColor = UIColor(displayP3Red: 235/255, green: 50/255, blue: 50/255, alpha: 1.0)
            destVC.runTimer()
        }
        
        // 3 mins
        if (segue.identifier == "timer3mins") {
            let destVC : CountDownViewController = segue.destination as! CountDownViewController
            destVC.numberOfSeconds = 180
            destVC.circleSize = 0.51
            destVC.circleColor = UIColor(displayP3Red: 244/255, green: 136/255, blue: 36/255, alpha: 1.0)
            destVC.runTimer()
        }
        
        // 4 mins
        if (segue.identifier == "timer4mins") {
            let destVC : CountDownViewController = segue.destination as! CountDownViewController
            destVC.numberOfSeconds = 240
            destVC.circleSize = 0.58
            destVC.circleColor = UIColor(displayP3Red: 244/255, green: 136/255, blue: 36/255, alpha: 1.0)
            destVC.runTimer()
        }
        
        // 5 mins
        if (segue.identifier == "timer5mins") {
            let destVC : CountDownViewController = segue.destination as! CountDownViewController
            destVC.numberOfSeconds = 300
            destVC.circleSize = 0.65
            destVC.circleColor = UIColor(displayP3Red: 241/255, green: 209/255, blue: 81/255, alpha: 1.0)
            destVC.runTimer()
        }

        // 6 mins
        if (segue.identifier == "timer6mins") {
            let destVC : CountDownViewController = segue.destination as! CountDownViewController
            destVC.numberOfSeconds = 360
            destVC.circleSize = 0.72
            destVC.circleColor = UIColor(displayP3Red: 241/255, green: 209/255, blue: 81/255, alpha: 1.0)
            destVC.runTimer()
        }
        
        // 7 mins
        if (segue.identifier == "timer7mins") {
            let destVC : CountDownViewController = segue.destination as! CountDownViewController
            destVC.numberOfSeconds = 420
            destVC.circleSize = 0.79
            destVC.circleColor = UIColor(displayP3Red: 241/255, green: 209/255, blue: 81/255, alpha: 1.0)

            destVC.runTimer()
        }
        
        // 8 mins
        if (segue.identifier == "timer8mins") {
            let destVC : CountDownViewController = segue.destination as! CountDownViewController
            destVC.numberOfSeconds = 480
            destVC.circleSize = 0.86
            destVC.circleColor = UIColor(displayP3Red: 62/255, green: 164/255, blue: 99/255, alpha: 1.0)
            destVC.runTimer()
        }
        
        // 9 mins
        if (segue.identifier == "timer9mins") {
            let destVC : CountDownViewController = segue.destination as! CountDownViewController
            destVC.numberOfSeconds = 540            
            destVC.circleSize = 0.93
            destVC.circleColor = UIColor(displayP3Red: 62/255, green: 164/255, blue: 99/255, alpha: 1.0)
            destVC.runTimer()
        }
        
        // 10 mins
        if (segue.identifier == "timer10mins") {
            let destVC : CountDownViewController = segue.destination as! CountDownViewController
            destVC.numberOfSeconds = 600
            destVC.circleSize = 1
            destVC.circleColor = UIColor(displayP3Red: 62/255, green: 164/255, blue: 99/255, alpha: 1.0)
            destVC.runTimer()
        }
    }
}

