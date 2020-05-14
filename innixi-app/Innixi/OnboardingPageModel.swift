//
//  OnboardingPageModel.swift
//  Innixi
//
//  Created by Rahul on 01/05/20.
//

import Foundation

class OnboardingPageModel {
    
    var question = ""
    
    var desc = ""
    
    var nickName = ""
    
    var answers = [OptionModel]()
    
    var isQuestionPage = false
    
    var prefixNameToQues = false
    
    init(question: String, desc: String, nickName: String) {
        self.question = question
        self.desc = desc
        self.nickName = nickName
    }
    
    init(question: String, desc: String, nickName: String, answers: [OptionModel]) {
        self.question = question
        self.desc = desc
        self.nickName = nickName
        self.answers = answers
        self.isQuestionPage = true
    }
    
    func setPrefixNameToQues() {
        self.prefixNameToQues = true
    }
    
    
    
    
}
