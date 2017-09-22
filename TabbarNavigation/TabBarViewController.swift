//
//  TabBarViewController.swift
//  TabbarNavigation
//
//  Created by 乐天 on 2017/9/22.
//  Copyright © 2017年 乐天. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let titles : NSArray = ["首页","订单","历史","我的"];
    
    let imagesSelected : NSArray = ["common_tabBar_carowner_sel",
                                    "common_tabBar_findCar_sel",
                                    "common_tabBar_journey_sel",
                                    "common_tabBar_profile_sel"];
    
    let imagesNormal : NSArray = ["common_tabBar_carowner",
                                  "common_tabBar_findCar",
                                  "common_tabBar_journey",
                                  "common_tabBar_profile"];
    
    let controllers  = [MainViewController(),
                        OrdersViewController(),
                        HistoryViewController(),
                        PersonalViewController()];
    
    var navigationControllers : [NSObject] = [];
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.CreatMyTabbar();
    }

    func CreatMyTabbar() {
        
        for indexCount in 0..<self.controllers.count{
            
            let navigationController = UINavigationController(rootViewController:self.controllers[indexCount]);
            navigationController.tabBarItem.title = self.titles[indexCount] as? String;
            navigationController.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.font : UIFont.systemFont(ofSize: 13)], for: .normal);
            navigationController.tabBarItem.image = UIImage.init(named: self.imagesNormal[indexCount] as! String);
            navigationController.tabBarItem.selectedImage = UIImage.init(named: self.imagesSelected[indexCount] as! String)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
            self.navigationControllers.append(navigationController);
        }
        
        self.viewControllers = (self.navigationControllers as! [UIViewController] as NSArray) as! [BaseViewController];
        self.tabBar.backgroundColor = UIColor.white;
        self.tabBar.isTranslucent = false;
        self.tabBar.tintColor = UIColor.red;
        self.selectedIndex = 0;
    }
    
}
