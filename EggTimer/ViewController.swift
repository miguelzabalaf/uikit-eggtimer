//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressBarCount: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var countdownTimer: Timer!
    var totalTime: Int = 0
    var currentTime: Int = 0
    
    let eggTimes = [
        "Soft": 5,
        "Medium": 7,
        "Hard": 12
    ]

    @IBAction func handleSelectEgg(_ sender: UIButton) {
        let eggSelected = sender.currentTitle!
        let minutes = eggTimes[eggSelected]!
        let timeCalculated = minutes * 60
        totalTime = timeCalculated
        currentTime = timeCalculated
        progressBarCount.setProgress(1, animated: false)
        progressBarCount.alpha = 1
        startCountDown()
        titleLabel.text = "In progress"
    }
    
    @objc func updateTimer() {
        currentTime -= 1
        progressBarCount.setProgress(Float(currentTime) / Float(totalTime), animated: true)
        
        if currentTime <= 0 {
            endTimer()
        }
    }
    
    func startCountDown() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func endTimer() {
        countdownTimer.invalidate()
        progressBarCount.alpha = 0
        titleLabel.text = "DONE!"
        print("El contador ha terminado")
    }
}
