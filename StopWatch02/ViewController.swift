//
//  ViewController.swift
//  StopWatch02
//
//  Created by 방문 사용자 on 2019. 4. 4..
//  Copyright © 2019년 방문 사용자. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var time = 0
    var min = 0
    var sec = 0
    
    //Timaer 객체생성
    var myTimer = Timer()
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIBarButtonItem!
    @IBOutlet weak var pauseButton: UIBarButtonItem!
    @IBOutlet weak var stopButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timeLabel.text = String .localizedStringWithFormat("%02d:%02d.%02d", min, sec, time)
    }
    
    @IBAction func startBtnPressed(_ sender: Any) {
        myTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        changeButtonState(start: false, pause: true, stop: true)
    }
    
    @IBAction func pauseBtnPressed(_ sender: Any) {
        //Timer 정지 기능
        myTimer.invalidate()
        changeButtonState(start: true, pause: false, stop: true)
    }
    
    @IBAction func restartBtnPressed(_ sender: Any) {
        myTimer.invalidate()
        time = 0
        timeLabel.text = String(time)
        changeButtonState(start: true, pause: false, stop: false)
    }
    
    @objc func updateTime(){
        time += 1
        timeLabel.text = String .localizedStringWithFormat("%02d:%02d.%02d", min, sec, time)
        
        if(time == 100){
            time = 0
            sec += 1
        }
        
        if(sec == 60){
            sec = 0
            min += 1
        }
    }
    
    func changeButtonState(start:Bool, pause:Bool, stop:Bool){
        startButton.isEnabled = start
        pauseButton.isEnabled = pause
        stopButton.isEnabled = stop
    }
}

