//
//  ResultVC.swift
//  Trivia
//
//  Created by Hiroki on 2019/04/29.
//  Copyright © 2019 Hiroki. All rights reserved.
//

import UIKit
import AVFoundation

class ResultVC: UIViewController {

    @IBOutlet weak var resultScreenLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var congratulationLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    
    var audioPlayer = AVAudioPlayer()
    var highscoreDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if score >= 5 {
        congratulationLabel.text = "Congratulation!"
        resultScreenLabel.text = "You Scored \(score)/10"
        playSound(soundName: "applause2", audioPlayer: &audioPlayer)
        imageView.image = UIImage(named: "animal_quiz_neko_maru")
        }else{
            congratulationLabel.text = "Nice Try!"
            resultScreenLabel.text = "You Scored \(score)/10"
            imageView.image = UIImage(named: "animal_quiz_neko_batsu")
        }
        if score > highscore {
            highscore = score
            highscoreLabel.text = "Highscore: \(highscore)/10"
            highscoreDefault.set(highscore, forKey: "Highscore")
        }else{
            
            highscoreLabel.text = "Highscore: \(highscoreDefault.integer(forKey: "Highscore"))/10"
        }
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        if let sound = NSDataAsset(name: soundName) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            }catch{
                print("ERROR: data in sound couldn't be played as a sound.")
            }
        }else{
            print("ERROR: file sound didn't load")
        }
    }
    
    @IBAction func tryAgainButton(_ sender: UIButton) {
        performSegue(withIdentifier: "TryAgain", sender: nil)
    }
    
    

}
