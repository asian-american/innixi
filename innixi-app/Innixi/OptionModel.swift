//
//  OptionModel.swift
//  Innixi
//
//  Created by Rahul on 16/04/20.
//

import Foundation

class OptionModel {
    
    var optionText = ""
    var isSelected = false
    var hasCheckBox = false
    
    init() {
        
    }
    
    init(optionText: String) {
        self.optionText = optionText
    }
    
    init(optionText: String, hasCheckBox:Bool) {
        self.optionText = optionText
        self.hasCheckBox = hasCheckBox
    }
    
}

