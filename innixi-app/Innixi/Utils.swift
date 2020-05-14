//
//  Utils.swift
//  Innixi
//
//  Created by Rahul on 17/04/20.
//

import Foundation

class Utils {
    
    static var INNIXI_PURPLE = UIColor(displayP3Red: 0.346, green: 0.341, blue: 1.000, alpha: 100)
    
    static var INNIXI_BEIGE = UIColor(displayP3Red: 0.997, green: 0.970, blue: 0.922, alpha: 100)
    
    static var INNIXI_GRAD_START = UIColor(displayP3Red: (167/255.0), green: (205/255.0), blue: (255/255.0), alpha: 100)
    
    static var INNIXI_GRAD_END = UIColor(displayP3Red: (111/255.0), green: (61/255.0), blue: (255/255.0), alpha: 100)
    
    static var INNIXI_PURPLE_TEXT = UIColor(displayP3Red: (84/255.0), green: (86/255.0), blue: (254/255.0), alpha: 100)
    
    static var username = ""
    
    static var isLoggedIn = false
    
    static func setUser(name: String) {
        username = name
    }
    
    static func getUserName() -> String {
        return username
    }
    
    static func setLogedIn(login: Bool)  {
        isLoggedIn = login
    }
    
    static func isLogedIn() -> Bool {
        return isLoggedIn
    }

    static func getOptions(options:[String], withCheckBox:Bool) -> [OptionModel] {
        
        var optionsArray = [OptionModel]()
        
        for optionText in options {
            optionsArray.append(OptionModel(optionText: optionText, hasCheckBox: withCheckBox))
        }
        return optionsArray
    }
    
    static func setPageControlColor() {
        let pageControl = UIPageControl.appearance()
        pageControl.currentPageIndicatorTintColor = UIColor.white
        pageControl.pageIndicatorTintColor = UIColor.gray
    }
    
    
    static func completeCheckinText(checkInNo: Int) -> String {
        return "You just completed\ncheck-in \(checkInNo) !"
    }
    
    static func pendingCheckinText(completeCheckins: Int) -> String {
        return "Complete \(completeCheckins) check-ins to get\nbetter insights on your progress"
    }
    
    
    static func getInsightText(sleepTime: Float, days: Int) -> String {
        return "Get plenty of sleep tonight to keep your plant healthy. These strategies might help you catch more Z's."
//        return "You slept between \(sleepTime) hours \(days) nights\nin a row. Keep it up!"
    }
    
    static func getWelcomeText(username: String) -> String {
        return "Hi \(username), let’s get your account\nset up"
    }
    
    
}
