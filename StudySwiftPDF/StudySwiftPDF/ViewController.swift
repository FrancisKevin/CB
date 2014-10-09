//
//  ViewController.swift
//  StudySwiftPDF
//
//  Created by xychen on 14-10-9.
//  Copyright (c) 2014年 CB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        println("Hello world!")
        
        
        // 编译器将会推断出 myVariable 是一个整数，因为它的初始值是整数
        var myVariable = 42
        myVariable = 50
        let myConstant = 42
        
        
        // 如果初始值没有提供足够的信息（或者），那你需要在变量后面声明类型，用冒号分割。
        let implicitInteger = 70
        let implicitDouble = 70.0
        let explicitDouble: Double = 70
        
        
        // 值永远不会被隐式转换为其他类型。如果你需要把一个值转换成其他类型，请显显示转换
        let label = "The width is"
        let width = 94
        let widthLable = label + String(width)
        
        
        // 有一种更简单的把值转换成字符串方法：把值写到括号中，并且在之前写一个反斜杠。
        let apples = 3
        let oranges = 5
        let appleSummary = "I have \(apples) apples."
        let fruitSummary = "I have \(apples + oranges) pieces of fruit."
        
        
        // 使用方括号 [] 来创建数组和字典，并使用下标或者键（key）来访问元素
        var shoppingList = ["catfish", "water", "tulips", "blue paint"]
        shoppingList[1] = "bottle of water"
        var occupations = [
            "Malcolm": "Captain",
            "Kaylee": "Mechanic"
        ];
        occupations["Jayne"] = "Public Relations"
        
        
        // 要创建一个空数组或者字典，使用初始化语法。
        let emptyArray = Array<String>()
        let emptyDictionary = Dictionary<String, Float>()
        
        
        // 控制流 if 和 switch
        let individualScores = [75, 43, 103, 87, 12]
        var teamScore = 0
        for score in individualScores
        {
            if score > 50
            {
                teamScore += 3
            }
            else
            {
                teamScore += 1
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

