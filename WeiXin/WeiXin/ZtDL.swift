//
//  ZtDL.swift
//  WeiXin
//
//  Created by K.Yawn Xoan on 3/31/15.
//  Copyright (c) 2015 KevinHsiun. All rights reserved.
//

import Foundation

//状态代理协议
protocol ZtDL {
    func isOn(zt:Zhuangtai)
    func isOff(zt:Zhuangtai)
    func meOff()
}