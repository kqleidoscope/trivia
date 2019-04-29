//
//  HomeVC.swift
//  Trivia
//
//  Created by Hiroki on 2019/04/29.
//  Copyright © 2019 Hiroki. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var getStarted: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeImageView.image = UIImage(named: "brainmeme")
        
    }
    

    @IBAction func getStartedPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "GetStarted", sender: nil)
    }
    
}
