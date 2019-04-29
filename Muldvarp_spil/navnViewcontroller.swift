//
//  navnViewcontroller.swift
//  Muldvarp_spil
//
//  Created by linoj ravindran on 06/06/2016.
//  Copyright © 2016 linoj ravindran. All rights reserved.
//

import UIKit
var navn = ""
class navnViewcontroller: UIViewController {
    @IBOutlet weak var navnTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(navnViewcontroller.didTapView))
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func spilForEnHighscore(_ thebutton: UIButton) {
        if(shouldPerformSegue(withIdentifier: "segueSpilForHighscore", sender: self) == true){
            navn = navnTextfield.text!
            performSegue(withIdentifier: "segueSpilForHighscore", sender: self)
        }
        else{
            
        }
    }
    @IBAction func tilbageTilVelkomst(_ thebutton: UIButton) {
        performSegue(withIdentifier: "segueTilbageTilVelkomst", sender: self)
    }
    @objc func didTapView(){
        navnTextfield.endEditing(true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueSpilForHighscore") {
            if let destinationVC = segue.destination as? ViewController2{
                destinationVC.highscoreNavn = navn
                //var viewController = segue.destination as! TredjeViewController
                
            }
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "segueSpilForHighscore" {
            if(navnTextfield.text?.isEmpty)!{
                let alertC = UIAlertController(title: "Fejl!", message: "Indtast navn!", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertC.addAction(defaultAction)
                present(alertC, animated: true, completion: nil)
                return false
            }
        }
        return true
    }
}
