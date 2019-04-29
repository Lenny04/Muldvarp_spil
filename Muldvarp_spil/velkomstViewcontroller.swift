//
//  velkomstViewcontroller.swift
//  Muldvarp_spil
//
//  Created by linoj ravindran on 06/06/2016.
//  Copyright © 2016 linoj ravindran. All rights reserved.
//

import UIKit
class velkomstViewcontroller: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //resetScore()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sjov(_ thebutton: UIButton) {
        performSegue(withIdentifier: "segueSpilForSjov", sender: self)
    }
    @IBAction func oneminutmadness(_ thebutton: UIButton) {
        performSegue(withIdentifier: "segueSkrivNavn", sender: self)
    }
    @IBAction func tilHighscore(_ thebutton: UIButton) {
        performSegue(withIdentifier: "segueTilHighscore", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueTilHighscore") {
            if let destinationVC = segue.destination as? highscoreViewcontroller{
                //var viewController = segue.destination as! TredjeViewController
                //currentIndex = (listTableView.indexPathForSelectedRow?.row)!
            }
        }
    }
    func resetScore(){
        let dictionary = saveGame.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            saveGame.removeObject(forKey: "Name")
            saveGame.removeObject(forKey: "Score")
        }
    }
}

