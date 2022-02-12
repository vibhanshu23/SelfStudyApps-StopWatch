//
//  ViewController.swift
//  stopWatch
//
//  Created by Vibhanshu Jain on 2/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var btnStartStop: UIButton!
    @IBOutlet weak var btnReset: UIButton!
    var isTimerRunning:Bool = false
    var timerStopWatch:Timer = Timer()
    var timeElapsed:Date? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblTimer.text = "00:00:00:000"
        btnReset.setTitle("Reset", for: .normal)
        btnStartStop.setTitle("Start", for: .normal)
        
    }
    @IBAction func onClickStartStop(_ sender: Any) {
        
        if(isTimerRunning){
            timerStopWatch.invalidate()
            //            timerStopWatch.va
            
            btnStartStop.setTitle("Resume", for: .normal)
            
        }
        else{
            if(timeElapsed == nil) {
                timeElapsed = Date()
            }
            timerStopWatch = .scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerSelector), userInfo: nil, repeats: true)
            btnStartStop.setTitle("Pause", for: .normal)
            
            
            
        }
        isTimerRunning = !isTimerRunning
    }
    
    @IBAction func onClickReset(_ sender: Any) {
        
        timerStopWatch.invalidate()
        timeElapsed = nil
        lblTimer.text = "00:00:00:000"
        btnStartStop.setTitle("Start", for: .normal)

        
        
    }
    
    @objc func timerSelector(_ timer:Timer){
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        let dateNow = Date()
        let intervalTime = dateNow.timeIntervalSince(timeElapsed!)
        
        //        let dateDiff = timeElapsed.date
        lblTimer.text = stringFromTimeInterval(interval: intervalTime)
    }
    
    func stringFromTimeInterval(interval: TimeInterval) -> String {
        
        let ti = NSInteger(interval)
        
        let ms = Int((interval.truncatingRemainder(dividingBy: 1)) * 1000)
        
        let seconds = ti % 60
        let minutes = (ti / 60) % 60
        let hours = (ti / 3600)
        
        return String(format: "%0.2d:%0.2d:%0.2d:%0.3d",hours,minutes,seconds,ms)
    }
    
}


