//
//  CalcuBrain.swift
//  Junculator
//
//  Created by 쭌이 on 2023/01/23.
//

import Foundation
import UIKit

enum CalcuOperator {
    case plus
    case minus
    case multiply
    case divide
    
    var doCalc: (Double,Double) -> Double {
        switch self {
            case .plus:
                return (+)
            case .minus:
                return (-)
            case .multiply:
                return (*)
            case .divide:
                return (/)
            }
    }
    
    var symbol: String {
        switch self {
        case .plus:
            return "+"
        case .minus:
            return "-"
        case .multiply:
            return "x"
        case .divide:
            return "÷"
        }
    }
}

struct CalcuOperationNode {
    var op: CalcuOperator
    var operand: Double
    
}

struct CalcuOperation {
    
    var baseNumber: Double
    var operationNodes: [CalcuOperationNode]
   
    
    init () {
        self.baseNumber = 0.0
        self.operationNodes = [CalcuOperationNode]()
    }
    
    mutating func mixPriorityNode()  {
        
        var newNode:[CalcuOperationNode] = []
        
        for node in self.operationNodes {
            
            if node.op == .multiply || node.op == .divide {
                let base: Double
                if newNode.isEmpty { //첫번째가 곱하기 or 나누기 일때
                    base = baseNumber
                    let newOperand = node.op.doCalc(base , node.operand)
                    //이번 node의 operand가 뭔지를 보고 계산을(base와 현재의 operand) 해라
                    baseNumber = newOperand
                }else {
                    let lastNode = newNode.removeLast()// 곱하기 먼저할때 이미 들어있는 +-의 operand를 제거
                     base = lastNode.operand
                    let newOperand = node.op.doCalc(base, node.operand)
                    newNode.append(CalcuOperationNode(op: lastNode.op, operand: newOperand))
                }
            }else {
                newNode.append(node)
            }
        }
        operationNodes = newNode
    }
    
    func mixOperationNodes() -> Double{
        let value = operationNodes.reduce(baseNumber, { (result:Double, element:CalcuOperationNode)
            in
            element.op.doCalc(result, element.operand)
            //result는 직전 계산의 결과값
            //base 3이들어가고 doCalc에서 5가들어가서 8 그다음 8이 result로 다시들어와서
            // 8 * 4가된다.
        })
        return value
    }
    
   mutating func calcuReuslt() -> Double {
        mixPriorityNode()
        return mixOperationNodes()
    }
    
    func operationString() -> String {
        return operationNodes.reduce(String(baseNumber), { (result:String, element:CalcuOperationNode) in
            result + " " + element.op.symbol + " " + String(element.operand)
        })
    }
}


//var cal = CalcuOperation(baseNumber: 3, operationNodes: [CalcuOperationNode(op: .plus, operand: 3),CalcuOperationNode(op: .multiply, operand: 4)])
//
//let result = cal.mixOperationNodes()



