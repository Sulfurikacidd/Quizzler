//
//  Quiz_Data.swift
//  Quizzler-iOS13
//
//  Created by Muhammad Talal on 2025-02-08.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation

struct Quiz_Data {
    
    let quiz_arr : [Question] = [
        Question(q: "1. A slug's blood is green.", a: "True"),
        Question(q: "2. Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "3. The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "4. In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "5. In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "6. It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "7. You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "8. Google was originally called 'Backrub'.", a: "True"),
        Question(q: "9. Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "10. The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "11. No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "12. Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    var questionNumber = 0
    var score = 0
    
    func getQuestionText() -> String {
        return quiz_arr[questionNumber].text
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz_arr[questionNumber].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    mutating func nextQuestion() {
        if questionNumber < quiz_arr.count - 1 { //checking arr bounds
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
    
    func getProgress() -> Float {
        let progress = Float(questionNumber + 1)/Float(quiz_arr.count)
        return progress
    }
    
    func getScore() -> Int {
        return score
    }

    
}
