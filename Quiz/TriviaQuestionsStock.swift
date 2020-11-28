//
//  TriviaQuestionsStock.swift
//  Quiz
//
//  Created by Angel Jiang on 11/26/20.
//

import UIKit

class TriviaQuestionsStock {
    
    static let sharedInstance = TriviaQuestionsStock()
    
    var questionArray = [TriviaQuestion]() {
        didSet {
            print("something changed!")
        }
    }
    
    // create
    func createQuestion(question: String, answer: String) {
        let triviaQuestion = TriviaQuestion(question: question, answer: answer)
        
        questionArray.append(triviaQuestion)
        
    }
    
    // pre-populate the array
    init() {
        createQuestion(question: "How many elements are on the Periodic table?", answer: "118")
        createQuestion(question: "How many members are in the K-pop group named BTS?", answer: "7")
        createQuestion(question: "On average, how many seeds does a strawberry have on its surface?", answer: "200")
        createQuestion(question: "How many members were there in The Beatles?", answer: "4")
        createQuestion(question: "Approximately how many percent of the human body is made up of water?", answer: "60")
        createQuestion(question: "How many Inifinity Stones feature in the Marvel Cinematic Universe films?", answer: "6")
        createQuestion(question: "Which day of July is Canada Day?", answer: "1")
    }
    
    
    // remove an item, might not use
    func removeItem(_ question: TriviaQuestion) {
        if let index = questionArray.firstIndex(of: question) {
            questionArray.remove(at: index)
        }
    }
    
    
    // reordering item
    func reOrdering(from fromIndex: Int, to toIndex: Int ) {
        // in case if the question is placed at the exact same position
        if fromIndex == toIndex {
            return
        }
        
        let movedQuestion = questionArray[fromIndex]
        
        questionArray.remove(at: fromIndex)
        
        questionArray.insert(movedQuestion, at: toIndex)
    }
}
