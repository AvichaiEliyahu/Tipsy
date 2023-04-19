//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Avichai Eliyahu on 04/04/2023.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var totalLable: UILabel!
    @IBOutlet weak var settingsLable: UILabel!
    
    var result:Double = 0.0
    var numberOfPeople:Int = 0
    var tip:Double = 0.0
    
    override func viewDidLoad() {
        totalLable.text = String(format: "%.2f", result)
        let text = "Split between \(String(numberOfPeople)), with \(Int(tip*100))% tip"
        settingsLable.text = text
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
