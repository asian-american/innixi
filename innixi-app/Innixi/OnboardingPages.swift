//
//  OnboardingPages.swift
//  Innixi
//
//  Created by Rahul on 01/05/20.
//

import Foundation

class OnboardingPages {
    
    static var namePage :  OnboardingPageModel!
    
    static var eventPage: OnboardingPageModel!
    
    static var areasPage : OnboardingPageModel!
    
    static func createPages() {
        namePage = OnboardingPageModel(question: "Nice to meet you! How would you like to be called?", desc: "", nickName: "")
        
        
        eventPage = OnboardingPageModel(question: "Do any of these sound like you?", desc: "Select all that apply", nickName: "", answers: createOptions(options: ["I recently moved to a new place", "I’m navigating a breakup or divorce", "I’m experiencing a career change", "I’m facing COVID-related hardships", "|..."]))
        eventPage.prefixNameToQues = true
            
        
        areasPage = OnboardingPageModel(question: "Are the COVID-related hardships making any of these more difficult for you?", desc: "Select all that apply", nickName: "", answers: createOptions(options: ["Managing stress or anxiety", "Getting a healthy amount of sleep", "Exercising regularly", "Keeping healthy relationships", "Maintaining a work-life balance", "|..."]))
        
    }
    
    static func createOptions(options: [String]) -> [OptionModel] {
        var model = [OptionModel]()
        for option in options {
            model.append(OptionModel(optionText: option))
        }
        return model
    }
    
    static func getOnboardingPages() -> [OnboardingPageModel] {
        return [namePage, eventPage, areasPage]
    }
}

