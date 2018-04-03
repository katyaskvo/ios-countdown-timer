//
//  CountDownViewController.swift
//  timer
//
//  Created by Ekaterina Zdorov on 4/3/18.
//  Copyright © 2018 Ekaterina Zdorov. All rights reserved.
//

import UIKit

class CountDownViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    var seconds = 60 //This variable will hold a starting value of seconds. It could be any amount above 0.
    var timer = Timer()
    var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
    
    var numberOfSeconds :Int = 0
    @IBOutlet weak var displayTime: UILabel!
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(CountDownViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    @IBAction func munute1tapped(_ sender: UIButton) {
        runTimer()
    }
    @objc func updateTimer() {
        if numberOfSeconds < 1 {
            timer.invalidate()
            //Send alert to indicate "time's up!"
        } else {
        numberOfSeconds -= 1     //This will decrement(count down)the seconds.
        displayTime.text = timeString(time: TimeInterval(numberOfSeconds)) //This will update the label.
        }
    }
    
    //    var resumeTapped = false
//    @IBAction func pauseButtonTapped(_ sender: UIButton) {
//        if self.isTimerRunning == false {
//            runTimer()
//            self.isTimerRunning = true
//        } else {
//            timer.invalidate()
//            self.isTimerRunning = false
//        }
//    }
//    @IBAction func resetButtonTapped(_ sender: UIButton) {
//        timer.invalidate()
//        seconds = 60    //Here we manually enter the restarting point for the seconds, but it would be wiser to make this a variable or constant.
//        timerLabel.text = timeString(time: TimeInterval(seconds))
//        timer.fire()
//        isTimerRunning = false
//    }
    
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayTime.text = timeString(time: TimeInterval(numberOfSeconds))
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}


