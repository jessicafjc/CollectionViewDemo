//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by JiachenFu on 2019/8/26.
//  Copyright © 2019 Foxconn. All rights reserved.
//

import UIKit
//CollectionView与TableView使用方法相似
class ViewController:UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    //模拟生肖数据，数组内的元素对应Assets内的m每一张图片名
    var items = ["动物 老鼠","动物 牛","动物 老虎","动物 兔子","动物 龙","动物 蛇","动物 马","动物 羊","动物 猴","动物 鸡","动物 狗","动物 猪"]
    //如果内容过多，会自动生成滚动条进行滚动
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionItem", for: indexPath)
        //通过数组下标，显示对应的cell内容
        let item = items[indexPath.row]
        //通过storyboard中的tag值获取cell中的控件UILabel和UIImageView
        let label = collectionCell.viewWithTag(1001) as! UILabel
        //将对应的内容赋值给label的文本内容
        label.text = item
        let imageView = collectionCell.viewWithTag(1002) as! UIImageView
        //将对应的内容赋值给UIImageView中图片的名字（注意图片名称要准确，如果不是png格式需要写出指出扩展名）
        imageView.image = UIImage(named: item)
        return collectionCell
    }
    //点击事件
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //添加动画效果
        collectionView.deselectItem(at: indexPath, animated: true)
        let item = items[indexPath.row]
        //打印点击的collectionCell名字
        print("你点击了" + item)
        //通过storyboardID获取视图
        let DetialVC = storyboard?.instantiateViewController(withIdentifier: "DetailStoryBoardID") as! DetailViewController
        //正向传值给DetailViewController内的变量text
        DetialVC.text = item
        //跳转页面
        self.present(DetialVC, animated: true, completion: nil)
        
    }
    
    
    
}

