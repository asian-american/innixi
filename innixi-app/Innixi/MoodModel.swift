//
//  MoodModel.swift
//  Innixi
//
//  Created by Rahul on 17/04/20.
//

import Foundation
class MoodModel {
    
    var moodEmoji = ""
    
    var moodText = ""
    
    var isSelected = false
    
    var level = 0
    
    var moodImage = ""
    
    init(moodEmoji: String, moodText: String, moodImage: String){
        self.moodText = moodText
        self.moodEmoji = moodEmoji
        self.moodImage = moodImage
    }
    
    func maximizeLevel() {
        self.level = 4
    }
    
    func minimizeLevel() {
        self.level = 0
    }
    
    func isZeroLevel() -> Bool {
        return self.level == 0
    }
    
    func isStartingLevel() -> Bool {
        return self.level == 1
    }
    
    func incrLevel() {
        self.level = (self.level + 1) % 5
    }
}
