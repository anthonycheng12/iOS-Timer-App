//
//  ViewController.swift
//  stopWatch
//
//  Created by Anthony Cheng on 7/25/18.
//  Copyright © 2018 Anthony Cheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var runButton: UIButton!
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var minus: UIButton!
    
    var seconds = 0;
    var timer = Timer() //timer
    var isTimerRunning = false;
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //makes sure the counter is correctly set when the app is first opened
        counter.text = timeString(time: TimeInterval(seconds))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addTime(_ sender: Any){
        seconds += 60
        counter.text = timeString(time: TimeInterval(seconds))
    }
    
    @IBAction func minusTime(_ sender: Any){
        if(seconds >= 60){
            seconds -= 60
            counter.text = timeString(time: TimeInterval(seconds))
        }
    }
    
    @IBAction func runAction(_ sender: Any){
        if isTimerRunning == false {
            //if timer is not running then start the timer and set image to pause
            runTimer()
            runButton.setImage(UIImage(named: "pause"), for: .normal)
        } else{ //stops the timer
            isTimerRunning = false
            timer.invalidate()
            runButton.setImage(UIImage(named: "play"), for: .normal)
        }
    }
    
    @IBAction func resetAction(_ sender: Any){
        timer.invalidate()
        isTimerRunning = false
        runButton.setImage(UIImage(named: "play"), for: .normal)
        seconds = 0
        counter.text = timeString(time: TimeInterval(seconds))
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true;
    }
    
    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
        } else {
            seconds -= 1
            counter.text = timeString(time: TimeInterval(seconds))
        }
    }
    
    func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }


}

