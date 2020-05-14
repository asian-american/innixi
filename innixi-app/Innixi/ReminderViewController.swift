//
//  ReminderControllerViewController.swift
//  Innixi
//
//  Created by Rahul on 16/04/20.
//

import UIKit

class ReminderViewController: UIViewController {
    
    @IBOutlet weak var checkInLabel1: UILabel!
    
    @IBOutlet weak var checkInLabel2: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var activateCheckin1: UISwitch!
    
    @IBOutlet weak var activateCheckIn2: UISwitch!
    
    var currentLabel: UILabel!
    
    var otherLabel: UILabel!
    
    let timeFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeFormatter.timeStyle = DateFormatter.Style.short
        let currentTime = timeFormatter.string(from: datePicker.date)
        checkInLabel1.text = currentTime
        checkInLabel2.text = currentTime
        datePicker.isEnabled = false
        setupLabelTap1()
        setupLabelTap2()
        
        // Do any additional setup after loading the view.
    }
    
    
    private func checkAndEnableTimePicker() {
        if(activateCheckin1.isOn || activateCheckIn2.isOn){
            datePicker.isEnabled = true
        }else{
            datePicker.isEnabled = false
        }
    }
    
    @IBAction func switch1Changed(_ sender: Any) {
        checkAndEnableTimePicker()
        if activateCheckin1.isOn {
            selectLabel(label: checkInLabel1)
            deselectLabel(label: checkInLabel2)
        }else{
            deselectLabel(label: checkInLabel1)
        }

    }
    
    @IBAction func switch2Changed(_ sender: Any) {
        checkAndEnableTimePicker()
        if activateCheckIn2.isOn {
            selectLabel(label: checkInLabel2)
            deselectLabel(label: checkInLabel1)
        } else{
            deselectLabel(label: checkInLabel2)
        }
    }
    
    @IBAction func timePickerChanged(_ sender: Any) {
        if activateCheckin1.isOn && currentLabel == checkInLabel1 {
            selectLabel(label: checkInLabel1)
        }
        
        if activateCheckIn2.isOn && currentLabel == checkInLabel2 {
            selectLabel(label: checkInLabel2)
        }
    }
    
    
    
    func selectLabel(label: UILabel) {
        currentLabel = label
        label.backgroundColor = Utils.INNIXI_PURPLE
        label.text = timeFormatter.string(from: datePicker.date)
    }
    
    func deselectLabel(label: UILabel) {
        otherLabel = label
        label.backgroundColor = UIColor.black
    }
    
    @objc func labelTapped1(_ sender: UITapGestureRecognizer) {
        activateCheckin1.isOn = true
        selectLabel(label: checkInLabel1)
        deselectLabel(label: checkInLabel2)
    }
    
    @objc func labelTapped2(_ sender: UITapGestureRecognizer) {
        activateCheckIn2.isOn = true
        selectLabel(label: checkInLabel2)
        deselectLabel(label: checkInLabel1)
    }
    
    func setupLabelTap1() {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped1(_:)))
        checkInLabel1.isUserInteractionEnabled = true
        checkInLabel1.addGestureRecognizer(labelTap)
        
    }
    
    func setupLabelTap2() {
           let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped2(_:)))
           checkInLabel2.isUserInteractionEnabled = true
           checkInLabel2.addGestureRecognizer(labelTap)
           
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
