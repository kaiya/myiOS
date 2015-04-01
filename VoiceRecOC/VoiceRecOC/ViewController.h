//
//  ViewController.h
//  VoiceRecOC
//
//  Created by K.Yawn Xoan on 4/1/15.
//  Copyright (c) 2015 KevinHsiun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iflyMSC/IFlySpeechSynthesizerDelegate.h"

//引入语音合成类
@class IFlySpeechSynthesizer;
@class IFlyDataUploader;
//注意要添加语音合成代理

@interface ViewController : UIViewController<IFlySpeechSynthesizerDelegate>
//声明语音合成的对象
@property (nonatomic,strong) IFlySpeechSynthesizer *iFlySpeechSynthesizer;
@property (strong,nonatomic) IBOutlet UITextField *content;

- ( IBAction)Start:(id)sender;


@end

