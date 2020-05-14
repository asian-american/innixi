//
//  SingleReminderViewController.swift
//  Innixi
//
//  Created by Rahul on 11/05/20.
//

import UIKit

class SingleReminderViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var activateCheckin1: UISwitch!
    
    @IBOutlet weak var currentLabel: UILabel!

    
    let timeFormatter = DateFormatter()
    
    @IBOutlet weak var descLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        timeFormatter.timeStyle = DateFormatter.Style.short
        let currentTime = timeFormatter.string(from: datePicker.date)
        currentLabel.text = currentTime
        datePicker.isEnabled = false
        setupLabelTap1()

        
        // Do any additional setup after loading the view.
    }
    
    
    private func checkAndEnableTimePicker() {
        if(activateCheckin1.isOn){
            datePicker.isEnabled = true
            datePicker.isHidden = false
            descLabel.isHidden = true
        }else{
            datePicker.isEnabled = false
            descLabel.isHidden = false
            datePicker.isHidden = true
        }
    }
    
    @IBAction func switch1Changed(_ sender: Any) {
        checkAndEnableTimePicker()
    }

    
    @IBAction func timePickerChanged(_ sender: Any) {
        currentLabel.text = timeFormatter.string(from: datePicker.date)
    }
    
    
    
    @objc func labelTapped1(_ sender: UITapGestureRecognizer) {
        activateCheckin1.isOn = true
    }
    
    
    func setupLabelTap1() {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped1(_:)))
        currentLabel.isUserInteractionEnabled = true
        currentLabel.addGestureRecognizer(labelTap)
        
    }
    


}
