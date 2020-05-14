//
//  TrackingCollectionViewCell.swift
//  Innixi
//
//  Created by Rahul on 17/04/20.
//

import UIKit

class TrackingCollectionViewCell: UICollectionViewCell {
 
    var moodData: MoodModel?
    
    func setMood(moodData: MoodModel){
        if(self.moodData == nil){
            self.moodData = moodData
        }
    }
    
    
    func onClick(onSelectCompletion: (String) -> Void?, onDeselectCompletion: (String) -> Void?) {
        if moodData!.isSelected {
            onDeselect()
        }else {
            onSelect()
        }
    }
    
    func onSelect() {
        self.contentView.backgroundColor = UIColor.white
        moodData!.isSelected = true
        moodData!.maximizeLevel()
    }
    
    func onDeselect() {
        self.contentView.backgroundColor = UIColor.clear
        moodData!.isSelected = false
        moodData!.minimizeLevel()
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 10.0
    }
    
}

class BottleCollectionViewCell: TrackingCollectionViewCell {
    
    @IBOutlet weak var bottleImage_0: UIImageView!
    
    @IBOutlet weak var bottleImage_1: UIImageView!
    
    @IBOutlet weak var bottleImage_2: UIImageView!
    
    @IBOutlet weak var bottleImage_3: UIImageView!
    
    @IBOutlet weak var bottleImage_4: UIImageView!
    
    @IBOutlet weak var moodText: UILabel!
    

    override func setMood(moodData: MoodModel) {
        super.setMood(moodData: moodData)
        self.moodText.text = self.moodData!.moodText
        if self.moodData!.level > 0 {
            let end = getImageFromLevel(level: self.moodData!.level)
            UIView.transition(from: getImageFromLevel(level: self.moodData!.level-1), to: end, duration: 0, options: [.transitionCrossDissolve, .showHideTransitionViews], completion: nil)
        }
    }
    
    override func onClick(onSelectCompletion: (String) -> Void?, onDeselectCompletion: (String) -> Void?) {
        let start = getImageFromLevel(level: moodData!.level)
        moodData!.incrLevel()
        let end = getImageFromLevel(level: moodData!.level)
        UIView.transition(from: start, to: end, duration: 0, options: [.transitionCrossDissolve, .showHideTransitionViews], completion: nil)
        
        if moodData!.isZeroLevel() {
            onDeselectCompletion(moodData!.moodText)
        }
        if moodData!.isStartingLevel() {
            onSelectCompletion(moodData!.moodText)
        }
        
    }
    
    func getImageFromLevel(level: Int) -> UIImageView {
        switch level {
        case 0:
            return bottleImage_0
        case 1:
            return bottleImage_1
        case 2:
            return bottleImage_2
        case 3:
            return bottleImage_3
        case 4:
            return bottleImage_4
        default:
            return bottleImage_0
        }
    }
    
}

class MoodCollectionViewCell: TrackingCollectionViewCell {
    
    
    @IBOutlet weak var moodEmoji: UILabel!
    
    @IBOutlet weak var moodText: UILabel!
    
    override func setMood(moodData: MoodModel) {
        super.setMood(moodData: moodData)
        self.moodEmoji.text = self.moodData!.moodEmoji
        self.moodText.text = self.moodData!.moodText
    }
    
}

class ExerciseCollectionViewCell: TrackingCollectionViewCell {
    
    @IBOutlet weak var exerciseEmoji: UILabel!
    
    @IBOutlet weak var exerciseLabel: UILabel!
    
    
    override func setMood(moodData: MoodModel) {
        super.setMood(moodData: moodData)
        self.exerciseEmoji.text = self.moodData!.moodEmoji
        self.exerciseLabel.text = self.moodData!.moodText
    }
}

class ExerciseImageCollectionViewCell: TrackingCollectionViewCell {
    
    @IBOutlet weak var exerciseImage: UIImageView!
    
    @IBOutlet weak var exerciseLabel: UILabel!
    
    @IBOutlet weak var exerciseImageSelected: UIImageView!
    
    override func setMood(moodData: MoodModel) {
        super.setMood(moodData: moodData)
        self.exerciseImage.image = UIImage(named: "\(self.moodData!.moodImage)_white")
        self.exerciseImageSelected.image = UIImage(named: "\(self.moodData!.moodImage)_selected")
        self.exerciseLabel.text = self.moodData!.moodText
        if self.moodData!.isSelected {
            onSelect()
        } else {
            onDeselect()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
    }
    
    override func onSelect() {
        super.onSelect()
        exerciseLabel.textColor = Utils.INNIXI_PURPLE_TEXT
        UIView.transition(from: exerciseImage, to: exerciseImageSelected, duration: 0, options: [.transitionCrossDissolve, .showHideTransitionViews], completion: nil)
    }
    
    override func onDeselect() {
        super.onDeselect()
        exerciseLabel.textColor = UIColor.white
        UIView.transition(from: exerciseImageSelected, to: exerciseImage, duration: 0, options: [.transitionCrossDissolve, .showHideTransitionViews], completion: nil)
    }
}

class ReflectionCollectionViewCell: TrackingCollectionViewCell {
    
    @IBOutlet weak var exerciseEmoji: UILabel!
    
    @IBOutlet weak var exerciseLabel: UILabel!
    
    override func setMood(moodData: MoodModel) {
        super.setMood(moodData: moodData)
        self.exerciseEmoji.text = self.moodData!.moodEmoji
        self.exerciseLabel.text = self.moodData!.moodText
    }
    
}
