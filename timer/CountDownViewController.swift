//
//  CountDownViewController.swift
//  timer
//
//  Created by Ekaterina Zdorov on 4/3/18.
//  Copyright © 2018 Ekaterina Zdorov. All rights reserved.
//

import UIKit
import CircleProgressBar

class CountDownViewController: UIViewController {
    var timer = Timer()
    var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
    
    var numberOfSeconds :Int = 0
    var circleSize :Int = 0
    @IBOutlet var displayTime: UILabel!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    //    @IBOutlet weak var circleProgressBar: CircleProgressBar!
    @IBOutlet weak var circleProgressBar: CircleProgressBar!
    
    
    @IBAction func stopTimer(_ sender: Any) {
        timer.invalidate()
    }
    func runTimer() {
//        circleProgressBar.setProgress(CGFloat, animated: Bool, duration: 10)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(CountDownViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    @objc func updateTimer() {
        func updateProgress(_ progress: CGFloat, animated: Bool = true, initialDelay: CFTimeInterval = 0, duration: CFTimeInterval? = 10) {}
        
        if numberOfSeconds < 1 {
            timer.invalidate()
            //Send alert to indicate "time's up!"
        } else {
        numberOfSeconds -= 1     //This will decrement(count down)the seconds.
        displayTime.text = timeString(time: TimeInterval(numberOfSeconds)) //This will update the label.
        }
    }
    

    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    override func viewDidLoad() {
        print("view did load")
        super.viewDidLoad()
        
        print(heightConstraint.constant)
        heightConstraint.constant = CGFloat(circleSize)
        widthConstraint.constant = CGFloat(circleSize)
        circleProgressBar.layoutIfNeeded()
        
        print(heightConstraint.constant)

        circleProgressBar.frame.size.height = CGFloat(circleSize)
        circleProgressBar.frame.size.width = CGFloat(circleSize)
        circleProgressBar.progressBarWidth = CGFloat(500)
        circleProgressBar.startAngle = CGFloat(-90.0)
        circleProgressBar.setProgress(1.0, animated: true, duration: CGFloat(numberOfSeconds))
        print(circleProgressBar.frame.size.width)
        
        displayTime.text = timeString(time: TimeInterval(numberOfSeconds))
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
}


