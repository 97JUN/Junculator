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
    var prevOper: String = "+"
    var inputLabel: String = ""
    
    var prev: Int = 0
    var current: Int = 0
    
    
    
    func calculate() {
        if prev == 0 {
            prev = Int(inputString)!
        }else {
            current = Int(inputString)!
            if prevOper == "+"{
                prev += current
                output.text = String(prev)
            }else if prevOper == "-"{
                prev -= current
                output.text = String(prev)
            }else if prevOper == "x"{
                prev *= current
                output.text = String(prev)
            }else if prevOper == "÷"{
                prev /= current
                output.text = String(prev)
            }
        }
    }

    func setInputLabel(_ sender: UIButton) {
        inputLabel += (sender.titleLabel?.text!)!
        input.text = inputLabel
        print(inputLabel)
    }
    func cal() {
        
    }
    
    //MARK: - IBAction
    
    //Operation
    
    @IBAction func operation(_ sender: UIButton) {
        if inputString != "" {
            if sender.titleLabel?.text! == "+"{
                setInputLabel(sender)
                calculate()
            }else if sender.titleLabel?.text! == "-"{
                setInputLabel(sender)
                calculate()
            }else if sender.titleLabel?.text! == "x"{
                setInputLabel(sender)
                calculate()
            }else if sender.titleLabel?.text! == "÷"{
                setInputLabel(sender)
                calculate()
            }else if sender.titleLabel?.text! == "="{
                calculate()
                cal()
                inputLabel = ""
                input.text =  inputLabel
                output.text = String(prev)
                prev = 0
            }
            prevOper = sender.titleLabel!.text!
            inputString  = "0"
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        inputLabel = ""
        inputString = "0"
        input.text = inputLabel
        output.text = inputString
        prev = 0
        current = 0
    }
    
    
    
    
//Number
    @IBAction func touchNumber(_ sender: UIButton) {
        
        if output.text == "0" {
                inputString += (sender.titleLabel?.text)!
        }else {
            inputString += (sender.titleLabel?.text)!
        }
        setInputLabel(sender)
//        inputLabel += (sender.titleLabel?.text)!
        input.text = inputLabel
    }
    

}

