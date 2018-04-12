//
//  CountDownViewController.swift
//  timer
//
//  Created by Ekaterina Zdorov on 4/3/18.
//  Copyright © 2018 Ekaterina Zdorov. All rights reserved.
//

import UIKit
import CircleProgressBar
import AudioToolbox
import MediaPlayer

class CountDownViewController: UIViewController {
    var timer = Timer()
    @IBOutlet weak var circleSuperView: NSLayoutConstraint!
    var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
    @IBOutlet var superView: UIView!
    
    var numberOfSeconds :Int = 0
    var circleSize :CGFloat = 0
    var circleColor :UIColor = UIColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var circleProgressBar: CircleProgressBar!
    
    var audioPlayerTickTock: AVAudioPlayer!
    var audioPlayerAlarm: AVAudioPlayer!

    
    @IBAction func stopTimer(_ sender: Any) {
        timer.invalidate()
        self.audioPlayerTickTock.stop()
        self.audioPlayerAlarm.stop()
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
            self.audioPlayerTickTock.stop()
            self.audioPlayerAlarm.numberOfLoops = -1
            self.audioPlayerAlarm.play()
            //Send alert to indicate "time's up!"
        } else {
            numberOfSeconds -= 1     //This will decrement(count down)the seconds.
            
            if numberOfSeconds <= 30 {
                self.audioPlayerTickTock.rate = 2
            } else if numberOfSeconds <= 60 {
                self.audioPlayerTickTock.rate = 1.75
            } else if numberOfSeconds <= 120 {
                self.audioPlayerTickTock.rate = 1.5
            } else if numberOfSeconds <= 180 {
                self.audioPlayerTickTock.rate = 1.25
            }
        }
    }

    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let filePath = Bundle.main.path(forResource: "tick-tock", ofType: "mp3", inDirectory: "") {
            // Good, got a file
            let filePathUrl = NSURL.fileURL(withPath: filePath)
            
            // Try to instantiate the audio player
            do {
                self.audioPlayerTickTock = try AVAudioPlayer(contentsOf: filePathUrl)
            } catch {
                print(error)
            }
        } else {
            print("filePath is empty!")
        }
        
        if let filePathAlarm = Bundle.main.path(forResource: "alarm", ofType: "mp3", inDirectory: "") {
            // Good, got a file
            let filePathUrl = NSURL.fileURL(withPath: filePathAlarm)
            
            // Try to instantiate the audio player
            do {
                self.audioPlayerAlarm = try AVAudioPlayer(contentsOf: filePathUrl)
            } catch {
                print(error)
            }
        } else {
            print("filePath is empty!")
        }

        self.audioPlayerTickTock.numberOfLoops = -1
        self.audioPlayerTickTock.enableRate = true
        self.audioPlayerTickTock.play()
        
        heightConstraint.constant = CGFloat(-(1 - circleSize) * superView.frame.size.width * 0.9)
        widthConstraint.constant = CGFloat(-(1 - circleSize) * superView.frame.size.width * 0.9)
        circleProgressBar.layoutIfNeeded()
        
        circleProgressBar.progressBarWidth = CGFloat(1000)
        circleProgressBar.startAngle = CGFloat(-90.0)
        circleProgressBar.progressBarProgressColor = UIColor.clear
        circleProgressBar.progressBarTrackColor = circleColor
        circleProgressBar.hintHidden = true
        circleProgressBar.setProgress(1.0, animated: true, duration: CGFloat(numberOfSeconds))
        print(circleProgressBar.frame.size.width)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
}


