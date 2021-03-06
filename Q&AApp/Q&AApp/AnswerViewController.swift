//
//  AnswerViewController.swift
//  Q&AApp
//
//  Created by Lambda_School_Loaner_18 on 10/10/18.
//  Copyright © 2018 Lambda_School_Loaner_18. All rights reserved.
//


import UIKit

class AnswerViewController: UIViewController {
    
    var questionConroller: QuestionController?
    
    var question : Question?
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var askerLabel: UILabel!
    @IBOutlet weak var answererNameTextField: UITextField!
    @IBOutlet weak var answerTextView: UITextView!
    
    
    @IBAction func submitAnswer(_ sender: Any) {
        guard let answererName = answererNameTextField.text,
            let answerText = answerTextView.text,
            let question = question else {return}
        
        questionConroller?.updateQuestion(question: question, answer: answerText, answerer: answererName)
        navigationController?.popViewController(animated: true)
        
    }
    
    func updateViews(){
        
        guard let question = question else { return }
        
        title = question.question
        questionLabel.text = question.question
        askerLabel.text = question.asker
        
        guard let answerer = question.answerer,
            let answer = question.answer else { return }
        
        answererNameTextField.text = answerer
        answerTextView.text = answer
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
