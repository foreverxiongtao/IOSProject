//
//  ViewController.swift
//  SwiftProject
//
//  Created by xiongtao on 18/5/27.
//  Copyright © 2018年 xiongtao. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    var datas: [DownloadItem]=[];
    
    func getDownloadItem()->[DownloadItem]{
        if datas.count==0{
            let path:String?=NSBundle.mainBundle().pathForResource("data.plist", ofType: nil);
            let webs:NSArray? = NSArray(contentsOfFile:path!);
            if let tem=webs{
                NSLog("webs.count parse success %d",tem.count);
                let count=tem.count;
                for item in (0..<count){
                    let dic=tem[item];
                    let img=dic.objectForKey("img")as! String;
                    let desc=dic.objectForKey("desc") as! String;
                    let download=DownloadItem(img,desc);
                    datas.append(download);
                }
                
            }
            else{
                NSLog("webs.count parse failure");
            }
        }
        
        return datas;
    }
    

    override func viewDidLoad() {
        super.viewDidLoad();
        let test:[DownloadItem]=getDownloadItem();
        let downloadItemView=DownloadItemView(frame: CGRectMake(100,200,75,75));
        downloadItemView.setData(self.datas[0]);
        self.view.addSubview(downloadItemView);
        print(test.count);
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

