//
//  QuestionsViewController.swift
//  Quiz
//
//  Created by Angel Jiang on 11/25/20.
//

import UIKit

class QuestionsViewController: UITableViewController {
    
    var triviaQuestions = TriviaQuestionsStock.sharedInstance
    var imageStore: ImageStore!

    
    // function for add buttion
    @IBAction func addQuestion(_ sender: UIBarButtonItem) {
        let newQuestion = triviaQuestions.createItem()
        
        
        // figure out where that question is in the array
        if let index = triviaQuestions.questionArray.firstIndex(of: newQuestion) {
            let indexPath = IndexPath(row: index, section: 0)
            
            // insert this new tow into the table
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    // adding edit button
    required init?(coder decoder: NSCoder) {
        super.init(coder:  decoder)
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    
    // implementing table view row deletion
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let question = triviaQuestions.questionArray[indexPath.row]
            
            triviaQuestions.questionArray.remove(at: indexPath.row)
            
            // also remove image from cache
            imageStore.deleteImage(forKey: question.imageKey)
            
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
    
    
    // get the updated table
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showQuestion":
            if let row = tableView.indexPathForSelectedRow?.row {
                let question = triviaQuestions.questionArray[row]
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.triviaQuestion = question
                detailViewController.imageStore = imageStore
            }
        case "newQuestion":
            let question = triviaQuestions.questionArray[triviaQuestions.questionArray.count - 1]
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.triviaQuestion = question
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
    
}
