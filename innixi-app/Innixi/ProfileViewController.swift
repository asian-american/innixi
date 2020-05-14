//
//  ProfileViewController.swift
//  Innixi
//
//  Created by Rahul on 21/04/20.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var welcomeUserLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let username = "Rahul"
        welcomeUserLabel.text = "Welcome \(username)!"
        
        
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
