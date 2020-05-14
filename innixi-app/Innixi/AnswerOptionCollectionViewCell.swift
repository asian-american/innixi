//
//  AnswerOptionCollectionViewCell.swift
//  Innixi
//
//  Created by Rahul on 01/05/20.
//

import UIKit

class AnswerOptionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var option: UILabel!
    
    var optionData = OptionModel()

    func setAnswer(answerData: OptionModel) {
        self.optionData = answerData
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
        option.backgroundColor = UIColor.white
        option.textColor = Utils.INNIXI_PURPLE_TEXT
    }


    func deselect(){
        optionData.isSelected = false
        option.backgroundColor = UIColor.clear
        option.textColor = UIColor.white

    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 10.0
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
    }
    
}
