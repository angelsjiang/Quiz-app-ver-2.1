//
//  TriviaQuestion.swift
//  Quiz
//
//  Created by Angel Jiang on 11/26/20.
//

import UIKit

class TriviaQuestion: Equatable, Codable {
    
    var question: String
    var answer: String
    var date: Date
    
    init(question: String, answer: String) {
        self.question = question
        self.answer = answer
        self.date = Date()
    }

    
    static func ==(lhs: TriviaQuestion, rhs: TriviaQuestion) -> Bool {
        return lhs.question == rhs.question
            && lhs.answer == rhs.answer 
    }
}
