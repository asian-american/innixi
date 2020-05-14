//
//  TrackingContentViewController.swift
//  Innixi
//
//  Created by Rahul on 17/04/20.
//

import UIKit

class TrackingContentViewController: UIViewController,  UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    var pageIndex: Int?
    
    var pageData: TrackingPageModel?
    
    var trackingView: TrackingViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setTrackingContent(pageIdx: Int, trackingPage: TrackingPageModel, trackingView: TrackingViewController) {
        if self.pageData == nil {
            self.pageIndex = pageIdx
            self.pageData = trackingPage
            self.trackingView = trackingView
        }
    }

    
    func setUpDelegate(moodCollection: UICollectionView) {
        moodCollection.delegate = self
        moodCollection.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageData!.moodCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellType: String =  getCellBottle(pageType: self.pageData!.pageType, idx: indexPath.row)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType, for: indexPath) as! TrackingCollectionViewCell
        cell.setMood(moodData: self.pageData!.moodCollection[indexPath.row])
        
        return cell
    }
    
    func getCellBottle(pageType: TrackingPageType, idx: Int) -> String {
        let cellName = pageType.rawValue
        if pageType == .MOOD {
            if idx%2 == 0 {
                return "\(cellName)Green"
            }
            return "\(cellName)Red"
        }
        return cellName
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! TrackingCollectionViewCell
        
        cell.onClick(onSelectCompletion: trackingView!.addTrackingPageForMood, onDeselectCompletion: trackingView!.removeTrackingPageForMood)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class MoodTrackingContentController : TrackingContentViewController {

    
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var moodCollection: UICollectionView!
    
    @IBOutlet weak var otherText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.question.text = self.pageData!.question
        self.setUpDelegate(moodCollection: moodCollection)
    }
    
    
}

class ExerciseTrackingContentController : TrackingContentViewController {
    
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var moodCollection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.question.text = self.pageData!.question
        self.setUpDelegate(moodCollection: moodCollection)
    }
}

class ReflectionTrackingContentController : TrackingContentViewController {
    
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var moodCollection: UICollectionView!
    
    @IBOutlet weak var otherText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.question.text = self.pageData!.question
        self.setUpDelegate(moodCollection: moodCollection)
    }
}
