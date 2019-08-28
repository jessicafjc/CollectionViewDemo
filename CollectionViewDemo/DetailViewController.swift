//
//  DetailViewController.swift
//  CollectionViewDemo
//
//  Created by JiachenFu on 2019/8/26.
//  Copyright © 2019 Foxconn. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    var text:String?    //用于接收正向传值
    override func viewDidLoad() {
        super.viewDidLoad()
        //将接收到的值赋给label
        textLabel.text = text!
        
        //纯代码写一个Button
        //1.声明一个UIButton实例并确定其名称“backButton”和屏幕的位置X/Y以及大小width/height
        let backButton = UIButton(frame: CGRect(x: 30, y: 60, width: 100, height: 80))
        //2.设置按钮的文字内容/颜色（如需设置背景图片、背景a颜色可自行查阅文档）
        backButton.setTitle("返回上一页", for: .normal)
        backButton.setTitleColor(UIColor.red, for: .normal)
        //3.设置无参数点击事件（有参数的查阅相关文档）
        backButton.addTarget(self, action: #selector(backClick), for: .touchUpInside)
        //4. 将按钮加载到页面上（必须有）
        self.view.addSubview(backButton)

    }
    @objc func backClick(){
        dismiss(animated: true, completion: nil)
    }

}
