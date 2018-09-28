//
//  ViewController.swift
//  WCDB_demo
//
//  Created by jamesChen on 2018/9/28.
//  Copyright © 2018年 jamesChen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: - 数据库操作
    @IBAction func buttonClick(_ sender: UIButton) {
        
        switch sender.currentTitle {
        case "create":
            let result = WCDBManager.shareInstance().creatDataBase(withName: "message")
            print("%@",(result == true) ? "创建数据库成功":"创建数据库失败")
            break
        case "insert":
            
            let result = WCDBManager.shareInstance().insertMessage()
            print("%@",(result == true) ? "插入数据库成功":"插入数据库失败")
            break
        case "update":
            let result = WCDBManager.shareInstance().updateMessage()
            print("%@",(result == true) ? "修改数据库成功":"修改数据库失败")
            break
        case "selecte":
            
            let array = WCDBManager.shareInstance().selecteMessage()
            print(array ?? "")
            break
        case "delete":
            let result = WCDBManager.shareInstance().deleteMessage()
            print("%@",(result == true) ? "删除数据库成功":"删除数据库失败")
            break
        default:
            break
        }
        
        
    }
}

