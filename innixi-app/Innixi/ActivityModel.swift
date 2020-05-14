//
//  ActivityModel.swift
//  Innixi
//
//  Created by Rahul on 21/04/20.
//

import Foundation

class ActivityModel {
    
    var image: String!
    
    var name: String!
    
    var target: String!
    
    init(image: String, name: String, target: String) {
        self.image = image
        self.name = name
        self.target = target
    }
    
    static func getActivities() -> [ActivityModel] {
        var activities = [ActivityModel]()
        
        activities.append(ActivityModel(image: "calendar-2", name: "guided\nreflection", target: ""))
        activities.append(ActivityModel(image: "pen-2", name:"journal\nprompts", target: ""))
        activities.append(ActivityModel(image:"brain", name: "meditation", target: ""))
        
        return activities
    }
}
