//
//  ViewController.swift
//  Calculator
//
//  Created by Goga Tirkiya on 04/01/2019.
//  Copyright © 2019 Goga Tirkiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let height = UIScreen.main.bounds.size.height
  let width = UIScreen.main.bounds.size.width

  let btnLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "Apple SD Gothic Neo Regular", size: 40.0)
    label.textColor = UIColor(red: 94, green: 94, blue: 94, alpha: 1.0)
    return label
  }()

  let btnColor = UIColor(red: 214 / 255, green: 214 / 255, blue: 214 / 255,
      alpha: 1.0)
  let btnTitleColor = UIColor(red: 94 / 255, green: 94 / 255, blue: 94 / 255,
      alpha: 1.0)

  let margin: CGFloat = 1.0

  let btnWidth = UIScreen.main.bounds.size.width / 4 - 1
  let btnHeight = UIScreen.main.bounds.size.height / 7.1 - 1

  var btnComa = UIButton()
  var btnEqual = UIButton()
  var btnPlus = UIButton()
  var btnDivision = UIButton()
  var btnMultiplication = UIButton()
  var btnSubtraction = UIButton()
  var btnSummation = UIButton()
  var btnClean = UIButton()
  var btnSqrt = UIButton()
  var btnSqr = UIButton()

  var btn0 = UIButton()
  var btn1 = UIButton()
  var btn2 = UIButton()
  var btn3 = UIButton()
  var btn4 = UIButton()
  var btn5 = UIButton()
  var btn6 = UIButton()
  var btn7 = UIButton()
  var btn8 = UIButton()
  var btn9 = UIButton()

  override func viewDidLoad() {
    super.viewDidLoad()

    btn0 = Button(title: "0", width: btnWidth * 2, height: btnHeight,
        color: btnColor, titleColor: btnTitleColor).getButton()
    btn1 = Button(title: "1", width: btnWidth, height: btnHeight,
        color: btnColor, titleColor: btnTitleColor).getButton()
    btn2 = Button(title: "2", width: btnWidth, height: btnHeight,
        color: btnColor, titleColor: btnTitleColor).getButton()
    btn3 = Button(title: "3", width: btnWidth, height: btnHeight,
        color: btnColor, titleColor: btnTitleColor).getButton()
    btn4 = Button(title: "4", width: btnWidth, height: btnHeight,
        color: btnColor, titleColor: btnTitleColor).getButton()
    btn5 = Button(title: "5", width: btnWidth, height: btnHeight,
        color: btnColor, titleColor: btnTitleColor).getButton()
    btn6 = Button(title: "6", width: btnWidth, height: btnHeight,
        color: btnColor, titleColor: btnTitleColor).getButton()
    btn7 = Button(title: "7", width: btnWidth, height: btnHeight,
        color: btnColor, titleColor: btnTitleColor).getButton()
    btn8 = Button(title: "8", width: btnWidth, height: btnHeight,
        color: btnColor, titleColor: btnTitleColor).getButton()
    btn9 = Button(title: "9", width: btnWidth, height: btnHeight,
        color: btnColor, titleColor: btnTitleColor).getButton()

    btnComa = Button(title: ",", width: btnWidth, height: btnHeight,
        color: btnColor, titleColor: btnTitleColor).getButton()
    btnEqual = Button(title: "=", width: btnWidth, height: btnHeight,
        color: btnColor, titleColor: btnTitleColor).getButton()

    btnClean = Button(title: "AC", width: btnWidth, height: btnHeight,
        color: btnColor, titleColor: btnTitleColor).getButton()
    btnSqrt = Button(title: "√", width: btnWidth, height: btnHeight,
        color: btnColor, titleColor: btnTitleColor).getButton()
    btnSqr = Button(title: "x²", width: btnWidth, height: btnHeight,
        color: btnColor, titleColor: btnTitleColor).getButton()

    btnDivision = Button(title: "÷", width: btnWidth, height: btnHeight,
        color: btnColor, titleColor: btnTitleColor).getButton()
    btnMultiplication = Button(title: "x", width: btnWidth, height: btnHeight,
        color: btnColor, titleColor: btnTitleColor).getButton()
    btnSubtraction = Button(title: "-", width: btnWidth, height: btnHeight,
        color: btnColor, titleColor: btnTitleColor).getButton()
    btnSummation = Button(title: "+", width: btnWidth, height: btnHeight,
        color: btnColor, titleColor: btnTitleColor).getButton()

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
    view.addSubview(btnComa)
    view.addSubview(btnEqual)
    view.addSubview(btnClean)
    view.addSubview(btnSqr)
    view.addSubview(btnSqrt)
    view.addSubview(btnDivision)
    view.addSubview(btnMultiplication)
    view.addSubview(btnSubtraction)
    view.addSubview(btnSummation)

    /// 0 row.
    setPosition(element: btn0, position: Position.bottom, relatedTo: view)

    setPosition(element: btnComa, position: Position.bottom, relatedTo: btn0)
    setPosition(element: btnComa, position: Position.left, relatedTo: btn0, constant: btnWidth * 2 + margin)

    setPosition(element: btnEqual, position: Position.bottom, relatedTo: btnComa)
    setPosition(element: btnEqual, position: Position.left, relatedTo: btnComa, constant: btnWidth + margin)

    /// 1 row.
    setPosition(element: btn1, position: Position.bottom, relatedTo: view, constant: -(btnHeight + margin))

    setPosition(element: btn2, position: Position.bottom, relatedTo: btn1)
    setPosition(element: btn2, position: Position.left, relatedTo: btn1, constant: btnWidth + margin)

    setPosition(element: btn3, position: Position.bottom, relatedTo: btn2)
    setPosition(element: btn3, position: Position.left, relatedTo: btn2, constant: btnWidth + margin)

    setPosition(element: btnSummation, position: Position.bottom, relatedTo: btn3)
    setPosition(element: btnSummation, position: Position.left, relatedTo: btn3, constant: btnWidth + margin)

    /// 2 row.
    setPosition(element: btn4, position: Position.bottom, relatedTo: view, constant: -(btnHeight * 2 + margin + 1))

    setPosition(element: btn5, position: Position.bottom, relatedTo: btn4)
    setPosition(element: btn5, position: Position.left, relatedTo: btn4, constant: btnWidth + margin)

    setPosition(element: btn6, position: Position.bottom, relatedTo: btn5)
    setPosition(element: btn6, position: Position.left, relatedTo: btn5, constant: btnWidth + margin)

    setPosition(element: btnSubtraction, position: Position.bottom, relatedTo: btn6)
    setPosition(element: btnSubtraction, position: Position.left, relatedTo: btn6, constant: btnWidth + margin)

    /// 3 row.
    setPosition(element: btn7, position: Position.bottom, relatedTo: view, constant: -(btnHeight * 3 + margin + 2))

    setPosition(element: btn8, position: Position.bottom, relatedTo: btn7)
    setPosition(element: btn8, position: Position.left, relatedTo: btn7, constant: btnWidth + margin)

    setPosition(element: btn9, position: Position.bottom, relatedTo: btn8)
    setPosition(element: btn9, position: Position.left, relatedTo: btn8, constant: btnWidth + margin)

    setPosition(element: btnMultiplication, position: Position.bottom, relatedTo: btn9)
    setPosition(element: btnMultiplication, position: Position.left, relatedTo: btn9, constant: btnWidth + margin)

    ///
    setPosition(element: btnClean, position: Position.bottom, relatedTo: view, constant: -(btnHeight * 4 + margin + 3))

    setPosition(element: btnSqrt, position: Position.bottom, relatedTo: btnClean)
    setPosition(element: btnSqrt, position: Position.left, relatedTo: btnClean, constant: btnWidth + margin)

    setPosition(element: btnSqr, position: Position.bottom, relatedTo: btnSqrt)
    setPosition(element: btnSqr, position: Position.left, relatedTo: btnSqrt, constant: btnWidth + margin)

    setPosition(element: btnDivision, position: Position.bottom, relatedTo: btnSqr)
    setPosition(element: btnDivision, position: Position.left, relatedTo: btnSqr, constant: btnWidth + margin)
  }

  class Button {
    var title: String
    var width: CGFloat
    var height: CGFloat
    var color: UIColor
    var titleColor: UIColor

    init(title: String, width: CGFloat, height: CGFloat, color: UIColor, titleColor: UIColor) {
      self.title = title
      self.width = width
      self.height = height
      self.color = color
      self.titleColor = titleColor
    }

    func getButton() -> UIButton {
      let btn = UIButton()
      btn.setTitle(title, for: UIControl.State.normal)
      btn.backgroundColor = color
      btn.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo Regular", size: 40.0)
      btn.setTitleColor(titleColor, for: UIControl.State.normal)
      btn.translatesAutoresizingMaskIntoConstraints = false
      btn.widthAnchor.constraint(equalToConstant: width).isActive = true
      btn.heightAnchor.constraint(equalToConstant: height).isActive = true
      return btn;
    }
  }

  func setPosition(element: UIView, position: Position, relatedTo: UIView, constant: CGFloat = 0.0) {
    switch position {
    case Position.top:
      element.topAnchor.constraint(equalTo: relatedTo.topAnchor, constant: constant)
          .isActive = true
      break
    case Position.right:
      element.rightAnchor.constraint(equalTo: relatedTo.rightAnchor, constant: constant)
          .isActive = true
      break
    case Position.bottom:
      element.bottomAnchor.constraint(equalTo: relatedTo.bottomAnchor, constant: constant)
          .isActive = true
      break
    case Position.left:
      element.leftAnchor.constraint(equalTo: relatedTo.leftAnchor, constant: constant)
          .isActive = true
      break
    }
  }

  enum Position {
    case top
    case right
    case bottom
    case left
  }
}
