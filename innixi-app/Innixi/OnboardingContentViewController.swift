//
//  OnboardingContentViewController.swift
//  Innixi
//
//  Created by Rahul on 30/04/20.
//

import UIKit

class OnboardingContentViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var nickNameField: UITextField!
    
    @IBOutlet weak var nickNameLabel: UILabel!
    
    @IBOutlet weak var optionCollection: UICollectionView!
    
    
    var pageIndex: Int!
    var pageData: OnboardingPageModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        optionCollection.delegate = self
        optionCollection.dataSource = self
        // Do any additional setup after loading the view.
        
        var ques: String!
        if pageData.prefixNameToQues {
            ques = "Hi, \(Utils.getUserName()). \(pageData.question)"
        }else {
            ques = pageData.question
        }
        questionLabel.text = ques
        descLabel.text = pageData.desc
        if pageData.isQuestionPage{
            nickNameField.isHidden = true
            nickNameLabel.isHidden = true
            optionCollection.isHidden = false
        }else{
            nickNameField.isHidden = false
            nickNameLabel.isHidden = false
            optionCollection.isHidden = true
            
            nickNameField.attributedPlaceholder =  NSAttributedString(string: "Nickname", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
            nickNameField.setUnderLine()
            nickNameField.delegate = self
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == nickNameField {
            Utils.setUser(name: nickNameField.text ?? "")
        }
        return true
    }
    
    func setOnboardingContent(pageIdx: Int, onboardingPage: OnboardingPageModel) {
        if self.pageData == nil {
            self.pageIndex = pageIdx
            self.pageData = onboardingPage
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageData!.answers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnswerCell", for: indexPath) as! AnswerOptionCollectionViewCell
        cell.setAnswer(answerData: self.pageData!.answers[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! AnswerOptionCollectionViewCell
        
        cell.onClick()
    }
    
    
    
    
    
    

}
