//
//  ViewController.swift
//  CXPullDownMun
//
//  Created by MyMac on 2017/3/7.
//  Copyright © 2017年 Allen. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,CXPDBtnDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brown
        
        let btn = CXPullDownBtn()
        let no_image = UIImage.init(named: "ico_check_nomal")
        let se_image = UIImage.init(named: "ico_check_select")
        
        btn.frame = CGRect.init(x: 0, y: 0, width: 80, height: 30)
        btn.CXPDBtnDelegate = self
        btn.setTitle("拉拉拉", for: UIControlState.normal)
        self.navigationItem.titleView = btn
        let array = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
        btn.initBtn(array: array, view: self.view, no_image: no_image!, se_image: se_image!)
        
        
    }
    func clickViewBtn(btn: UIButton) {
        print(btn.tag)
    }

}

