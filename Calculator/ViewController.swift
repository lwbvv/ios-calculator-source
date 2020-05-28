//
//  ViewController.swift
//  Calculator
//
//  Created by Developer Appg on 2020/05/27.
//  Copyright © 2020 appg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnWidth: NSLayoutConstraint!
    
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var acbutton: UIButton!
    var currentNum : Int = 0
    var totalNum : Int = 0
    var isArithmetic : Bool = false
    var currentArithmetic : String = ""
    var beforeArithmetic : String = ""
    var reset : Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        // 텍스트의 길이가 뷰의 width를 넘어가게 되면 폰트 사이즈를 줄여준다
        number.adjustsFontSizeToFitWidth = true
//        btnWidth.constant = 200
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews")
        acbutton.layer.cornerRadius = acbutton.frame.width / 2.0
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews")
    }
    
    
    @IBAction func arithmetic(_ sender : UIButton){
//        print(sender.currentAttributedTitle!)
        isArithmetic = true
        currentArithmetic = sender.currentTitle!
        currentNum = Int(number.text ?? "") ?? 0
        switch currentArithmetic {
        case "/":
            if currentNum != 0{
            if reset{
                totalNum = currentNum / 1
                reset = false
            }
            else{
            totalNum = totalNum / currentNum
            }
            }
            else{
            number.text = "오류"
            }
        case "✕":
            if reset{
                totalNum = 1 * currentNum
                reset = false
            }
            else{
            totalNum = totalNum * currentNum
            }
            
        case "-":
            totalNum = totalNum - currentNum
        case "+":
            totalNum = totalNum + currentNum
        case "=":
            switch beforeArithmetic {
                case "/":
                    if currentNum != 0{
                    totalNum = totalNum / currentNum
                    }
                    else{
                    number.text = "오류"
                    }
                case "✕":
                    totalNum = totalNum * currentNum
                case "-":
                    totalNum = totalNum - currentNum
                case "+":
                    totalNum = totalNum + currentNum
                default:
                print("None")
            }
        default:
            print("None")
        }
        number.text = String(totalNum)
        beforeArithmetic = currentArithmetic
    }

    @IBAction func btnNum(_ sender: UIButton) {
        if number.text == "0"{
            number.text = ""
        }
        if isArithmetic{
            number.text = ""
        }
        isArithmetic = false
        switch sender.tag {
        case 1:
            number.text?.append(String(sender.tag))
        case 2:
            number.text?.append(String(sender.tag))
        case 3:
            number.text?.append(String(sender.tag))
        case 4:
            number.text?.append(String(sender.tag))
        case 5:
            number.text?.append(String(sender.tag))
        case 6:
            number.text?.append(String(sender.tag))
        case 7:
            number.text?.append(String(sender.tag))
        case 8:
            number.text?.append(String(sender.tag))
        case 9:
            number.text?.append(String(sender.tag))
        case 0:
            number.text?.append(String(sender.tag))
        default:
            print("None")
        }
    }
    @IBAction func btnAc(_ sender: UIButton) {
        number.text = "0"
        totalNum = 0
        currentNum = 0
        number.font = .systemFont(ofSize: 100)
        reset = true
    }
    
    @IBAction func positiveOrNegativeButton(){
        
    }
    @IBAction func percentButton(){
        
    }
}

