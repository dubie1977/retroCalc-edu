//
//  ViewController.swift
//  RetroCalc
//
//  Created by Joseph DuBay on 1/25/16.
//  Copyright © 2016 DuBay Designs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //outlets
    @IBOutlet weak var valueLbl: UILabel!
    
    
    //local vars
    enum Operator { case add; case divide}
    var currentOperator: Operator = Operator.add

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
    
    }
    
    @IBAction func operatorPressed(button: UIButton){
       switch currentOperator {
            case .add:
                print("adding")
                break
            default:
                print("default")
                break
        }
    }
    
    @IBAction func clearPressed(button: UIButton){
    
    }

}

