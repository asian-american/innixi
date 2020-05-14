//
//  HomeTabViewController.swift
//  Innixi
//
//  Created by Rahul on 21/04/20.
//

import UIKit

class HomeTabViewController: UITabBarController {

    // For home page tab
    var selectedTab = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.selectedIndex = selectedTab
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}
