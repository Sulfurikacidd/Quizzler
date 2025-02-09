//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //@IBoutlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    
    //Global vars
    var questionNumber = 0
    
    let quiz_arr : [Question] = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.updateUI()
    }

    //IBActions
    @IBAction func answerPressed(_ sender: UIButton) {
        self.checkAnswer(sender)
        self.moveToNextQuestion()
    }
    
    
    //Functions
    func checkAnswer(_ sender: UIButton) {
        guard let userAnswer = sender.currentTitle else { return }
        let correctAnswer = quiz_arr[questionNumber].answer
        
        if userAnswer == correctAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
    }
    
    func moveToNextQuestion() {
        if questionNumber < quiz_arr.count - 1 {
            questionNumber += 1
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        } else {
            self.resetUI()
        }
    }
    
    @objc func updateUI() {
        questionLabel.text = quiz_arr[questionNumber].text
        progressBar.progress = Float(questionNumber + 1)/Float(quiz_arr.count)
        trueBtn.backgroundColor = UIColor.clear
        falseBtn.backgroundColor = UIColor.clear
    }
    
    func resetUI() {
        questionNumber = 0
        questionLabel.text = quiz_arr[questionNumber].text
        trueBtn.backgroundColor = UIColor.clear
        falseBtn.backgroundColor = UIColor.clear
        progressBar.progress = Float(questionNumber + 1)/Float(quiz_arr.count)
        
    }

}

