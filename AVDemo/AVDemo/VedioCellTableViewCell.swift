//
//  VedioCellTableViewCell.swift
//  AVDemo
//
//  Created by 陈乐杰 on 2018/10/11.
//  Copyright © 2018年 nst. All rights reserved.
//

import UIKit

struct video {
    let image : String
    let title : String
    let source : String

    
}

class VedioCellTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitleLable: UILabel!
    @IBOutlet weak var cellSourceLable: UILabel!
    
    //创建闭包
    typealias swiftBlock = () -> Void
    //定义闭包实例
    var callBack: swiftBlock?
    //给控制器回调的方法
    func callBackBlock(block: @escaping () -> Void) {
        //将控制器赋值回调的闭包赋值给定义的闭包
        callBack = block
    }
    //点击按钮执行回调
    @IBAction func backBtn(_ sender: Any) {
        //判断控制器是否传入了闭包
        if callBack != nil {
            //强制解析并执行闭包
            callBack!()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
