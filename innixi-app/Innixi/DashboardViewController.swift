//
//  DashboardViewController.swift
//  Innixi
//
//  Created by Rahul on 21/04/20.
//

import UIKit

class DashboardViewController: UIViewController {

    
    @IBOutlet weak var anxiousBar: UIProgressView!
    
    @IBOutlet weak var gratefulBar: UIProgressView!
    
    @IBOutlet weak var happyBar: UIProgressView!
    
    @IBOutlet weak var anxiousLabel: UILabel!
    
    @IBOutlet weak var gratefulLabel: UILabel!
    
    @IBOutlet weak var happyLabel: UILabel!
    
    
    @IBOutlet weak var anxiousPoints: UILabel!
    
    @IBOutlet weak var enjoyPoints: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let anxiousLevel = Float(0.75)
        let gratefulLevel = Float(0.6)
        let happyLevel = Float(0.5)
        
        anxiousBar.progress = anxiousLevel
        gratefulBar.progress = gratefulLevel
        happyBar.progress = happyLevel
        
        anxiousLabel.text = getBarText(level: anxiousLevel, name: "anxious")
        gratefulLabel.text = getBarText(level: gratefulLevel, name: "grateful")
        happyLabel.text = getBarText(level: happyLevel, name: "happy")
        
        addBulletPoints(label: anxiousPoints, points: ["The Global Pandemic", "Relationships", "Work"])
        addBulletPoints(label: enjoyPoints, points: ["Physical Exercise", "Spending time with family", "Spending time on hobbies"])
    }
    
    func getBarText(level: Float, name: String) -> String {
        return "\(Int(level*100))% \(name)"
    }
    

    @objc func addBulletPoints(label: UILabel, points: [String]) {

        let bullet = "•  "
        var strings = points.map { return bullet + $0 }
        
        var attributes = [NSAttributedStringKey: Any]()
        attributes[.font] = UIFont.preferredFont(forTextStyle: .body)
        attributes[.foregroundColor] = UIColor.black
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.headIndent = (bullet as NSString).size(withAttributes: attributes).width
        attributes[.paragraphStyle] = paragraphStyle
        

        let string = strings.joined(separator: "\n")
        label.attributedText = NSAttributedString(string: string, attributes: attributes)
    }
   
}
