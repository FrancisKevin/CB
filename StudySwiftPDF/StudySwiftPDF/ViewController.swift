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
        var myVariable = 42 // 使用var来声明变量
        myVariable = 50
        let myConstant = 42 // 使用let来声明常量
        
        
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
        
        
        // 你可以一起使用 if 和 let 来处理值缺失的情况。有些变量是可选的。一个可选的值可能是一个具体的值或者是nil，表示值缺失。在类型后面加一个问号来标记这个变量的值是可选的。
        var optionalString: String? = "Hello"
        optionalString == nil
        var optionalName: String? = "John Appleseed"
        optionalName = nil
        var greeting = "Hello!"
        if let name = optionalName
        {
            greeting = "Hello, \(name)"
        }
        else
        {
            println(greeting);
            greeting = "159"
            println(greeting);
        }
        
        
        // switch 支持任意类型的数据以及各种比较操作 —— 不仅仅是整数以及测试相等。
        let vegetable = "red pepper"
        switch vegetable
        {
            case "celery":
                let vegetableComment = "Add some raisins and make ants on a log."
            
            case "cucumber", "watercress":
                let vegetableComment = "That would make a good tea sandwich."
            
            case let x where x.hasSuffix("pepper"):
                let vegetableComment = "Is it a spicy \(x)?"
            
            default:
                let vegetableComment = "Everything tastes good in soup."
        }

        
        // 你可以使用 for-in 来遍历字典，需要两个变量来表示每个键值对。
        let interestingNumbers = [
            "Prime": [2,3,5,6,11,13],
            "Fibonacci": [1,1,2,3,5,8],
            "Square": [1,4,9,16,25],
        ]
        var largest = 0
        for (kind, numbers) in interestingNumbers
        {
            for number in numbers
            {
                if number > largest
                {
                    largest = number
                }
            }
        }
        
        
        // 使用 while
        var n = 2
        while n < 100
        {
            n = n * 2
        }
        
        var m = 2
        do
        {
            m = m * 2
        } while m < 100
        
        
        // 两种 for 写法
        var firstForLoop = 0
        for i in 0...3//范围是 0 <= i <= 3
        {
            firstForLoop += i
        }
        
        var secondForLoop = 0
        for var i = 0; i < 3; ++i
        {
            secondForLoop += i
        }
        
        // 函数和闭包
        println("-----函数和闭包-----");
        println(greet("Bob", day: "Tuesday"))
        println("获得一个元组：\(getGasPrices())")
        println("0个参数的和：\(sumOf())")
        println("若干个参数的和：\(sumOf(42, 68, 95))")
        println("嵌套函数：\(returnFifteen())");
        var increment = makeIncrementer()
        println("函数作为另一个函数的返回值：\(increment(7))")
        var numbers = [20, 19, 7, 12]
        println("函数作为参数传入另一个函数：\(hasAnyMatches(numbers, condition: lessThanTen))")
        print("数组数据改变前：")
        println(numbers)
        numbers.map({
            (number: Int) -> Int in
            let result = 3 * number
            return result
        })
        print("数组数据改变后：")
        println(numbers)
        
        // 对象和类
        println()
        println("-----对象和类-----");
        var shape = Shape()
        shape.numberOfSides = 7
        var shapeDescription = shape.simpleDescription()
        println(shapeDescription)
        
        let test = Square(sideLength: 5.2, name: "my test square")
        println(test.area())
        println(test.simpleDescription())
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // 简单传参
    func greet(name: String, day: String) -> String
    {
        return "Hello \(name), today is \(day)."
    }
    
    // 使用一个元组返回多个值
    func getGasPrices() -> (Double, Double, Double)
    {
        return (3.59, 3.69, 3.79);
    }
    
    // 传入参数数量可变
    func sumOf(numbers: Int...) -> Int
    {
        var sum = 0
        for number in numbers
        {
            sum += number
        }
        
        return sum
    }
    
    // 计算平均值
    /*
    func averageNumber(numbers: Double...) -> Double
    {
        var sum: Double = 0
        for number in numbers
        {
            sum += number
        }
        
        if 0 == sum
        {
            return sum
        }
        else
        {
            var average: Double = 0
            average = sum / numbers.count
            return average
        }
    }
    */
    
    
    // 函数可以嵌套。被嵌套的函数可以访问外侧的变量，你可以使用嵌套函数来重构一个太长或者太复杂的函数
    func returnFifteen() -> Int
    {
        var y = 10
        
        func add()
        {
            y += 5
        }
        
        add()
        return y
    }
    
    
    // 函数是一等公民，这意味着函数可以作为另一个函数的返回值。
    func makeIncrementer() -> (Int -> Int)
    {
        func addOne(number: Int) -> Int
        {
            return 1 + number
        }
        
        return addOne
    }
    
    
    // 函数也可以当做参数传入另一个函数
    func hasAnyMatches(list: [Int], condition: Int -> Bool) ->Bool
    {
        for item in list
        {
            if condition(item)
            {
                return true
            }
        }
        
        return false
    }
    
    func lessThanTen(number: Int) -> Bool
    {
        return number < 10
    }
    
    // 创建一个类
    class Shape
    {
        var numberOfSides = 0
        func simpleDescription() -> String
        {
            return "A shape with \(numberOfSides) sides."
        }
    }
    
    // 创建一个构造器
    class NamedShape
    {
        var numberOfSides: Int = 0
        var name: String
        
        init(name: String)
        {
            self.name = name
        }
        
        func simpleDescription() -> String
        {
            return "A shape with \(numberOfSides) sides."
        }
    }
    
    // 子类重写父类的函数，必须使用override标记，否则编译器会报错。编译器同时会检测override的函数是否存在于父类中
    class Square: NamedShape
    {
        var sideLength: Double
        
        init(sideLength: Double, name: String)
        {
            self.sideLength = sideLength
            super.init(name: name)
            numberOfSides = 4
        }
        
        func area() -> Double
        {
            return sideLength * sideLength
        }
        
        override func simpleDescription() -> String
        {
            return "A shape with sides of length \(numberOfSides)."
        }
    }
    
    class EquilateralTriangle: NamedShape
    {
        var sideLength: Double = 0.0
        
        init(sideLength: Double, name: String)
        {
            self.sideLength = sideLength
            super.init(name: name)
            numberOfSides = 3
        }
        
        var perimeter: Double {
            get {
                return 3.0 * sideLength
            }
            set {
                sideLength = newValue
            }
        }
    }
    
}

