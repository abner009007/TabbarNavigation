//
//  OrdersViewController.swift
//  TabbarNavigation
//
//  Created by 乐天 on 2017/9/22.
//  Copyright © 2017年 乐天. All rights reserved.
//

import UIKit

class OrdersViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    var myTableView : UITableView?;
    var heaterTitles : [String]?;
    var cellTitles : Dictionary<Int,[String]>?;

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "订单列表";
        self.view.backgroundColor = UIColor.red;
        
        self.cellTitles = [
            0:[String](["UILabel 标签","UITextField 文本框","UIButton 按钮"]),
            1:[String](["UIDatePiker 日期选择器","UIToolbar 工具条","UITableView 表格视图","UIButton 按钮"])
        ];
        
        self.heaterTitles = [
            "abner1",
            "abner2",
        ];
        
        let frame : CGRect = CGRect(x:0,y:navigation_HEIGHT,width:screen_WIDTH,height:screen_HEIGHT-tabbar_HEIGHT-navigation_HEIGHT);
        self.myTableView = UITableView(frame:frame,style:UITableViewStyle.grouped);
        self.myTableView!.delegate = self;
        self.myTableView!.dataSource = self;
        self.myTableView!.sectionHeaderHeight = 30.00;
        self.myTableView!.tableFooterView = nil;
        self.myTableView!.sectionFooterHeight = 0.00;
        self.myTableView!.register(UITableViewCell.self, forCellReuseIdentifier:"cellIdentifier");
        self.view.addSubview(self.myTableView!);
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let farme = CGRect(x:0,y:0,width:screen_WIDTH,height:30);
        
        let headerLabel = UILabel();
        headerLabel.frame = farme;
        headerLabel.backgroundColor = UIColor.red;
        headerLabel.text = self.heaterTitles?[section];
        return headerLabel;
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.heaterTitles!.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let rows = self.cellTitles![section];
        return rows!.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //为了提供表格显示性能，已创建完成的单元需重复使用
        let cellIdentifier : String = "cellIdentifier";
        let sectionIndex : Int = indexPath.section;
        let titleArray  = self.cellTitles![sectionIndex];
        
        
        if sectionIndex==0
        {
            //同一形式的单元格重复使用，在声明时已注册
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath);
            cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator;
            cell.textLabel?.text = titleArray?[indexPath.row];
            return cell;
        }
        else
        {
            //第二个分组表格使用详细标签
            let adCell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
            adCell.textLabel?.text = titleArray![indexPath.row]
            adCell.detailTextLabel?.text = "这是\(titleArray![indexPath.row])的说明"
            return adCell;
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true);
        let itemString = self.cellTitles![indexPath.section]![indexPath.row];
        let alertController = UIAlertController(title:"提示",message: "你选中了【\(itemString)】",preferredStyle: .alert);
        let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil);
        alertController.addAction(cancelAction);
        self.present(alertController, animated: true, completion: nil);
    }

}
