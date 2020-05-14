//
//  MultiOptionCollectionViewCell.swift
//  Innixi
//
//  Created by Rahul on 16/04/20.
//

import UIKit

class MultiOptionCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var uncheckBox: UIImageView!
    
    @IBOutlet weak var checkBox: UIImageView!
    
    @IBOutlet weak var option: UILabel!
    
    var optionData = OptionModel()
    
    func setOption(_ option: OptionModel) {
        self.optionData = option
        self.option.text = optionData.optionText
        
    }
    
    func onClick() {
        if optionData.isSelected {
            deselect()
        }else {
            select()
        }
    }
    
    // Call make changes in stored variable
    func select(){
        optionData.isSelected = true
        if #available(iOS 11.0, *) {
            option.backgroundColor = UIColor(named: "Innixi Purple")
            option.textColor = UIColor(named: "Innixi Beige")
        } else {
            // Fallback on earlier versions
            option.backgroundColor = UIColor(displayP3Red: 0.346, green: 0.341, blue: 1.000, alpha: 100)
            option.textColor = UIColor(displayP3Red: 0.997, green: 0.970, blue: 0.922, alpha: 100)
            
        }
        UIView.transition(from: uncheckBox, to: checkBox, duration: 0, options: [.transitionCrossDissolve, .showHideTransitionViews], completion: nil)
    }
    
    
    func deselect(){
        optionData.isSelected = false
        option.backgroundColor = UIColor.white
        option.textColor = UIColor.black
        UIView.transition(from: checkBox, to: uncheckBox, duration: 0, options: [.transitionCrossDissolve, .showHideTransitionViews], completion: nil)
    }
    
}
