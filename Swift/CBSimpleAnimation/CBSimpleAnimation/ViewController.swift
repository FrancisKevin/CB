//
//  ViewController.swift
//  CBSimpleAnimation
//
//  Created by VIPMAC on 15/2/6.
//  Copyright (c) 2015年 CB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let originRect:CGRect = CGRectMake(0, 120, 50, 50)
    let moveRect:CGRect = CGRectMake(270, 120, 50, 50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create and add a colored square
        let coloredSquare = UIView()
        
        // Set background color to blue
        coloredSquare.backgroundColor = UIColor.blueColor()
        
        // Set frame of the square
        coloredSquare.frame = originRect
        
        // Add the square to the screen
        self.view.addSubview(coloredSquare)
        
        /*
        // 简单动画
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            
            // Change the background color when animation ends
            coloredSquare.backgroundColor = UIColor.redColor()
            
            // Change the position of the square
            coloredSquare.frame = CGRectMake(320-50, 120, 50, 50)
        })
*/
        
        /*
        // 带完成方法
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            
            self.move(coloredSquare)
            
        }) { (finished) -> Void in
            
            coloredSquare.backgroundColor = UIColor.blueColor()
        }
*/

        /*
        // 带完成方法和options
        UIView.animateWithDuration(1.0, delay: 0.5, options: UIViewAnimationOptions.TransitionCurlUp, animations: { () -> Void in
            
            self.move(coloredSquare)
            
        }) { (finished) -> Void in
            
            coloredSquare.backgroundColor = UIColor.blueColor()
        }
*/
        
        /*
        // 带物理引擎。usingSpringWithDamping：振幅大小，0=无穷；1=没有。initialSpringVelocity：动画开始有多快，1=正常
        UIView.animateWithDuration(1.0, delay: 0.5, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.TransitionCurlUp, animations: { () -> Void in
            
            self.move(coloredSquare)
            
        }) { (finished) -> Void in
            
            coloredSquare.backgroundColor = UIColor.blueColor()
            
        }
*/
        
        // 设置options:Repeat=动画不断重复；Autoreverse=动画结束后，按照反方向执行一遍
//        let options = UIViewAnimationOptions.Autoreverse
        let options = UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat | UIViewAnimationOptions.CurveEaseInOut
        UIView.animateWithDuration(1.0, delay: 0.1, options: options, animations: { () -> Void in
            
            self.move(coloredSquare)
            
        }) { (finished) -> Void in
                
            coloredSquare.frame = self.originRect
            coloredSquare.backgroundColor = UIColor.blueColor()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func move(aView: UIView) {
        
        // Change the background color when animation ends
        aView.backgroundColor = UIColor.redColor()
        
        // Change the position of the square
        aView.frame = moveRect
    }
}
