//
//  TrackingPageModel.swift
//  Innixi
//
//  Created by Rahul on 17/04/20.
//

import Foundation
enum TrackingPageType: String {
    case MOOD = "BottleCell"
    case EXERCISE = "ExerciseCellImage"
    case REFLECTION = "ReflectionCell"
}

class TrackingPageModel {
    
    var question = ""
    
    var moodCollection = [MoodModel]()
    
    var otherText = ""
    
    var pageType: TrackingPageType!
    
    var moodPageName = ""
    
    init(question: String, moodCollection: [MoodModel], pageType: TrackingPageType, otherText: String) {
        self.question = question
        self.moodCollection = moodCollection
        self.pageType = pageType
        self.otherText = otherText
    }
    
    func setMoodPageName(moodPageName: String) {
        self.moodPageName = moodPageName
    }
    
}
