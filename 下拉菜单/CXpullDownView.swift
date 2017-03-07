//
//  pullDownView.swift
//  test
//
//  Created by MyMac on 2017/3/6.
//  Copyright © 2017年 Allen. All rights reserved.
//

import UIKit


protocol CXpullDownDelegate {
    
    func clickBtn(btn:UIButton)
}


class CXpullDownView: UIScrollView,UIScrollViewDelegate {


    var CXPDdelegate : CXpullDownDelegate!
    
    func initView(array:[String]) {
        
        
        self.backgroundColor = UIColor.white
        
        
        let index = array.count % 3
        
        var row = array.count/3
        if(index != 0){
            
            row = row + 1
            
        }

        var height:CGFloat = CGFloat (10 + row * 60)
        
        
        if(height >= SCREENHEIGHT){
            
            height = SCREENHEIGHT
        }
        self.delegate = self
        
        self.frame = CGRect.init(x: 0, y: 64, width: SCREENWIDTH, height: height)
        self.contentSize = CGSize.init(width: 0, height: CGFloat(10 + row * 60) + 128)
        
        if(array.count <= 3){
        
            for i in 0..<array.count{
            
                let button = UIButton.init(type: UIButtonType.custom)
                button.setTitle(array[i], for: UIControlState.normal)
                button.setTitleColor(ramdomColor(), for: UIControlState.normal)
                button.frame = CGRect.init(x: 10 + CGFloat(i)*((SCREENWIDTH - 40)/3.0 + 10) , y: 10, width: (SCREENWIDTH - 40)/3.0, height: 50)
                button.tag = i
                button.layer.cornerRadius = 3
                button.layer.borderColor = ramdomColor().cgColor
                button.layer.borderWidth = 1
                button.addTarget(self, action: #selector(diseleDown(btn:)), for: UIControlEvents.touchUpInside)
                self.addSubview(button)
            
            }
            
        
        }else{
        
            let index = array.count % 3
           
            var row = array.count/3
            if(index != 0){
            
                row = row + 1
            
            }
            
            
            var k = 0
            for i in 0..<3{
                for z in 0..<(row - 1) {
                    let button = UIButton.init(type: UIButtonType.custom)
                    button.setTitle(array[k], for: UIControlState.normal)
                    button.setTitleColor(ramdomColor(), for: UIControlState.normal)
                    button.frame = CGRect.init(x: 10 + CGFloat(i)*((SCREENWIDTH - 40)/3.0 + 10) , y: 10 + CGFloat(z) * 60, width: (SCREENWIDTH - 40)/3.0, height: 50)
                    button.tag = k
                    button.layer.cornerRadius = 3
                    button.layer.borderColor = ramdomColor().cgColor
                    button.layer.borderWidth = 1
                    button.addTarget(self, action: #selector(diseleDown(btn:)), for: UIControlEvents.touchUpInside)
                    self.addSubview(button)
                    k += 1
                }
            }
            
            
            for w in 0..<(array.count - (row - 1)*3){
            
                let button = UIButton.init(type: UIButtonType.custom)
                button.setTitle(array[k], for: UIControlState.normal)
                button.setTitleColor(ramdomColor(), for: UIControlState.normal)
                button.frame = CGRect.init(x: 10 + CGFloat(w)*((SCREENWIDTH - 40)/3.0 + 10) , y: 10 + CGFloat(row-1) * 60, width: (SCREENWIDTH - 40)/3.0, height: 50)
                button.tag = k
                button.layer.cornerRadius = 3
                button.layer.borderColor = ramdomColor().cgColor
                button.layer.borderWidth = 1
                button.addTarget(self, action: #selector(diseleDown(btn:)), for: UIControlEvents.touchUpInside)
                self.addSubview(button)
                k += 1

            
            }
            
        }
       
    }
        
    
    
    
    func diseleDown(btn:UIButton)  {
        
        self.CXPDdelegate?.clickBtn(btn: btn)
    }

}
