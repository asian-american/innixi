//
//  QuestionViewController.swift
//  Innixi
//
//  Created by Rahul on 16/04/20.
//

import UIKit

class QuestionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var singleSelect = false
    var lastSelectedCell: Int?
    var optionsArray = [OptionModel]()
    /*
    // MARK: - Navigation
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setOptions(optionCollection: UICollectionView, options:[String], checkBox: Bool) {
        optionCollection.delegate = self
        optionCollection.dataSource = self
        
        self.optionsArray = Utils.getOptions(options: options, withCheckBox: checkBox)
    }

//    MARK: UICollectionViewProtocol Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        optionsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MultiOptionCell", for: indexPath) as! MultiOptionCollectionViewCell
        cell.setOption(optionsArray[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MultiOptionCollectionViewCell
        
        cell.onClick()
        //Reload rest
        if singleSelect {
            if lastSelectedCell != nil {
                collectionView.reloadItems(at: [IndexPath(index: lastSelectedCell!)])
                // Update last selected
                lastSelectedCell = indexPath.row
            }
        }
        
    }
    
}

class Q1Controller: QuestionViewController {
    
    @IBOutlet weak var question: UILabel!
       
    @IBOutlet weak var desc: UILabel!
       
    @IBOutlet weak var optionCollection: UICollectionView!
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.question.text = "What brings you here today?"
        self.desc.text = ""
        let options: [String] = ["I want to understand my stress",
                                       "I have trouble managing stress",
                                       "I have trouble falling asleep"]
        setOptions(optionCollection: optionCollection, options: options, checkBox: true)
        
    }
}

class Q2Controller: QuestionViewController {
    
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var desc: UILabel!
    
    @IBOutlet weak var optionCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.question.text = "Are any of these areas challenging for you?"
        self.desc.text = "Select the areas that influence your mood the most"
        let options: [String] = ["Managing stress",
                                       "Relationships",
                                       "Sleep","Work","Physical Excercise", "Finding Balance"]
        setOptions(optionCollection: optionCollection, options: options, checkBox: true)
        
    }
    
}

class ChoosePlanController: QuestionViewController {
    
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var desc: UILabel!
    
    @IBOutlet weak var optionCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.singleSelect = true
        self.question.text = "Choose your plan"
        self.desc.text = "Track your progress over 1-4 weeks. We tailor Innixi to your plan and send daily reminders."
        let options: [String] = ["Two Weeks\nWe recommend this to get deeper insights",
                                       "Three weeks",
                                       "One month","One Week"]
        setOptions(optionCollection: optionCollection, options: options, checkBox: true)
    }
    
    




}

