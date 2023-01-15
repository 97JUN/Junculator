//
//  ViewController.swift
//  Junculator
//
//  Created by 쭌이 on 2023/01/12.
//

import UIKit

class ViewController: UIViewController {
    
    
    //Outlet
    @IBOutlet weak var input: UILabel!
    @IBOutlet weak var output: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.text = "0"
    }
    
    var inputString: String = "0"
    var numbers: [Int] = []
    var sign: Int = 1
    var tmp: Int = 0
  
    
    func calculate() {
        numbers.append(Int(inputString)!)
        print("\(numbers)")
        if sign == 1 {
            tmp += numbers.last!
        }else if sign == 2 {
            tmp -= numbers.last!
        }else if sign == 3 {
            tmp *= numbers.last!
        }else if sign == 4 {
            tmp /= numbers.last!
        }
        output.text = String(tmp)
    }
    
    //MARK: - IBAction
    
    //Operation
    
    @IBAction func operation(_ sender: UIButton) {
        
        if inputString == "" {
            
        }else {
            
            if sender.titleLabel?.text == "+" {
                
                if numbers.isEmpty {
                    numbers.append(Int(inputString)!)
                    tmp = numbers.last!
                    sign = 1
                }else {
                    calculate()
                }
                sign = 1
                inputString = ""
            }else if sender.titleLabel?.text == "-" {
                
                if numbers.isEmpty {
                    numbers.append(Int(inputString)!)
                    tmp = numbers.last!
                    sign = 2
                }else {
                    calculate()
                }
                output.text = String(tmp)
                sign = 2
                inputString = ""
                
            }else if sender.titleLabel?.text == "x" {
                
                if numbers.isEmpty {
                    numbers.append(Int(inputString)!)
                    tmp = numbers.last!
                    sign = 3
                }else {
                    calculate()
                    
                }
                output.text = String(tmp)
                sign = 3
                inputString = ""
            }else if sender.titleLabel?.text == "÷" {
                
                if numbers.isEmpty {
                    numbers.append(Int(inputString)!)
                    tmp = numbers.last!
                    sign = 4
                }else {
                    calculate()
                }
                output.text = String(tmp)
                sign = 4
                inputString = ""
            }else if sender.titleLabel?.text == "=" {
                
                calculate()
                output.text = String(tmp)
                numbers = []
                tmp = 0
                inputString = ""
            }
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        inputString = ""
        output.text = inputString
    }
    
    
    
    
//Number
    @IBAction func touchNumber(_ sender: UIButton) {
        
        if output.text == "0" {
                inputString = (sender.titleLabel?.text)!
        }else {
            inputString += (sender.titleLabel?.text)!
        }
        output.text = inputString
    }
    

}

