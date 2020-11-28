//
//  TriviaQuestion.swift
//  Quiz
//
//  Created by Angel Jiang on 11/26/20.
//

import UIKit

class TriviaQuestion: Equatable {
    
    var question: String
    var answer: String
    
    init(question: String, answer: String) {
        self.question = question
        self.answer = answer
    }

    
    static func ==(lhs: TriviaQuestion, rhs: TriviaQuestion) -> Bool {
        return lhs.question == rhs.question
            && lhs.answer == rhs.answer 
    }
}
