//
//  highscoreViewcontroller.swift
//  Muldvarp_spil
//
//  Created by linoj ravindran on 06/06/2016.
//  Copyright © 2016 linoj ravindran. All rights reserved.
//

import UIKit
class highscoreViewcontroller: UIViewController{
    @IBOutlet internal weak var navnLabel: UILabel!
    @IBOutlet internal weak var scoreLabel: UILabel!
    let scoreGemt = saveGame.integer(forKey: "Score")
    var navnGemt = ""
    override func viewDidAppear(_ animated: Bool) {
        if(scoreGemt != 0){
            navnGemt = String (describing: saveGame.object(forKey: "Name")!)
            navnLabel.text = "\(navnGemt):"
            scoreLabel.text = "\(scoreGemt) point"
        }
        else{
            navnLabel.text = "Ingen highscore"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(scoreGemt != 0){
            navnGemt = String (describing: saveGame.object(forKey: "Name")!)
            navnLabel.text = "\(navnGemt):"
            scoreLabel.text = "\(scoreGemt) point"
        }
        else{
            navnLabel.text = "Ingen highscore"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func tilbageTilVelkomst(_ thebutton: UIButton) {
        performSegue(withIdentifier: "segueTilbageTilVelkomst", sender: self)
    }
}
