//
//  MainViewController.swift
//  TabbarNavigation
//
//  Created by 乐天 on 2017/9/22.
//  Copyright © 2017年 乐天. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    let titles : NSArray = ["abner是好人",
                            "abner真的是好人",
                            "abner绝对是好人",
                            "abner就是个好人",
                            "abner真的好帅",
                            "abner好有钱",
                            "abner很高",
                            "abner的兰博基尼",
                            "abner的大黄蜂",
                            "abner的存款1000000000000"];
    var myTableView : UITableView?;
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "首页";
        self.view.backgroundColor = UIColor.white;
        
        self.creatUITableView();
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nextViewController = MainImageViewController();
        nextViewController.hidesBottomBarWhenPushed = true;
        self.navigationController?.pushViewController(nextViewController, animated: true);
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath);
        cell.accessoryType = UITableViewCellAccessoryType.none;
        cell.selectionStyle = UITableViewCellSelectionStyle.none;
        cell.textLabel?.text = self.titles[indexPath.row] as? String;
        return cell;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count;
    }
    
    func creatUITableView(){
        
        let frame = CGRect(x:0,y:navigation_HEIGHT,width:screen_WIDTH,height:screen_HEIGHT-tabbar_HEIGHT-navigation_HEIGHT);
        self.myTableView = UITableView(frame:frame,style:UITableViewStyle.plain);
        self.myTableView!.delegate = self;
        self.myTableView!.dataSource = self;
        self.myTableView!.separatorStyle = UITableViewCellSeparatorStyle.singleLine;
        self.myTableView!.register(UITableViewCell.self, forCellReuseIdentifier: "cellid");
        self.view.addSubview(self.myTableView!);
    }

}

