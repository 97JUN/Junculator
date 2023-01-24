//
//  ViewController.swift
//  Junculator
//
//  Created by 쭌이 on 2023/01/12.
//

import UIKit

class ViewController: UIViewController {
    
    
    //Outlet
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var outputLabel: UILabel!
    
    
    var currentNumber:Double = 0.0
    var currentOperator:CalcuOperator?//operator 중에 하나(+,-,/,*)
    var currentOperation: CalcuOperation = CalcuOperation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    //MARK: - IBAction
    
    //Operation
    
    @IBAction func operation(_ sender: UIButton) {
        addoperationNode()
        
        var currentOp: CalcuOperator = .plus
        switch sender.tag {
        case 101:
            currentOp = .divide
        case 102:
            currentOp = .multiply
        case 103:
            currentOp = .minus
        case 104:
            currentOp = .plus
        default :
            ()
        }
        currentOperator = currentOp
        inputLabel.text = inputLabel.text! + " " + currentOp.symbol

    }
    
    func addoperationNode() {
        guard currentNumber != 0.0 else {
            return
        }
        if let currentOp  = currentOperator{
            currentOperation.operationNodes.append(CalcuOperationNode(op: currentOp, operand: currentNumber))
        }else {
            currentOperation.baseNumber = currentNumber
        }
        currentNumber = 0.0
        inputLabel.text = String(currentNumber)
        inputLabel.text = currentOperation.operationString()
    }
    
    @IBAction func clear(_ sender: UIButton) {
        inputLabel.text = ""
        outputLabel.text = ""
        currentOperation = CalcuOperation()
    }
    
    @IBAction func result(_ sender: UIButton) {
        addoperationNode()
        //inputLabel.text = inputLabel.text! + "="
        outputLabel.text = String(currentOperation.calcuReuslt())
    }
    
//Number
    @IBAction func touchNumber(_ sender: UIButton) {
        let buttonNumber = sender.tag - 10
        
        currentNumber = currentNumber * 10 + Double(buttonNumber)
        
        inputLabel.text = String(currentNumber)
        
    }
    

}

