//
//  ViewController.swift
//  Muldvarp_spil
//
//  Created by linoj ravindran on 01/12/2015.
//  Copyright © 2015 linoj ravindran. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    var antalRigtigeInt = 0
    var highscoreNavn = ""
    var newNumber = 0
    var oldNumber = 0
    let img : UIImage = UIImage(named: "Muldvarp")!
    let img2 : UIImage = UIImage(named: "stop")!
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    @IBOutlet weak var Button5: UIButton!
    @IBOutlet weak var Button6: UIButton!
    @IBOutlet weak var Button7: UIButton!
    @IBOutlet weak var Button8: UIButton!
    @IBOutlet weak var Button9: UIButton!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var antalRigtige: UILabel!
    var Tid = Timer()
    var timerCount = 0.0
    @objc func Counting(){
        if(antalRigtigeInt <= 20){
        timerCount += 1
        if(timerCount == 2){
            clearAll()
            timerCount = 0
            antalRigtigeInt = 0
            antalRigtige.text = String (antalRigtigeInt)
            generateGame()
        }
        }
        else if(antalRigtigeInt > 20 && antalRigtigeInt <= 30){
            label1.text = "Klik på muldvarpen inden 1 sekundt!"
            timerCount += 1
            if(timerCount == 1){
                clearAll()
                timerCount = 0
                antalRigtigeInt = 0
                antalRigtige.text = String (antalRigtigeInt)
                generateGame()
            }
        }
        
        else if(antalRigtigeInt > 30){
            label1.text = "Klik på muldvarpen inden 1/2 sekundt!"
            timerCount += 1
            if(timerCount == 0.5){
                clearAll()
                timerCount = 0
                antalRigtigeInt = 0
                antalRigtige.text = String (antalRigtigeInt)
                generateGame()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        generateGame()
         Tid = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.Counting), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tilbageTilVelkomst(_ thebutton: UIButton) {
        performSegue(withIdentifier: "segueTilbageTilVelkomst", sender: self)
    }
    func generateGame(){
        newNumber = Int(arc4random_uniform(9)+1)
        if(oldNumber == newNumber){
            generateGame()
        }
        else{
            oldNumber = newNumber
            switch(newNumber){
            case 1:
                Button1.setImage(img, for: UIControlState())
                break
            case 2:
                Button2.setImage(img, for: UIControlState())
                break
            case 3:
                Button3.setImage(img, for: UIControlState())
                break
            case 4:
                Button4.setImage(img, for: UIControlState())
                break
            case 5:
                Button5.setImage(img, for: UIControlState())
                break
            case 6:
                Button6.setImage(img, for: UIControlState())
                break
            case 7:
                Button7.setImage(img, for: UIControlState())
                break
            case 8:
                Button8.setImage(img, for: UIControlState())
                break
            case 9:
                Button9.setImage(img, for: UIControlState())
                break
            default:
                Button1.setImage(img, for: UIControlState())
                break
            }
        }
    }
    
    @IBAction func button1(_ thebutton: UIButton) {
        knapper(thebutton)
    }
    @IBAction func button2(_ thebutton: UIButton) {
        knapper(thebutton)
    }
    @IBAction func button3(_ thebutton: UIButton) {
        knapper(thebutton)
    }
    @IBAction func button4(_ thebutton: UIButton) {
        knapper(thebutton)
    }
    @IBAction func button5(_ thebutton: UIButton) {
        knapper(thebutton)
    }
    @IBAction func button6(_ thebutton: UIButton) {
        knapper(thebutton)
    }
    @IBAction func button7(_ thebutton: UIButton) {
        knapper(thebutton)
    }
    @IBAction func button8(_ thebutton: UIButton) {
        knapper(thebutton)
    }
    @IBAction func button9(_ thebutton: UIButton) {
        knapper(thebutton)
    }
    func clearAll(){
        Button1.setImage(nil, for: UIControlState())
        Button2.setImage(nil, for: UIControlState())
        Button3.setImage(nil, for: UIControlState())
        Button4.setImage(nil, for: UIControlState())
        Button5.setImage(nil, for: UIControlState())
        Button6.setImage(nil, for: UIControlState())
        Button7.setImage(nil, for: UIControlState())
        Button8.setImage(nil, for: UIControlState())
        Button9.setImage(nil, for: UIControlState())
    }
    func knapper(_ thebutton: UIButton){
        if(thebutton.currentImage == UIImage(named: "Muldvarp")){
            clearAll()
            timerCount = 0
            antalRigtigeInt += 1
            antalRigtige.text = String (antalRigtigeInt)
            generateGame()
        }
        else if(thebutton.currentImage == UIImage(named: "stop")){
            clearAll()
            timerCount = 0
            generateGame()
            label1.text = "Klik på muldvarpen inden 2 sekunder!"
            Tid = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.Counting), userInfo: nil, repeats: true)
        }
        else{
            clearAll()
            thebutton.setImage(img2, for: UIControlState())
            label1.text = "Klik på stopskiltet for at starte forfra!"
            antalRigtigeInt = 0
            antalRigtige.text = String (antalRigtigeInt)
            timerCount = 0
            Tid.invalidate()
        }
    }
}

