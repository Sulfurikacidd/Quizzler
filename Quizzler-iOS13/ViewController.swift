//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //store q/a in 2D Array
    //check answers
    //loop questions
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    
    var questionNumber = 0
    
    let quiz_arr = [
        ["Is Four + Two equal to six ?", "True"],
        ["Is Five - Three equal to two?", "True"],
        ["Three + Eight less than 10 ?", "False"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.updateUI()
    }

    @IBAction func answerPressed(_ sender: UIButton) {
        
        //get user's and actual answer
        guard let userAnswer = sender.currentTitle else { return }
        let correctAnswer = quiz_arr[questionNumber][1]
        
        //check to see if the answer is correct
        if userAnswer == correctAnswer {
            print("Right !!")
        } else {
            print("Wrong !!")
        }
        
        //move to the next question
        if questionNumber < quiz_arr.count - 1 {
            questionNumber += 1
            self.updateUI()
        } else {
            self.resetUI()
        }
        
    }
    
    func updateUI() {
        questionLabel.text = quiz_arr[questionNumber][0]
    }
    
    func resetUI() {
        questionNumber = 0
        questionLabel.text = quiz_arr[questionNumber][0]
    }

}

