//
//  ViewController.swift
//  Calculator
//
//  Created by Goga Tirkiya on 04/01/2019.
//  Copyright © 2019 Goga Tirkiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var btn0: UIButton!
  var btn1: UIButton!
  var btn2: UIButton!
  var btn3: UIButton!
  var btn4: UIButton!
  var btn5: UIButton!
  var btn6: UIButton!
  var btn7: UIButton!
  var btn8: UIButton!
  var btn9: UIButton!
  var btnClean: UIButton!
  var btnComa: UIButton!
  var btnDivision: UIButton!
  var btnEqual: UIButton!
  var btnMultiplication: UIButton!
  var btnSqr: UIButton!
  var btnSqrt: UIButton!
  var btnSubtraction: UIButton!
  var btnSummation: UIButton!
  var result: UILabel!

  var actualNumber: Double = 0;
  var storedNumber: Double = 0;
  var operationType: String?;
  var isAddedComa: Bool = false;
  var isPressedOperation: Bool = false;

  override func viewDidLoad() {
    super.viewDidLoad()

    initButtons()
    arrangeButtons()
    initResultLabel()
  }

  // Handles all clicking on the numbers.
  @objc func digits(_ sender: UIButton) {
    if isPressedOperation == true {
      result.text = sender.currentTitle!
      isPressedOperation = false
    } else {
      if (result.text!.count == 1 && result.text!.last == "0") {
        result.text = ""
      }
      result.text! += sender.currentTitle!
    }
    actualNumber = getCurrentValue()
  }

  // Calculate.
  @objc func handleEquals(_ sender: UIButton) {
    calculate(operation: operationType!)
  }

  // Division.
  @objc func handleDivision(_ sender: UIButton) {
    processOperation(operation: sender.currentTitle!)
  }

  // Multiplication.
  @objc func handleMultiplication(_ sender: UIButton) {
    processOperation(operation: sender.currentTitle!)
  }

  // Subtraction.
  @objc func handleSubtraction(_ sender: UIButton) {
    processOperation(operation: sender.currentTitle!)
  }

  // Summation.
  @objc func handleSummation(_ sender: UIButton) {
    processOperation(operation: sender.currentTitle!)
  }

  // Sqr.
  @objc func handleSqr(_ sender: UIButton) {
    if isReadyToCalculate() {
      storedNumber = getCurrentValue()
      calculate(operation: sender.currentTitle!)
    }
  }

  // Sqrt.
  @objc func handleSqrt(_ sender: UIButton) {
    if isReadyToCalculate() {
      storedNumber = getCurrentValue()
      calculate(operation: sender.currentTitle!)
    }
  }

  // Coma.
  @objc func handleComa(_ sender: UIButton) {
    if isReadyToCalculate() {
      result.text! += ","
      isAddedComa = true
    }
  }

  // Clean.
  @objc func handleAC(_ sender: UIButton) {
    clean()
  }

  // Processes common operations.
  func processOperation(operation: String) {
    if !isPressedOperation && result.text!.last != "," {
      storedNumber = getCurrentValue()
      result.text = operation
      operationType = operation
      isAddedComa = false
      isPressedOperation = true
    } else {
      calculate(operation: operationType!)
    }
  }

  // Returns current number value from the screen.
  func getCurrentValue() -> Double {
    return Double(result.text!.replacingOccurrences(of: ",", with: "."))!
  }

  // Shows on the screen calculation result.
  func setResult(result: Double) {
    if result.truncatingRemainder(dividingBy: 1.0) != 0 {
      self.result.text = String(format: "%.2f", result).replacingOccurrences(of: ".", with: ",")
    } else {
      self.result.text = String(Int(result))
    }
  }

  // Calculates all operations.
  func calculate(operation: String) {
    switch operation {
    case "÷": // Division.
      setResult(result: storedNumber / actualNumber)
    case "x": // Multiplication.
      setResult(result: storedNumber * actualNumber)
    case "-": // Subtraction.
      setResult(result: storedNumber - actualNumber)
    case "+": // Summation.
      setResult(result: storedNumber + actualNumber)
    case "x²": // Sqr.
      setResult(result: storedNumber * storedNumber)
    case "√": // Sqrt.
      setResult(result: storedNumber.squareRoot())
    default:
      break
    }
    isPressedOperation = false
  }

  // Resets everything to initial state.
  func clean() {
    result.text = "0"
    storedNumber = 0
    actualNumber = 0
    operationType = nil
    isAddedComa = false
    isPressedOperation = false
  }

  // Determines whether state is ready to calculate.
  func isReadyToCalculate() -> Bool {
    return !isPressedOperation && !isAddedComa && result.text!.count > 0
  }

  /* Section related to configuring the view. */
  private func initResultLabel() {
    result = UILabel()
    result.font = UIFont(name: "Apple SD Gothic Neo", size: 50.0)
    result.text = "0"
    result.textAlignment = .right
    result.textColor = .white
    view.addSubview(result)

    result.translatesAutoresizingMaskIntoConstraints = false
    result.widthAnchor.constraint(equalToConstant: width - 20).isActive = true
    setPosition(element: result, position: .center, relatedTo: view)
    setPosition(element: result, position: .top, relatedTo: btnClean,
        constant: -100.0)
  }

  private func initButtons() {
    btn0 = Button(title: "0", width: floor(btnWidth * 2) + 1).get()
    btn1 = Button(title: "1").get()
    btn2 = Button(title: "2").get()
    btn3 = Button(title: "3").get()
    btn4 = Button(title: "4").get()
    btn5 = Button(title: "5").get()
    btn6 = Button(title: "6").get()
    btn7 = Button(title: "7").get()
    btn8 = Button(title: "8").get()
    btn9 = Button(title: "9").get()
    btnClean = Button(title: "AC", color: gray).get()
    btnComa = Button(title: ",").get()
    btnDivision = Button(title: "÷", color: blue, titleColor: .white).get()
    btnEqual = Button(title: "=", color: blue, titleColor: .white).get()
    btnSqr = Button(title: "x²", color: blue, titleColor: .white).get()
    btnSqrt = Button(title: "√", color: blue, titleColor: .white).get()
    btnSubtraction = Button(title: "-", color: blue, titleColor: .white).get()
    btnSummation = Button(title: "+", color: blue, titleColor: .white).get()
    btnMultiplication = Button(title: "x", color: blue, titleColor: .white)
        .get()

    btn0.addTarget(self, action: #selector(digits), for: .touchUpInside)
    btn1.addTarget(self, action: #selector(digits), for: .touchUpInside)
    btn2.addTarget(self, action: #selector(digits), for: .touchUpInside)
    btn3.addTarget(self, action: #selector(digits), for: .touchUpInside)
    btn4.addTarget(self, action: #selector(digits), for: .touchUpInside)
    btn5.addTarget(self, action: #selector(digits), for: .touchUpInside)
    btn6.addTarget(self, action: #selector(digits), for: .touchUpInside)
    btn7.addTarget(self, action: #selector(digits), for: .touchUpInside)
    btn8.addTarget(self, action: #selector(digits), for: .touchUpInside)
    btn9.addTarget(self, action: #selector(digits), for: .touchUpInside)

    btnClean.addTarget(self, action: #selector(handleAC), for: .touchUpInside)
    btnComa.addTarget(self, action: #selector(handleComa), for: .touchUpInside)
    btnSqr.addTarget(self, action: #selector(handleSqr), for: .touchUpInside)
    btnSqrt.addTarget(self, action: #selector(handleSqrt), for: .touchUpInside)
    btnEqual.addTarget(self, action: #selector(handleEquals),
        for: .touchUpInside)
    btnDivision.addTarget(self, action: #selector(handleDivision),
        for: .touchUpInside)
    btnSummation.addTarget(self, action: #selector(handleSummation),
        for: .touchUpInside)
    btnSubtraction.addTarget(self, action: #selector(handleSubtraction),
        for: .touchUpInside)
    btnMultiplication.addTarget(self, action: #selector(handleMultiplication),
        for: .touchUpInside)

    view.addSubview(btn0)
    view.addSubview(btn1)
    view.addSubview(btn2)
    view.addSubview(btn3)
    view.addSubview(btn4)
    view.addSubview(btn5)
    view.addSubview(btn6)
    view.addSubview(btn7)
    view.addSubview(btn8)
    view.addSubview(btn9)
    view.addSubview(btnClean)
    view.addSubview(btnComa)
    view.addSubview(btnDivision)
    view.addSubview(btnEqual)
    view.addSubview(btnMultiplication)
    view.addSubview(btnSqr)
    view.addSubview(btnSqrt)
    view.addSubview(btnSubtraction)
    view.addSubview(btnSummation)
  }

  private func arrangeButtons() {
    /// 0 row.
    setPosition(element: btn0, position: .bottom, relatedTo: view)
    setPosition(element: btnComa, position: .bottom, relatedTo: btn0)
    setPosition(element: btnComa, position: .left, relatedTo: btn0,
        constant: btnWidth * 2 + btnMargin + 1)
    setPosition(element: btnEqual, position: .bottom, relatedTo: btnComa)
    setPosition(element: btnEqual, position: .left, relatedTo: btnComa,
        constant: btnWidth + btnMargin)

    /// 1 row.
    setPosition(element: btn1, position: .bottom, relatedTo: view,
        constant: -(btnHeight + btnMargin))
    setPosition(element: btn2, position: .bottom, relatedTo: btn1)
    setPosition(element: btn2, position: .left, relatedTo: btn1,
        constant: btnWidth + btnMargin)
    setPosition(element: btn3, position: .bottom, relatedTo: btn2)
    setPosition(element: btn3, position: .left, relatedTo: btn2,
        constant: btnWidth + btnMargin)
    setPosition(element: btnSummation, position: .bottom, relatedTo: btn3)
    setPosition(element: btnSummation, position: .left, relatedTo: btn3,
        constant: btnWidth + btnMargin)

    /// 2 row.
    setPosition(element: btn4, position: .bottom, relatedTo: view,
        constant: -(btnHeight * 2 + btnMargin + 1))
    setPosition(element: btn5, position: .bottom, relatedTo: btn4)
    setPosition(element: btn5, position: .left, relatedTo: btn4,
        constant: btnWidth + btnMargin)
    setPosition(element: btn6, position: .bottom, relatedTo: btn5)
    setPosition(element: btn6, position: .left, relatedTo: btn5,
        constant: btnWidth + btnMargin)
    setPosition(element: btnSubtraction, position: .bottom, relatedTo: btn6)
    setPosition(element: btnSubtraction, position: .left, relatedTo: btn6,
        constant: btnWidth + btnMargin)

    /// 3 row.
    setPosition(element: btn7, position: .bottom, relatedTo: view,
        constant: -(btnHeight * 3 + btnMargin + 2))
    setPosition(element: btn8, position: .bottom, relatedTo: btn7)
    setPosition(element: btn8, position: .left, relatedTo: btn7,
        constant: btnWidth + btnMargin)
    setPosition(element: btn9, position: .bottom, relatedTo: btn8)
    setPosition(element: btn9, position: .left, relatedTo: btn8,
        constant: btnWidth + btnMargin)
    setPosition(element: btnMultiplication, position: .bottom, relatedTo: btn9)
    setPosition(element: btnMultiplication, position: .left, relatedTo: btn9,
        constant: btnWidth + btnMargin)

    /// 4 row.
    setPosition(element: btnClean, position: .bottom, relatedTo: view,
        constant: -(btnHeight * 4 + btnMargin + 3))
    setPosition(element: btnSqrt, position: .bottom, relatedTo: btnClean)
    setPosition(element: btnSqrt, position: .left, relatedTo: btnClean,
        constant: btnWidth + btnMargin)
    setPosition(element: btnSqr, position: .bottom, relatedTo: btnSqrt)
    setPosition(element: btnSqr, position: .left, relatedTo: btnSqrt,
        constant: btnWidth + btnMargin)
    setPosition(element: btnDivision, position: .bottom, relatedTo: btnSqr)
    setPosition(element: btnDivision, position: .left, relatedTo: btnSqr,
        constant: btnWidth + btnMargin)
  }

  class Button {
    var title: String
    var width: CGFloat
    var height: CGFloat
    var color: UIColor
    var titleColor: UIColor

    init(title: String, width: CGFloat = btnWidth, height: CGFloat = btnHeight,
         color: UIColor = lightGray, titleColor: UIColor = darkGray) {
      self.title = title
      self.width = width
      self.height = height
      self.color = color
      self.titleColor = titleColor
    }

    func get() -> UIButton {
      let btn = UIButton()
      btn.setTitle(title, for: .normal)
      btn.backgroundColor = color
      btn.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo", size: 36.0)
      btn.setTitleColor(titleColor, for: .normal)
      btn.translatesAutoresizingMaskIntoConstraints = false
      btn.widthAnchor.constraint(equalToConstant: width).isActive = true
      btn.heightAnchor.constraint(equalToConstant: height).isActive = true
      return btn
    }
  }
}

// Sets provided element to the position relative to another element.
func setPosition(element: UIView, position: Position, relatedTo: UIView,
                 constant: CGFloat = 0.0) {
  switch position {
  case .top:
    element.topAnchor.constraint(equalTo: relatedTo.topAnchor,
        constant: constant).isActive = true
    break
  case .right:
    element.rightAnchor.constraint(equalTo: relatedTo.rightAnchor,
        constant: constant).isActive = true
    break
  case .bottom:
    element.bottomAnchor.constraint(equalTo: relatedTo.bottomAnchor,
        constant: constant).isActive = true
    break
  case .left:
    element.leftAnchor.constraint(equalTo: relatedTo.leftAnchor,
        constant: constant).isActive = true
    break
  case .center:
    element.centerXAnchor.constraint(equalTo: relatedTo.centerXAnchor,
        constant: constant).isActive = true
    break
  }
}

// Converts rgba to UIColor.
func rgba(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
  return UIColor(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
}

enum Position {
  case bottom
  case center
  case left
  case right
  case top
}

// Sizes.
let btnMargin: CGFloat = 1.0
let btnHeight = UIScreen.main.bounds.size.height / 7.1 - btnMargin
let btnWidth = UIScreen.main.bounds.size.width / 4 - btnMargin
let height = UIScreen.main.bounds.size.height
let width = UIScreen.main.bounds.size.width

// Colors.
let blue = rgba(r: 2, g: 157, b: 195, a: 1.0)
let darkGray = rgba(r: 94, g: 94, b: 94, a: 1.0)
let gray = rgba(r: 146, g: 146, b: 146, a: 1.0)
let lightGray = rgba(r: 214, g: 214, b: 214, a: 1.0)
