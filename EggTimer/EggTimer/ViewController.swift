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
    var eggTime = ["Soft": 4,"Medium":6, "Hard":8]
    var totalTime = 0
    var secondsPassed = 0
    var audioPlayer = AVAudioPlayer()
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        progressBar.progress=0.0
        secondsPassed = 0
        titleLabel.text = hardness
        let sound = Bundle.main.path(forResource: "alarm_sound", ofType:
        "mp3")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        catch
                                            {
                print(error)
            }
       
        
      
        totalTime = eggTime[hardness]!
        // print(eggTime[hardness]!)
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
            if self.secondsPassed < self.totalTime {
                self.secondsPassed += 1
                self.progressBar.progress = Float(secondsPassed)/Float(totalTime)
               // print(percentageProgress)
               print(Float(secondsPassed)/Float(totalTime))
                
                //print ("\(self.totalTime) seconds")
                
                
                
                
            }
           
            else {
                Timer.invalidate()
                self.titleLabel.text="Done!"
                audioPlayer.play()
                
               // self.progressBar.progress=1
            }
        }
    }
    
}
