//
//  ViewController2.swift
//  Muldvarp_spil
//
//  Created by linoj ravindran on 09/09/2016.
//  Copyright © 2016 linoj ravindran. All rights reserved.
//

import UIKit
let saveGame = UserDefaults.standard
class ViewController2: UIViewController {
    var highScore2 = "", highscoreNavn = ""
    var antalRigtige = 0, highscore = 0, newNumber = 0, oldNumber = 0
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
    @IBOutlet weak var antalRigtigeLabel: UILabel!
    @IBOutlet weak var tidTilbage: UILabel!
    var Tid = Timer()
    var tidsCounter = 60
    @objc func Counting(){
        tidsCounter -= 1
        tidTilbage.text = String(tidsCounter)
        if(tidsCounter == 0){
            clearAll()
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        generateGame()
        Tid = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController2.Counting), userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tilbageTilVelkomst(_ thebutton: UIButton) {
        performSegue(withIdentifier: "segueTilbageTilVelkomst", sender: self)
    }
    @IBAction func tilHighscoreListen(_ thebutton: UIButton) {
        performSegue(withIdentifier: "segueTilHighscore", sender: self)
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
            antalRigtige += 1
            antalRigtigeLabel.text = String (antalRigtige)
            generateGame()
        }
            
        else{
            clearAll()
                let scoreGemt = saveGame.integer(forKey: "Score")
                if(antalRigtige > scoreGemt){
                    let alertController = UIAlertController(title: "Tillykke!", message: "Du har lavet en ny highscore på \(antalRigtige) point!", preferredStyle: .alert)
                    let imageAction = UIAlertAction(title: "", style: .default, handler: nil)
                    let image = UIImage(named: "hej.png")
                    let alertViewPadding: CGFloat = 15
                    let left = -alertController.view.frame.size.width / 2 + image!.size.width + alertViewPadding
                    let centeredTopoImage = image?.withAlignmentRectInsets(UIEdgeInsetsMake(0, left, 0, 0)).withRenderingMode(.alwaysOriginal)
                    imageAction.setValue(centeredTopoImage, forKey: "image")
                    alertController.addAction(imageAction)
                    alertController.addAction(UIAlertAction(title: "Start nyt spil!", style: .default, handler: { _ in
                        self.clearAll()
                        self.generateGame()
                        self.label1.text = "Højest antal klik på 1 minut!"
                        self.antalRigtige = 0
                        self.antalRigtigeLabel.text = String (self.antalRigtige)
                        self.Tid = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController2.Counting), userInfo: nil, repeats: true)
                        self.tidsCounter = 60
                    }))
                    self.present(alertController, animated: true, completion: nil)
                    highscoreNavn = navn
                    highscore = antalRigtige
                    saveGame.set(highscore, forKey: "Score")
                    saveGame.set(highscoreNavn, forKey: "Name")
                }
            Tid.invalidate()
            let alertController2 = UIAlertController(title: "Game over!", message: "", preferredStyle: .alert)
            let imageAction2 = UIAlertAction(title: "", style: .default, handler: nil)
            let image2 = img2
            let alertViewPadding2: CGFloat = 15
            let left2 = -alertController2.view.frame.size.width / 2 + image2.size.width + alertViewPadding2
            let centeredTopoImage2 = image2.withAlignmentRectInsets(UIEdgeInsetsMake(0, left2, 0, 0)).withRenderingMode(.alwaysOriginal)
            imageAction2.setValue(centeredTopoImage2, forKey: "image")
            alertController2.addAction(imageAction2)
            alertController2.addAction(UIAlertAction(title: "Prøv igen!", style: .default, handler: { _ in
                self.clearAll()
                self.generateGame()
                self.label1.text = "Højest antal klik på 1 minut!"
                self.antalRigtige = 0
                self.antalRigtigeLabel.text = String (self.antalRigtige)
                self.Tid = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController2.Counting), userInfo: nil, repeats: true)
                self.tidsCounter = 60
            }))
            self.present(alertController2, animated: true, completion: nil)
        }
    }
}

