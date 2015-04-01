//
//  WXMessage.swift
//  WeiXin
//
//  Created by K.Yawn Xoan on 3/31/15.
//  Copyright (c) 2015 KevinHsiun. All rights reserved.
//

import Foundation
//好友消息结构
struct WXMessage {
    
    var body = ""
    var from = ""
    var isComposing = false
    var isDelay = false
    var isMe = false
    
}
//状态结构
struct Zhuangtai {
    var name = ""
    var isOnline = false
    
}