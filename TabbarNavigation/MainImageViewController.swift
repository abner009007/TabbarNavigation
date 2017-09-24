//
//  MainImageViewController.swift
//  TabbarNavigation
//
//  Created by 乐天 on 2017/9/24.
//  Copyright © 2017年 乐天. All rights reserved.
//

import UIKit

class MainImageViewController: BaseViewController {
    
    var abnerImage : UIImageView = UIImageView();
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor .white;
        
        let frame = CGRect(x:0,y:0,width:screen_WIDTH,height:screen_HEIGHT);
        self.abnerImage.frame = frame;
        self.abnerImage.isUserInteractionEnabled = true;
        self.abnerImage.image = UIImage(named:"abner.png");
        self.view.addSubview(self.abnerImage);
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.navigationController?.popViewController(animated: true);
    }

}
