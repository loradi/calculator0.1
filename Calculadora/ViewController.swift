//
//  ViewController.swift
//  Calculadora
//
//  Created by Diego  lopez on 9/25/18.
//  Centennial College
//  Ios Mobile Development
//  Id: 300994519
//  Copyright © 2018 Diego_Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var Sum_flag: Int = 10
    var Minus_flag: Int = 20
    var Multi_flag: Int = 30
    var Div_flag: Int = 40
    var Equal_flag: Int = 50
    var C_flag: Int = 100
    var Percen_flag: Int = 60
    var sum_Minus_flag: Int = 70
    var no_press_op: Int = 1000
    var result_lght = 12
    
    
    
    @IBOutlet weak var resultArea: UILabel! //this is the area for results
    
    var hasDot: Bool = false
    var isOperatorPressed: Bool = false
    var isEqlPressed: Bool = false
    var pressedOperator: Int!
    var num1: Double = 0
    var num2: Double = 0
    var ans: Double = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setToInit();
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnACclick(_ sender: UIButton) {
        setToInit()
    }
    
    //this is the fucntion for all the numbers
    @IBAction func numbers(_ sender: UIButton) {
        if(isOperatorPressed){
            num1 = Double(resultArea.text!)!
            resultArea.text = "0"
            isOperatorPressed = false
        }
        //flag for checked if the Equal button is pressed or not
        if(isEqlPressed){
            setToInit()
        }
        
        //validation for dot
        if(resultArea.text == "0"){
            if(sender.tag == -1)
            {
                resultArea.text?.append(".")
                hasDot = true
            }
            else {
                resultArea.text = String(sender.tag)
            }
            
        } else {
            if(sender.tag == -1 && !hasDot && (resultArea.text?.count)! < result_lght - 1)
            {
                resultArea.text?.append(".")
                hasDot = true
            }
            if( sender.tag != -1 && (resultArea.text?.count)! < result_lght){
                resultArea.text?.append(String(sender.tag))
            }
            
        }
        
    }
    //function for make all the logic with the button equal
    @IBAction func btnEqlClick(_ sender: UIButton) {
        num2 = Double(resultArea.text!)!
        ans = performOperation(num1: num1, num2: num2, OPR_TAG: pressedOperator)
        resultArea.text = doubleRound(result: ans)
        isEqlPressed = true
    }
    
    
    
    
    
    @IBAction func btnPerClick(_ sender: UIButton) {
        resultArea.text = String(doubleRound(result: Double(resultArea.text!)!/100))
    }
    
    
    // here is the logic for each button operators
    @IBAction func btn_operators(_ sender: UIButton){
        
        if(num1 != 0){
            num2 = Double(resultArea.text!)!
            ans = performOperation(num1: num1, num2: num2, OPR_TAG: pressedOperator)
            resultArea.text = doubleRound(result: ans)
            isOperatorPressed = false
        }
        isOperatorPressed = true
        
        switch sender.tag {
        case Sum_flag:
            pressedOperator = Sum_flag
            break;
        case Minus_flag:
            pressedOperator = Minus_flag
            break;
        case Multi_flag:
            pressedOperator = Multi_flag
            break;
        case Div_flag:
            pressedOperator = Div_flag
            break;
        default:
            pressedOperator = no_press_op
            break;
        }
        
    }
    
    func setToInit(){
        
        resultArea.text = "0"
        hasDot = false
        isOperatorPressed = false
        isEqlPressed = false
        pressedOperator = 1000
        num1 = 0
        num2 = 0
        
    }
    
    func performOperation(num1: Double, num2: Double, OPR_TAG: Int) -> Double{
        var ans: Double = 0;
        
        switch OPR_TAG {
        case Sum_flag:
            ans = num1+num2
            
            break;
        case Minus_flag:
            ans = num1-num2
            
            break;
        case Multi_flag:
            ans = num1*num2
            
            break;
        case Div_flag:
            ans = num1/num2
            break;
        default:
            break;
        }
        return ans
    }
    //function if the numbers exceed the maximun lenght
    func doubleRound(result: Double) -> String {
        let finalAns = String(format: "%g", result)
        return finalAns
    }
    
    
    
    
    
    
    
}

