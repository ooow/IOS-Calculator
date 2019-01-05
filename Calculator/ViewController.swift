//
//  ViewController.swift
//  Calculator
//
//  Created by Goga Tirkiya on 04/01/2019.
//  Copyright © 2019 Goga Tirkiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var actualNumber: Double = 0;
    var storedNumber: Double = 0;
    var operationType: Int = 0;
    var isAddedComa: Bool = false;
    var isPressedOpration: Bool = false;
    @IBOutlet weak var result: UILabel!;
    
    @IBAction func digits(_ sender: UIButton) {
        if isPressedOpration == true {
            result.text = String(sender.tag);
            isPressedOpration = false;
        } else {
            if (result.text!.count == 1 && result.text!.last == "0"){
                result.text = "";
            }
            result.text! += String(sender.tag);
        }
        actualNumber = getCurrentValue();
    }
    
    // Calculate.
    @IBAction func handleEquals(_ sender: UIButton) {
        calculate(operation: operationType);
    }
    
    // Division.
    @IBAction func handleDivision(_ sender: UIButton) {
        processOperation(operation: "/", tag: sender.tag);
    }
    
    // Multiplication.
    @IBAction func handleMultiplication(_ sender: UIButton) {
        processOperation(operation: "x", tag: sender.tag);
    }
    
    // Subtraction.
    @IBAction func handleSubtraction(_ sender: UIButton) {
        processOperation(operation: "-", tag: sender.tag);
    }
    
    // Summation.
    @IBAction func handleSummation(_ sender: UIButton) {
        processOperation(operation: "+", tag: sender.tag);
    }
    
    // Coma.
    @IBAction func handleComa(_ sender: UIButton){
        if !isPressedOpration && !isAddedComa && result.text!.count > 0 {
            result.text! += ",";
            isAddedComa = true;
        }
    }
    
    // Clean.
    @IBAction func handleAC(_ sender: UIButton) {
        clean();
    }

    
    func processOperation(operation: String, tag: Int){
        if !isPressedOpration && result.text!.last != "," {
            storedNumber = getCurrentValue();
            result.text = operation;
            operationType = tag;
            isAddedComa = false;
            isPressedOpration = true;
        } else {
            calculate(operation: tag);
        }
    }
    
    func getCurrentValue() -> Double {
        return Double(result.text!.replacingOccurrences(of: ",", with: "."))!;
    }
    
    func setResult(result: Double){
        if result.truncatingRemainder(dividingBy: 1.0) != 0 {
            self.result.text = String(format: "%.2f", result).replacingOccurrences(of: ".", with: ",");
        } else {
            self.result.text = String(Int(result));
        }
    }
    
    func calculate(operation: Int){
        switch operation {
        case 11: // Division
            setResult(result: storedNumber / actualNumber);
        case 12: // Multiplication
            setResult(result: storedNumber * actualNumber);
        case 13: // Subtraction
            setResult(result: storedNumber - actualNumber);
        case 14: // Summation
            setResult(result: storedNumber + actualNumber);
        default:
            break;
        }
        isPressedOpration = false;
    }
    
    func clean(){
        result.text = "0";
        storedNumber = 0;
        actualNumber = 0;
        operationType = 0;
        isAddedComa = false;
        isPressedOpration = false;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        result.text = "0";
    }
}
