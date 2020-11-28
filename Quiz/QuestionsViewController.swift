//
//  QuestionsViewController.swift
//  Quiz
//
//  Created by Angel Jiang on 11/25/20.
//

import UIKit

class QuestionsViewController: UITableViewController {
    
    var triviaQuestions = TriviaQuestionsStock.sharedInstance
    
    
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        if isEditing {
            sender.setTitle("Edit", for: .normal)
            
            setEditing(false, animated: true)
        }
        else {
            sender.setTitle("Done", for: .normal)
            
            setEditing(true, animated: true)
            
            // need to reset all the scores & questions
            Resources.resources.FLBReset = true
            Resources.resources.MCQReset = true
            
            // reset scores
            Resources.resources.correctAns = 0
            Resources.resources.wrongAns = 0
            Resources.resources.flbScore = 0
            Resources.resources.mcqScore = 0
            
        }
    }
    
    // implementing table view row deletion
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            triviaQuestions.questionArray.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // implementing table view row reordering
    override func tableView(_ tableView: UITableView,
                            moveRowAt sourceIndexPath: IndexPath,
                            to destinationIndexPath: IndexPath) {
        triviaQuestions.reOrdering(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return triviaQuestions.questionArray.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell",
                                                 for: indexPath) as! QuestionCell
        
        let item = triviaQuestions.questionArray[indexPath.row]
        
        cell.questionLabel.text = item.question
        cell.answerLabel.text = item.answer
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 75
    }
    
}
