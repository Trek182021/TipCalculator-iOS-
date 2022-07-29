//
//  ViewController.swift
//  TipCalculator
//
//  Created by Trek on 7/24/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipChoice5: UIButton!
    @IBOutlet weak var tipChoice4: UIButton!
    @IBOutlet weak var tipChoice3: UIButton!
    @IBOutlet weak var tipChoice2: UIButton!
    @IBOutlet weak var tipChoice1: UIButton!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UITextField!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var splitSwitch: UISwitch!
    @IBOutlet weak var splitAmount: UILabel!
    @IBOutlet weak var splitAddAmount: UIButton!
    @IBOutlet weak var splitSubAmount: UIButton!
    @IBOutlet weak var totalText: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var darkMode: UISwitch!
    var tip:Double = 0
    var split:Int = 1
    
    // Set Default CornerRadius and Background Color for all Tip Buttons.
    override func viewDidLoad() {
        super.viewDidLoad()
        tipChoice1.layer.cornerRadius = 20
        tipChoice1.backgroundColor = UIColor.white
        tipChoice2.layer.cornerRadius = 20
        tipChoice2.backgroundColor = UIColor.white
        tipChoice3.layer.cornerRadius = 20
        tipChoice3.backgroundColor = UIColor.white
        tipChoice4.layer.cornerRadius = 20
        tipChoice4.backgroundColor = UIColor.white
        tipChoice5.layer.cornerRadius = 20
        tipChoice5.backgroundColor = UIColor.white
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: billAmountTextField.frame.height - 1, width: billAmountTextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        billAmountTextField.borderStyle = UITextField.BorderStyle.none
        billAmountTextField.layer.addSublayer(bottomLine)
        // Do any additional setup after loading the view.
    }
    
    // Change Tip Button's color when clicked.
    @IBAction func buttonClick(selectedButton: UIButton) {
        tipChoice1.layer.cornerRadius = 20
        tipChoice1.backgroundColor = UIColor.white
        tipChoice1.setTitleColor(UIColor(red: 0.00, green: 0.56, blue: 0.32, alpha: 1.00), for: .normal)
        tipChoice2.layer.cornerRadius = 20
        tipChoice2.backgroundColor = UIColor.white
        tipChoice3.layer.cornerRadius = 20
        tipChoice3.backgroundColor = UIColor.white
        tipChoice4.layer.cornerRadius = 20
        tipChoice4.backgroundColor = UIColor.white
        tipChoice5.layer.cornerRadius = 20
        tipChoice5.backgroundColor = UIColor.white
        selectedButton.layer.cornerRadius = 20
        selectedButton.backgroundColor = selectedButton.backgroundColor == UIColor.white ? UIColor.lightGray : UIColor.white
        selectedButton.setTitleColor(UIColor.white, for: .normal)
    }
    
    // Change Tip Amount accordingly as buttons are clicked.
    @IBAction func changeTip(sender: UIButton) {
        let bill = Double(billAmountTextField.text!) ?? 0
        
        switch sender {
        case tipChoice1:
            tip = bill * 0.10
        case tipChoice2:
            tip = bill * 0.15
        case tipChoice3:
            tip = bill * 0.20
        case tipChoice4:
            tip = bill * 0.30
        case tipChoice5:
            tipSlider.isHidden = !tipSlider.isHidden
        default:
            break
        }
        
        tipAmountLabel.text = String(format: "%.2f",tip)
        if (splitSwitch.isOn == true) {
            totalLabel.text = String(format: "$ %.2f", (bill+tip)/(Double(splitAmount.text!) ?? 0))
        } else {
            totalLabel.text = String(format:"$ %.2f", bill+tip) }
    }

    
    @IBAction func changeAmount(sender: UIButton) {
        split = Int(splitAmount.text!) ?? 0
        if (sender == splitSubAmount && split != 1 ) {split-=1}
        if (sender == splitAddAmount) {split+=1}
        splitAmount.text = String(split)
        changeTip(sender: sender)
    }
    
    //Make Split Function Visible
    @IBAction func splitEnable(sender: UISwitch) {
        if sender.isOn == false {
            let total = (Double(billAmountTextField.text!) ?? 0) + tip
            totalLabel.text = String(format:"$ %.2f", total)
            totalText.text = "Total"
        } else {
        totalText.text = "Total Per Person"
        }
        splitAmount.isHidden = !splitAmount.isHidden
        splitAddAmount.isHidden = !splitAddAmount.isHidden
        splitSubAmount.isHidden = !splitSubAmount.isHidden
    }
    @IBAction func changeMode(sender: UISwitch) {
        view.backgroundColor = UIColor(red: 0.93, green: 0.98, blue: 0.96, alpha: 1.00)
        titleLabel.textColor = UIColor.black
        totalText.textColor = UIColor.black
        if sender.isOn == true{
            view.backgroundColor = UIColor.black
            titleLabel.textColor = UIColor.white
            totalText.textColor = UIColor.white
        }
    }
    
    @IBAction func tipSlider(sender: UISlider) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tip2 = Int(sender.value)
        tipAmountLabel.text = String(tip2)
        totalLabel.text = String(format:"$ %.2f", ((bill+Double(tip2))/Double(split)))
    }
    
    //Hamburger Menu Feature
    
     
}

