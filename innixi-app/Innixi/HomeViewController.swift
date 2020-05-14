//
//  HomeViewController.swift
//  Innixi
//
//  Created by Rahul on 21/04/20.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var homePageLabel: UILabel!
    
    @IBOutlet weak var insightLabel: UILabel!
    
    //Value Labels
    @IBOutlet weak var checkInBar: UIProgressView!
    
    @IBOutlet weak var checkInLabel: UILabel!
    @IBOutlet weak var sleepBar: UIProgressView!
    
    @IBOutlet weak var sleepLabel: UILabel!
    @IBOutlet weak var exerciseBar: UIProgressView!
    
    @IBOutlet weak var exerciseLabel: UILabel!
    
    @IBOutlet weak var activityCollection: UICollectionView!
    
    @IBOutlet weak var firstTimeTracker: UIView!
    
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet weak var firstTimeLabel: UILabel!
    var activityData = [ActivityModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        activityCollection.delegate = self
        activityCollection.dataSource = self
        
        activityData = ActivityModel.getActivities()
        setDailySummary()
        
        if !Utils.isLogedIn() {
            stackView.isHidden = true
            firstTimeLabel.isHidden = false
            firstTimeTracker.isHidden = false
            firstTimeLabel.alpha = 1
            plantImage.image = UIImage(named: "plainplant")
            
        }else {
            firstTimeTracker.removeFromSuperview()
            firstTimeLabel.removeFromSuperview()
        }
        
        
    }
    
    func setDailySummary() {
        
        //Fetch First
        var currentDay = 3
        var mood = 2.0
        var sleepTime = 6.0
        var exerciseTime = 0.01
        
        
        homePageLabel.text = Utils.getUserName()
        insightLabel.text = Utils.getInsightText(sleepTime: Float(sleepTime), days: currentDay)
        checkInBar.progress = Float((mood/7))
        checkInLabel.text = "2/7 complete"
        sleepBar.progress = Float((sleepTime/8))
        sleepLabel.text = "6/8h last night"
        exerciseBar.progress = Float((exerciseTime/1))
        exerciseLabel.text = "0/30m per day"
        
    
        
        
    }
    
    func getHourInfo(time: Int?) -> String {
        if time == nil {
            return "n/a"
        }
        return "\(time!) hours"
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activityData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActivityCell", for: indexPath) as! ActivityCollectionViewCell
        cell.setActivity(activity: self.activityData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ActivityCollectionViewCell
        cell.onActivityClick()
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }


    
}
