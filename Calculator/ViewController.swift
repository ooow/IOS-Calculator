//
//  ViewController.swift
//  Calculator
//
//  Created by Goga Tirkiya on 04/01/2019.
//  Copyright © 2019 Goga Tirkiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberFromScreen: Double = 0;
    @IBOutlet weak var result: UILabel!
    
    @IBAction func digits(_ sender: UIButton) {
        result.text = result.text! + String(sender.tag)
        numberFromScreen = Double(result.text!)!
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if result.text != "" {
            switch sender.tag {
            case 10: // Clean
                print("Clean")
            case 11: // Division
                print("Division")
            case 12: // Multiplication
                print("Multiplication")
            case 13: // Subtraction
                print("Subtraction")
            case 14: // Summation
                print("Summation")
            default:
                print()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

