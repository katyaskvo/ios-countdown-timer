//
//  ViewController.swift
//  timer
//
//  Created by Ekaterina Zdorov on 3/29/18.
//  Copyright © 2018 Ekaterina Zdorov. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    var seconds = 60 //This variable will hold a starting value of seconds. It could be any amount above 0.
    var timer = Timer()
    var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        runTimer()
    }
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(TimerViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        seconds -= 1     //This will decrement(count down)the seconds.
        timerLabel.text = "\(seconds)" //This will update the label.
    }
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
    }
    @IBAction func resetButtonTapped(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

