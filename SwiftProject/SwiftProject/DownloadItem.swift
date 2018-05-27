//
//  DownloadItem.swift
//  SwiftProject
//
//  Created by xiongtao on 18/5/27.
//  Copyright © 2018年 xiongtao. All rights reserved.
//

import Foundation
public class DownloadItem{
    var image: String?;
    var desc: String?;
    init(_ image: String?,_ desc:  String?){
        NSLog("DownloadItem init");
        self.image=image;
        self.desc=desc
    }
}
