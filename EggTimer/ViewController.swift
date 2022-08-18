//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    

    @IBAction func clicked(_ sender: UIButton) {
       
    }
    
    
    @IBOutlet weak var pro: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if pro != nil  {
            pro.progress=0}
    }
    
    var player:AVAudioPlayer?

    var myTimer: Timer?
    var seconds:Int?
    var ss:Float?
    var p:Float = 0
    @IBAction func clicked2(_ sender: UIButton) {
        if myTimer==nil {
 
        let url=Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        do {
            player=try AVAudioPlayer(contentsOf: url!)
        } catch let error {
            print(error)
        }
            
        if sender.titleLabel?.text=="Soft" {
            seconds=5*60
         
          
        }
       else if sender.titleLabel?.text=="Medium" {
            seconds=8*60
          
            
        }
        
       else {
        
        seconds=12*60
        
       }
        
        ss=Float(seconds!)
        myTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){_ in
            self.seconds!-=1
            self.p+=(1/self.ss!)
            self.pro.progress=self.p
            if self.seconds==0 {
                self.player?.play()
                self.myTimer?.invalidate()
                self.myTimer = nil
                self.p=0
            }
            
        }
        myTimer?.fire()
          
        }
    }
}
