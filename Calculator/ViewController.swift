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
    var isPressedOpration: Bool = false;
    @IBOutlet weak var result: UILabel!;
    
    @IBAction func digits(_ sender: UIButton) {
        if isPressedOpration == true {
            result.text = String(sender.tag);
            isPressedOpration = false;
        } else {
            result.text = result.text! + String(sender.tag);
        }
        actualNumber = Double(result.text!)!;
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if result.text != "" {
            switch sender.tag {
            case 10: // Clean
                clean();
            case 11: // Division
                pressOperation(operation: "/", tag: sender.tag);
            case 12: // Multiplication
                pressOperation(operation: "*", tag: sender.tag);
            case 13: // Subtraction
                pressOperation(operation: "-", tag: sender.tag);
            case 14: // Summation
                pressOperation(operation: "+", tag: sender.tag);
            case 15: // Equal
                calculate(operation: operationType);
            default:
                break;
            }
        }
    }
    
    func pressOperation(operation: String, tag: Int){
        storedNumber = Double(result.text!)!;
        result.text = operation;
        operationType = tag;
        isPressedOpration = true;
    }
    
    func calculate(operation: Int){
        switch operation {
        case 11: // Division
            result.text = String(storedNumber / actualNumber)
        case 12: // Multiplication
            result.text = String(storedNumber * actualNumber)
        case 13: // Subtraction
            result.text = String(storedNumber - actualNumber)
        case 14: // Summation
            result.text = String(storedNumber + actualNumber)
        default:
            break;
        }
        isPressedOpration = true;
    }
    
    func clean(){
        result.text = "";
        storedNumber = 0;
        actualNumber = 0;
        operationType = 0;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}
