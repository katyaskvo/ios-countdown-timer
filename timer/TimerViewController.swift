//
//  ViewController.swift
//  timer
//
//  Created by Ekaterina Zdorov on 3/29/18.
//  Copyright © 2018 Ekaterina Zdorov. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
  @IBAction func munute1tapped(_ sender: UIButton) {
        performSegue(withIdentifier: "timer1min", sender: self)
    }
    @IBAction func minutes2tapped(_ sender: Any) {
        performSegue(withIdentifier: "timer2mins", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 1 min
        if (segue.identifier == "timer1min") {
            let destVC : CountDownViewController = segue.destination as! CountDownViewController
            destVC.numberOfSeconds = 60
            destVC.runTimer()
        }
        
        // 2 mins
        if (segue.identifier == "timer2mins") {
            let destVC : CountDownViewController = segue.destination as! CountDownViewController
            destVC.numberOfSeconds = 120
            destVC.runTimer()
        }

    }
}

