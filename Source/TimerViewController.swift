//
//  ViewController.swift
//  timer
//
//  Created by Ekaterina Zdorov on 3/29/18.
//  Copyright © 2018 Ekaterina Zdorov. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

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
