//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLable: UILabel!
    
    var tip:Double = 0.1
    var numberOfPeople:Int = 0
    var totalBill:Double = 0.0
    
    var tipForEach:Double = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        billTextField.endEditing(true)
        
        let tipText = String((sender.currentTitle!).dropLast())
        tip = Double(tipText)!/100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        numberOfPeople = Int(sender.value)
        splitNumberLable.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if let realBill = billTextField.text {
            totalBill = Double(realBill)!
            tipForEach = (totalBill * (1+tip)) / Double(numberOfPeople)
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.numberOfPeople = numberOfPeople
            destinationVC.result = tipForEach
            destinationVC.tip = tip
            
        }
    }
    
    
}

