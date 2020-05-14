//
//  MoodTrackingPages..swift
//  Innixi
//
//  Created by Rahul on 17/04/20.
//

import Foundation

class MoodTrackingPages {
    
    static var moodEmojis = ["😀","😇", "🤩", "😅", "😱", "😰", "😣", "😡", "😕"]
    
    static var moodLabels = ["Excited", "Happy", "Grateful", "Calm", "Reflective", "Tired", "Stressed", "Angry", "Lonely", "Sad", "Uncertain"]
    
    static var exerciseEmojis = ["💼", "🍻","💪🏻", "📖","🛀🏻", "🧺","🎨","🐕"]
    
    static var exerciseImages = ["pandemic", "work", "home", "friendship", "relationship", "exercise", "hobby", "education"]
    
    static var exerciseLabels = ["The global pandemic", "Work", "Family", "Friends",  "Relationships", "Physical fitness", "Hobbies", "School"]
    
    static var reflectionString = "Reflecting on changes to your mood can help reveal patterns..."
    
    static var page1: TrackingPageModel!
    static var page2: TrackingPageModel!
    static var page3: TrackingPageModel!
    
    static func createTrackingPages() {
        
        page1 = TrackingPageModel(question: "How are you feeling today?", moodCollection: getMoodCollection(emojis: moodEmojis, labels: moodLabels, images: nil), pageType: .MOOD, otherText: "")
        
        page2 = TrackingPageModel(question: "What have you been up to?", moodCollection: getMoodCollection(emojis: exerciseEmojis, labels: exerciseLabels, images: exerciseImages), pageType: .EXERCISE, otherText: "")
        
        page3 = TrackingPageModel(question: "How are these activities affecting your mood?", moodCollection: [MoodModel(moodEmoji: exerciseEmojis[0], moodText: exerciseLabels[0], moodImage: exerciseImages[0]), MoodModel(moodEmoji: exerciseEmojis[1], moodText: exerciseLabels[1], moodImage: exerciseImages[0])], pageType: .REFLECTION, otherText: "")
        
        
    }
    
    static func createTRackingPageFor(mood: String) -> TrackingPageModel {
        let page = TrackingPageModel(question: "Are any of these things making you feel \(mood)?", moodCollection: getMoodCollection(emojis: exerciseEmojis, labels: exerciseLabels, images: exerciseImages), pageType: .EXERCISE, otherText: "")
        page.setMoodPageName(moodPageName: mood)
        return page
    }
    
    static func getTrackingPages() -> [TrackingPageModel]{
        return [page1] // , page2, page3
    }
    
    static func getMoodCollection(emojis: [String], labels: [String], images: [String]?) -> [MoodModel] {
        var moodCollection = [MoodModel]()
        for i in 0...emojis.count-1 {
            moodCollection.append(MoodModel(moodEmoji: emojis[i], moodText: labels[i], moodImage: images?[i] ?? ""))
        }
        return moodCollection
    }
}
