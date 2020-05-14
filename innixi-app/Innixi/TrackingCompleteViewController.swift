//
//  TrackingCompleteViewController.swift
//  Innixi
//
//  Created by Rahul on 18/04/20.
//

import UIKit

class TrackingCompleteViewController: UIViewController {

//    @IBOutlet weak var completeCheckinText: UILabel!
//    
//    @IBOutlet weak var pendingCheckinText: UILabel!
//
    var moved = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moved = false
        Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(timeToMoveOn), userInfo: nil, repeats: false)
        let tap = UITapGestureRecognizer(target: self, action: #selector(timeToMoveOn))
        self.view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
//        completeCheckinText.text = Utils.completeCheckinText(checkInNo: 5)
//        pendingCheckinText.text = Utils.pendingCheckinText(completeCheckins: 7)
    }
    
    @objc func timeToMoveOn() {
        if !moved {
            if !Utils.isLogedIn() {
                self.performSegue(withIdentifier: "goToTrackingEndFirstTime", sender: self)
            }else {
                self.performSegue(withIdentifier: "goToTrackingEnd", sender: self)
            }
            moved = true
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ToDashboardSegue" {
//            var homeController = segue.destination as! HomeTabViewController
//            // For Dashboard tab
//            homeController.selectedTab = 1
//        }
//    }
    
}
