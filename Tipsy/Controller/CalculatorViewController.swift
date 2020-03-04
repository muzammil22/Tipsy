//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalresult = ""
    

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        twentyPctButton.isSelected = false
        tenPctButton.isSelected = false
        sender.isSelected = true;
        
        let percentageSelected = sender.currentTitle!
        let tipAmount = String(percentageSelected.dropLast())
        let tipNumber = Double(tipAmount)!
        
        tip = tipNumber / 100
        
         view.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%i", Int(sender.value))
        
        numberOfPeople = Int(sender.value)
        view.endEditing(true)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        
        print(billTextField.text ?? "")
        
        if bill != "" {
            billTotal = Double(bill)!
            
            let result = billTotal * (1+tip)/Double(numberOfPeople)
            
            finalresult = String(format: "%.2f", result)
            
            performSegue(withIdentifier: "goToResult", sender: CalculatorViewController())
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // Get the new view controller using segue.destination.
           // Pass the selected object to the new view controller.
        if segue.identifier == "goToResult" {
           let destinationVC = segue.destination as! ResultViewController
           destinationVC.finalResult = finalresult
//           destinationVC.advice = calculatorBrain.getAdvice()
//           destinationVC.color = calculatorBrain.getColor()
       }
    }
}

