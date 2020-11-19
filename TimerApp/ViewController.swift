//
//  ViewController.swift
//  TimerApp
//
//  Created by aytug on 19.11.2020.
//  Copyright © 2020 aytug. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var timer = Timer()
    var counter = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = "Time: \(counter)"
        stopButton.isHidden = true
    }
    
    @objc func timerFunc(){
        counter -= 1
        
        if counter == 0 {
            timer.invalidate()
            timeLabel.text = "Time is Over"
            changeButton(isEnable: true)
            stopButton.isHidden = true
        } else {
            timeLabel.text = "Time: \(counter)"
        }
        
    }

    @IBAction func buttonClicked(_ sender: Any) {
        stopButton.isHidden = false
        changeButton(isEnable: false)
        
        counter = 10
        timeLabel.text = "Time: \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopButtonClicked(_ sender: Any) {
        timer.invalidate()
        changeButton(isEnable: true)
        stopButton.isHidden = true
        timeLabel.text = "Time: \(counter)"
    }
    
    func changeButton(isEnable : Bool!){
        if isEnable {
            button.setTitle("Start Timer", for: UIControl.State.normal)
            button.isEnabled = true
        } else{
            button.setTitle("Timer Running...", for: UIControl.State.normal)
            button.isEnabled = false
        }
    }
    
}

