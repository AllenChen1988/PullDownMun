//
//  CXPullDownBtn.swift
//  test
//
//  Created by MyMac on 2017/3/6.
//  Copyright © 2017年 Allen. All rights reserved.
//

import UIKit

protocol CXPDBtnDelegate {
    func clickViewBtn(btn:UIButton)
}

class CXPullDownBtn: UIButton ,CXpullDownDelegate{

    var touch:Bool = false
    
    var CXPDBtnDelegate : CXPDBtnDelegate?
    var PDview: CXpullDownView? = nil
    var view : UIView! = nil
    var array:[NSString]! = nil
    func initBtn(array:[String],view:UIView,no_image:UIImage,se_image:UIImage) {
        
        self.view = view
        self.array = array as [NSString]!
        self.setImage(no_image, for: UIControlState.normal)
        self.setImage(se_image, for: UIControlState.selected)
        self.addTarget(self, action: #selector(clickSelf), for: UIControlEvents.touchUpInside)
    }
    
    func clickBtn(btn: UIButton) {
        
        self.CXPDBtnDelegate?.clickViewBtn(btn: btn)
        self.clickSelf()
    }
    
    func clickSelf() {
        
        
        if(!touch){
            self.isSelected = true
            self.view.addSubview(self.PDview1)
            
        }else{
            
            self.isSelected = false
            PDview?.removeFromSuperview()
            PDview = nil

        }
        
        touch = !touch
        
    }
    
    func disAppear() {
        if(!touch){
            self.isSelected = true
            self.view.addSubview(self.PDview1)
        }else{
            self.isSelected = false
            PDview?.removeFromSuperview()
            PDview = nil
        }
        
        touch = !touch
    }
    
    
    var PDview1:CXpullDownView{
    
        get{
        
            if(self.PDview == nil)
            {
                self.PDview = CXpullDownView()
                self.PDview?.initView(array: self.array as [String])
                self.PDview?.CXPDdelegate = self
                let tap = UITapGestureRecognizer.init(target: self, action: #selector(disAppear))
                self.PDview?.addGestureRecognizer(tap)
            }
            return (self.PDview)!
        }
        
        set{
        
            self.PDview = newValue
        }
    
    }
}
