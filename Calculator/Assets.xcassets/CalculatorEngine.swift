//
// Created by Goga Tirkiya on 2019-01-10.
// Copyright (c) 2019 Goga Tirkiya. All rights reserved.
//

import UIKit

class CalculatorEngine {

  // Reads double number from provided label.
  func getValue(from: UILabel) -> Double {
    return Double(from.text!.replacingOccurrences(of: ",", with: "."))!
  }

  // Sets provided result to the label.
  func setResult(result: Double, to: UILabel) {
    if result.truncatingRemainder(dividingBy: 1.0) != 0 {
      to.text = String(format: "%.2f", result).replacingOccurrences(of: ".", with: ",")
    } else {
      to.text = String(Int(result))
    }
  }

  // Calculates arithmetic operations.
  func calculate(operation: String, first: Double, second: Double, label: UILabel) {
    switch operation {
    case "÷": // Division.
      setResult(result: first / second, to: label)
    case "x": // Multiplication.
      setResult(result: first * second, to: label)
    case "-": // Subtraction.
      setResult(result: first - second, to: label)
    case "+": // Summation.
      setResult(result: first + second, to: label)
    case "x²": // Sqr.
      setResult(result: first * first, to: label)
    case "√": // Sqrt.
      setResult(result: first.squareRoot(), to: label)
    default:
      break
    }
  }
}
