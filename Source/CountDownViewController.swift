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

    @IBOutlet weak var animatedCircle1: UIView!
    @IBOutlet weak var animatedCircle2: UIView!
    @IBOutlet weak var animatedCircle3: UIView!
    @IBOutlet weak var animatedCircle4: UIView!
    
    @IBAction func stopTimer(_ sender: Any) {
        timer.invalidate()
        self.audioPlayerTickTock.stop()
        self.audioPlayerAlarm.stop()
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(CountDownViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    func animateAlarm() {
        //pulsating circles animation displays when timer is done, the color of the circles is the same as timer's preset button
        let alarmAnimationDuration = 1.0
        
        let alarmOpacityAnimation = CAKeyframeAnimation(keyPath: "opacity") //dissapearing cirles effect
        alarmOpacityAnimation.repeatCount = Float.infinity
        alarmOpacityAnimation.keyTimes = [0, 1]
        alarmOpacityAnimation.values = [1, 0]
        
        let alarmScaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale") //pulsating effect
        alarmScaleAnimation.repeatCount = Float.infinity
        alarmScaleAnimation.keyTimes = [0, 1]
        alarmScaleAnimation.values = [1, 30]
        
        //four circles appears each animation repetition
        let alarmCircle1Animations = CAAnimationGroup()
        alarmCircle1Animations.duration = alarmAnimationDuration
        alarmCircle1Animations.repeatCount = Float.infinity
        alarmCircle1Animations.beginTime = CACurrentMediaTime()
        alarmCircle1Animations.animations = [alarmOpacityAnimation, alarmScaleAnimation]
        
        let alarmCircle2Animations = CAAnimationGroup()
        alarmCircle2Animations.duration = alarmAnimationDuration
        alarmCircle2Animations.repeatCount = Float.infinity
        alarmCircle2Animations.beginTime = CACurrentMediaTime()+(alarmAnimationDuration*0.15)
        alarmCircle2Animations.animations = [alarmOpacityAnimation, alarmScaleAnimation]

        let alarmCircle3Animations = CAAnimationGroup()
        alarmCircle3Animations.duration = alarmAnimationDuration
        alarmCircle3Animations.repeatCount = Float.infinity
        alarmCircle3Animations.beginTime = CACurrentMediaTime()+(alarmAnimationDuration*0.3)
        alarmCircle3Animations.animations = [alarmOpacityAnimation, alarmScaleAnimation]

        let alarmCircle4Animations = CAAnimationGroup()
        alarmCircle4Animations.duration = alarmAnimationDuration
        alarmCircle4Animations.repeatCount = Float.infinity
        alarmCircle4Animations.beginTime = CACurrentMediaTime()+(alarmAnimationDuration*0.45)
        alarmCircle4Animations.animations = [alarmOpacityAnimation, alarmScaleAnimation]

        UIView.animate(
            withDuration: alarmAnimationDuration,
            delay: 0,
            options: [.curveEaseInOut],
            animations: {
                self.animatedCircle1.layer.add(alarmCircle1Animations, forKey: "opacity animation")
                self.animatedCircle2.layer.add(alarmCircle2Animations, forKey: "opacity animation")
                self.animatedCircle3.layer.add(alarmCircle3Animations, forKey: "opacity animation")
                self.animatedCircle4.layer.add(alarmCircle4Animations, forKey: "opacity animation")
            }
        )
    }
    
    @objc func updateTimer() {
        func updateProgress(_ progress: CGFloat, animated: Bool = true, initialDelay: CFTimeInterval = 0, duration: CFTimeInterval? = 10) {}
        if numberOfSeconds == 0 {
            timer.invalidate()
            self.audioPlayerTickTock.stop()
            self.audioPlayerAlarm.numberOfLoops = -1
            self.audioPlayerAlarm.enableRate = true
            self.audioPlayerAlarm.rate = 1
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default)
            }
            catch {
                // report for an error
            }
            //time's up!
            self.audioPlayerAlarm.play()
            animateAlarm()
            
        } else {
            numberOfSeconds -= 1     //decrement(count down)the seconds.
            
            //increase tick tock sound rate starting at 3mins, to let child know time is running out.
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

//    func timeString(time:TimeInterval) -> String {
//        let hours = Int(time) / 3600
//        let minutes = Int(time) / 60 % 60
//        let seconds = Int(time) % 60
//        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
//    }
//
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isIdleTimerDisabled = true //don't allow device to fall asleep while timer is running
        
        //alarm circles
        
        //Circles corner radius
        let alarmRadius = self.superView.layer.bounds.size.width * 0.027 / 2 //relative radius, because circles itself are relative to the screen size.
        self.animatedCircle1.layer.cornerRadius = alarmRadius
        self.animatedCircle2.layer.cornerRadius = alarmRadius
        self.animatedCircle3.layer.cornerRadius = alarmRadius
        self.animatedCircle4.layer.cornerRadius = alarmRadius
        
        //Circle BG colors
        self.animatedCircle1.layer.backgroundColor = circleColor.cgColor
        self.animatedCircle2.layer.backgroundColor = circleColor.cgColor
        self.animatedCircle3.layer.backgroundColor = circleColor.cgColor
        self.animatedCircle4.layer.backgroundColor = circleColor.cgColor

        if let filePath = Bundle.main.path(forResource: "tick-tock", ofType: "wav", inDirectory: "") {
            // Good, got a file
            let filePathUrl = NSURL.fileURL(withPath: filePath)
            
            // Try to instantiate the audio player
            do {
                self.audioPlayerTickTock = try AVAudioPlayer(contentsOf: filePathUrl)
            } catch {
                print(error)
            }
        } else {
            print("tick-tock filePath is empty!")
        }
        
        if let filePathAlarm = Bundle.main.path(forResource: "alarm", ofType: "wav", inDirectory: "") {
            // Good, got a file
            let filePathUrl = NSURL.fileURL(withPath: filePathAlarm)
            
            // Try to instantiate the audio player
            do {
                self.audioPlayerAlarm = try AVAudioPlayer(contentsOf: filePathUrl)

            } catch {
                print(error)
            }
        } else {
            print("alarm filePath is empty!")
        }

        self.audioPlayerTickTock.numberOfLoops = -1
        self.audioPlayerTickTock.enableRate = true
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default)
        }
        catch {
            // report for an error
        }
        
        //play ticking sound
        self.audioPlayerTickTock.play()
        
        //show dissapearing circle
        heightConstraint.constant = CGFloat(-(1 - circleSize) * superView.frame.size.width * 0.9)
        widthConstraint.constant = CGFloat(-(1 - circleSize) * superView.frame.size.width * 0.9)
        circleProgressBar.layoutIfNeeded()
        
        circleProgressBar.progressBarWidth = CGFloat(1000)
        circleProgressBar.startAngle = CGFloat(-90.0)
        circleProgressBar.progressBarProgressColor = UIColor.clear
        circleProgressBar.progressBarTrackColor = circleColor
        circleProgressBar.hintHidden = true
        circleProgressBar.setProgress(1.0, animated: true, duration: CGFloat(numberOfSeconds))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIApplication.shared.isIdleTimerDisabled = false //allow device to fall asleep, when timer is turnned off
    }
}
