//
//  FirstTimeTrackingCompleteControiller.swift
//  Innixi
//
//  Created by Rahul on 11/05/20.
//

import UIKit

class FirstTimeTrackingCompleteControiller: UIViewController {

    @IBOutlet weak var welcomeText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeText.text = "Nice job, \(Utils.getUserName())!"
        // Do any additional setup after loading the view.
    }

}
