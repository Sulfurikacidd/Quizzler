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
    @IBOutlet weak var scoreLabel: UILabel!
    
    //Golobal vars
    var quiz_data = Quiz_Data()
    
    //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateUI()
    }

    //IBActions
    @IBAction func answerPressed(_ sender: UIButton) {
        
        guard let userAnswer = sender.currentTitle else { return }
        let userGotItRight = quiz_data.checkAnswer(userAnswer)
        
        
        //controller talking to model
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quiz_data.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    
    //controller talking to view
    @objc func updateUI() {
        questionLabel.text = quiz_data.getQuestionText()
        progressBar.progress = quiz_data.getProgress()
        
        trueBtn.backgroundColor = UIColor.clear
        falseBtn.backgroundColor = UIColor.clear
        
        scoreLabel.text = "Score: \(quiz_data.getScore())" + "/12"
    }

}

