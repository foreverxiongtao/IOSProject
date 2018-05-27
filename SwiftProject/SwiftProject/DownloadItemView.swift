//
//  DownloadItemView.swift
//  SwiftProject
//
//  Created by xiongtao on 18/5/27.
//  Copyright © 2018年 xiongtao. All rights reserved.
//

import Foundation
import UIKit

 class DownloadItemView :UIView{
    var uiLabel: UILabel!;
    var uiImg: UIImageView!;
    var uiButton: UIButton!;

    
    override init(frame: CGRect) {
        super.init(frame: frame);
        uiImg=UIImageView();
        uiImg.frame=CGRectMake(15, 0, 45, 45)
        self.addSubview(uiImg);
        
        uiLabel=UILabel();
        let labelFrame=CGRectMake(0,47, self.frame.width, 10);
        uiLabel.textAlignment = .Center;
        uiLabel.textColor=UIColor.blueColor()
        uiLabel.font=UIFont.systemFontOfSize(12)
        uiLabel.frame=labelFrame;
        self.addSubview(uiLabel);
        
        
        self.uiButton=UIButton();
        uiButton.setTitle("下载", forState: UIControlState.Normal);
        uiButton.frame=CGRectMake(0, 59, self.frame.width, 10);
        uiButton.titleLabel?.font=UIFont.systemFontOfSize(12);
        uiButton.titleLabel?.textColor=UIColor.yellowColor();
        uiButton.setTitle("下载中", forState: UIControlState.Highlighted);
        uiButton.titleLabel?.textAlignment = .Center;
        uiButton.setTitleColor(UIColor.greenColor(), forState: UIControlState.Highlighted);
        uiButton.addTarget(self, action: Selector("download:"), forControlEvents: UIControlEvents.TouchUpInside);
        self.addSubview(uiButton);
        self.backgroundColor=UIColor.redColor();
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title:String){
        uiLabel.text=title;
    }
    
    func setImg(_ img:String){
    }
    
    func setData(_ item:DownloadItem){
        self.uiLabel.text=item.desc;
        print(item.desc!)
        print(item.image!);
        self.uiImg.image=UIImage(named: item.image!);
    
    }
    
    func download(sender:UIButton){
        print("下载了......")
        
        UIAlertView();
    }

}