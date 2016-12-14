//
//  ViewController.swift
//  friendShip
//
//  Created by 谢鹏翔 on 2016/12/13.
//  Copyright © 2016年 365ime. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView!
    
    var dataArr = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.cyan;        
        
        getData()
        
        tableView = UITableView.init(frame: self.view.bounds)
        
        tableView.backgroundColor = UIColor.lightGray;
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(tableView)
        
    }
    
    func geteData(){
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        let text: String = dataArr.object(at: indexPath.row) as! String
        
        cell?.textLabel?.text = text
        
        return cell!
        
    }
    
    func getData() {
        dataArr = ["1","2","3","4"]
    }
}

