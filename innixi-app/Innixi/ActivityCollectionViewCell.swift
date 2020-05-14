//
//  ActivityCollectionViewCell.swift
//  Innixi
//
//  Created by Rahul on 21/04/20.
//

import UIKit

class ActivityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var activityImage: UIImageView!
    
    @IBOutlet weak var activityLabel: UILabel!
    
    var target: String!
    
    func setActivity(activity: ActivityModel){
        activityImage.image = UIImage(named: activity.image)
        activityLabel.text = activity.name
        target = activity.target
    }
    
    func onActivityClick(){
//        Do click action here
    }
    
    

    
}
