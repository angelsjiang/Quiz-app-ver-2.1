//
//  DetailViewController.swift
//  Quiz
//
//  Created by Angel Jiang on 11/28/20.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var questionField: UITextField!
    @IBOutlet var answerField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    
    var triviaQuestion: TriviaQuestion! {
        didSet {
            navigationItem.title = triviaQuestion.question
        }
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    
    // dismiss keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func tapBackground(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
    }
    
    
    
    @IBAction func chooseImageSource(_ sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
            print("Present Camera")
        }
        alertController.addAction(cameraAction)
        
        let imageLibraryAction = UIAlertAction(title: "Image Library", style: .default) { _ in
            print("Present Image Library")
        }
        alertController.addAction(imageLibraryAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(triviaQuestion.question)
        questionField.text = triviaQuestion.question
        print(triviaQuestion.answer)
        answerField.text = triviaQuestion.answer
        dateLabel.text = dateFormatter.string(from: triviaQuestion.date)
    }
    
    // saves changes into question
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // clear firstResponder, dismiss keyboard
        view.endEditing(true)
        
        triviaQuestion.question = questionField.text ?? ""
        triviaQuestion.answer = answerField.text ?? ""
        
        
    }
}
