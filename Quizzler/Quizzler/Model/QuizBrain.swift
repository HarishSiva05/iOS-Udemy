//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Harish Sivaram on 30/01/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
struct QuizBrain {
    let quiz = [
        Questions(text: "Four + Two = Six", answer: "True"),
        Questions(text: "Tony Stark is IronMan", answer: "True"),
        Questions(text: "I hate Selena", answer: "False"),
        Questions(text: "A slug's blood is green.", answer: "True"),
        Questions(text: "Approximately one quarter of human bones are in the feet.", answer: "True"),
        Questions(text: "The total surface area of two human lungs is approximately 70 square metres.", answer: "True"),
        Questions(text: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer:"True"),
        Questions(text: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: "False"),
        Questions(text: "It is illegal to pee in the Ocean in Portugal.", answer: "True"),
        Questions(text: "You can lead a cow down stairs but not up stairs.", answer: "False"),
        Questions(text: "Google was originally called 'Backrub'.", answer: "True"),
        Questions(text: "Buzz Aldrin's mother's maiden name was 'Moon'.", answer: "True"),
        Questions(text: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answer: "False"),
        Questions(text: "No piece of square dry paper can be folded in half more than 7 times.", answer: "False"),
        Questions(text: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answer: "True")
        
        
        
    ]
    
   
    var questionNumber = 0
    var score = 0
    mutating func checkAnswer(userAnswer: String) -> Bool
    {
        if(userAnswer == quiz[questionNumber].answer)
        {
            score += 1
            return true
        }
        else {
            return false
        }
    }
    func getScore()-> Int{
        return score
       
        
    }
    func getProgress()-> Float{
        
        let progress = Float(questionNumber+1)/Float(quiz.count)
        return progress
    }
    func getQuestionText()->String {
       return  quiz[questionNumber].text
    }
   mutating func nextQuestion (){
        if(questionNumber < quiz.count-1)
        {
            questionNumber += 1
           
        }
        else {
            questionNumber = 0
            score = 0
            
        }
    }
    
    
    
}
