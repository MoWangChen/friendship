//
//  ViewController.swift
//  friendShip
//
//  Created by 谢鹏翔 on 2016/12/13.
//  Copyright © 2016年 365ime. All rights reserved.
//

import UIKit

let cellHeight: CGFloat = 46.0

let screenWidth:CGFloat = UIScreen.main.bounds.size.width

let screenHeight: CGFloat = UIScreen.main.bounds.size.height

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView!
    
    var dataArr = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .cyan;
        
        getData()
        
        tableView = UITableView.init(frame: self.view.bounds)
        
        tableView.backgroundColor = .lightGray;
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        tableView.tableHeaderView = tableHeaderView()
        
        tableView.tableFooterView = UIView.init()
        
        tableView.separatorStyle = .none
        
        tableView.register(TTSeparateCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(tableView)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: TTSeparateCell
        
        cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TTSeparateCell
        
        let dic: NSDictionary = dataArr[indexPath.row] as! NSDictionary
        
        cell.setModel(model: dic)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return cellHeight
    }
    
    func getData() {
        
        dataArr = [["title":"艾教育号","detail":"568869-766"],
                   ["title":"新密码","detail":"请输入新的密码"],
                   ["title":"确认密码","detail":"请输入新的密码"]]
    }
    
    func tableHeaderView() -> UIView {
        
        let labelFrame = CGRect.init(x: 0, y: 0, width: screenWidth, height: 60)
        
        let label: UILabel = UILabel.init(frame: labelFrame)
        
        label.backgroundColor = UIColor.cyan
        
        label.text = "设置新的登录密码"
        
        label.font = UIFont.systemFont(ofSize: 14)
        
        label.textColor = UIColor.darkGray
        
        label.textAlignment = NSTextAlignment.center
        
        return label
    }
}

class TTSeparateCell: UITableViewCell {
    
    var separateLine: UIView
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        
        separateLine = UIView.init(frame: CGRect.init(x: 0.0, y: cellHeight-1, width: screenWidth, height: 0.5))
        
        separateLine.backgroundColor = UIColor.purple
        
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        self.contentView.addSubview(separateLine)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setModel(model: NSDictionary) -> () {
        
        let title: String = model.object(forKey: "title") as! String
        
        let detail: String = model.object(forKey: "detail") as! String
        
        self.textLabel?.text = title
        
        self.textLabel?.font = UIFont.systemFont(ofSize: 17)
        
        self.detailTextLabel?.text = detail
        
        self.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
    }
    
}


