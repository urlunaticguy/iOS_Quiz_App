//
//  ViewController.swift
//  QuizApp
//
//  Created by Souvik Das on 30/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var startstopB: UIButton!
    @IBOutlet weak var ansBOne: UIButton!
    @IBOutlet weak var ansBTwo: UIButton!
    @IBOutlet weak var ansBThree: UIButton!
    @IBOutlet weak var ansBFour: UIButton!
    
    //i dont yet know how to make api calls so i am using questions from manual arrays 🤓
    var questions = ["World War II, also known as the Second World War, was a global war that lasted from",
                     "Which countries were involved in World War II?",
                     "Who was the leader of England during WWII?"]
    var options = [["1939 to 1945","1940 to 1946","1935 to 1940","None of these"],
                   ["Australia","Britain","Germany","All of these"],
                   ["Benito Mussolini","Winston Churchill","Emperor Hirohito","None of these"]]
    var answers = ["1939 to 1945","All of these","Winston Churchill"]
    var questionNumber = 0
    var answer = ""
    var ansPressedTracker = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        appOpen()
    }

    @IBAction func startStopButton(_ sender: UIButton) {
        throwQuestion()
        sender.setTitle("STOP", for: .normal)
    }
    
    @IBAction func optionsButtonPressed(_ sender: UIButton) {
        if ansPressedTracker == 0 { //first time user enters an answer to a question
            let userAnswer = sender.currentTitle!
            if answer == userAnswer {
                sender.tintColor = UIColor(red: 0.00, green: 0.50, blue: 0.17, alpha: 1.00)
            }
            ansPressedTracker += 1
        }
        
    }
    
    func appOpen() {
        questionLabel.text = ""
        scoreLabel.text = ""
        startstopB.setTitle("START", for: .normal)
        ansBOne.setTitle("", for: .normal)
        ansBTwo.setTitle("", for: .normal)
        ansBThree.setTitle("", for: .normal)
        ansBFour.setTitle("", for: .normal)
    }
    
    func throwQuestion() {
        questionLabel.text = questions[questionNumber]
        ansBOne.setTitle(options[questionNumber][0], for: .normal)
        ansBTwo.setTitle(options[questionNumber][1], for: .normal)
        ansBThree.setTitle(options[questionNumber][2], for: .normal)
        ansBFour.setTitle(options[questionNumber][3], for: .normal)
        answer = answers[questionNumber]
        ansPressedTracker = 0
    }
    
}

