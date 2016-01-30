//
//  ViewController.swift
//  RetroCalc
//
//  Created by Joseph DuBay on 1/25/16.
//  Copyright © 2016 DuBay Designs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    enum Operator {
        case add;
        case divide;
        case subtract;
        case multiply;
        case equals;
        case empty
    }
    
    
    //outlets
    @IBOutlet weak var valueLbl: UILabel!
    
    
    //local vars
    var currentOperator: Operator = Operator.empty
    var rightSide = ""
    var leftSide = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //actions
    @IBAction func numberPressed(button: UIButton){
        if(rightSide.characters.count < 20){
            rightSide+="\(button.tag)"
            valueLbl.text=rightSide
        }
    }
    
    
    @IBAction func addPressed(button: UIButton){
        processOperator(Operator.add)
    }
    
    @IBAction func subtractPressed(button: UIButton){
       processOperator(Operator.subtract)
    }
    
    @IBAction func multiplyPressed(button: UIButton){
        processOperator(Operator.multiply)
    }
    
    @IBAction func dividePressed(button: UIButton){
        processOperator(Operator.divide)
    }
    
    @IBAction func equalsPressed(button: UIButton){
        processOperator(Operator.equals)
    }
    
    @IBAction func clearPressed(button: UIButton){
        rightSide = ""
        leftSide = ""
        currentOperator = Operator.empty
        valueLbl.text = "0"
    }
    
    
    //local functions
    func processOperator(action: Operator){
        if(leftSide.characters.count < 1){
            if(action != Operator.equals){
                leftSide = rightSide
                rightSide = ""
                currentOperator = action
                valueLbl.text = leftSide
            } else{
                //nothing to do
            }
            
        } else{
            if (action == Operator.equals){
                print("Do math")
                switch currentOperator {
                case .add:
                    print("add")
                    rightSide = "\(Int(leftSide)! + Int(rightSide)!)"
                    leftSide = ""
                    currentOperator = Operator.empty
                    break
                
                case .subtract:
                    print("subtract")
                    rightSide = "\(Int(leftSide)! - Int(rightSide)!)"
                    leftSide = ""
                    break
                
                case .divide:
                    print("divide")
                    rightSide = "\( Int(leftSide)! / Int(rightSide)! )"
                    leftSide = ""
                    break
                
                case .multiply:
                    print("multiply")
                    rightSide = "\( Int(leftSide)! * Int(rightSide)! )"
                    leftSide = ""
                    break
                    
                default:
                    print("default")
                    currentOperator = Operator.empty
                    break
                }
                //display result and save on right side
                valueLbl.text = rightSide
            } else {
                processOperator(Operator.equals)
                processOperator(action)
                
            }
            
        }
    }

}

