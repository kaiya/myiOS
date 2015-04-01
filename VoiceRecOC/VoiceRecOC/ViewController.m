//
//  ViewController.m
//  VoiceRecOC
//
//  Created by K.Yawn Xoan on 4/1/15.
//  Copyright (c) 2015 KevinHsiun. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVAudioSession.h>
#import <AudioToolbox/AudioSession.h>
#import "iflyMSC/IFlySpeechConstant.h"
#import "iflyMSC/IFlySpeechUtility.h"
#import "iflyMSC/IFlySpeechSynthesizer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSString *initString = [[NSString alloc]initWithFormat:@"appid=%@,timeout=%@",@"54ffd80a",@"5000"];
    //所有服务启动前，需要确保执行createutility
    [IFlySpeechUtility createUtility:initString];
    
    //创建合成对象，为单例模式
    _iFlySpeechSynthesizer = [IFlySpeechSynthesizer sharedInstance];
    _iFlySpeechSynthesizer.delegate = self;
    //设置语音合成的参数
    //合成的语速，取值范围0-100
    [_iFlySpeechSynthesizer setParameter:@"50" forKey:[IFlySpeechConstant SPEED]];
    //合成的音量：取值范围0-100
    [_iFlySpeechSynthesizer setParameter:@"50" forKey:[IFlySpeechConstant VOLUME]];
    //发音人，默认为“xiaoyuan” ；可以设置的参数可以参考个性化发音人列表
    [_iFlySpeechSynthesizer setParameter:@"xiaoyuan" forKey:[IFlySpeechConstant VOICE_NAME]];
    //音频采样率，目前支持的采样率有16000 和8000
    [_iFlySpeechSynthesizer setParameter:@"8000" forKey:[IFlySpeechConstant SAMPLE_RATE]];
    //asr_audio_path保存录音文件路径，如不再需要，设置value为nil表示取消，默认目录是documents
    [_iFlySpeechSynthesizer setParameter:@"tts.pcm" forKey:[IFlySpeechConstant TTS_AUDIO_PATH]];
    
    
    //隐藏键盘，点击空白处
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTapped:)];
    tapGr.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGr];
    
    
}

- (void)viewTapped:(UITapGestureRecognizer *)tapGr{
    [self.content resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Start:(id)sender{
    //启动合成会话
    [_iFlySpeechSynthesizer startSpeaking:self.content.text];
    
}

#pragma mark - IFlySpeechSynthesizerDelegate
//开始播放
- (void) onSpeakBegin{
    
}
//缓冲进度
-(void) onBufferProgress:(int)progress message:(NSString *)msg{
    NSLog(@"bufferProgress:%d,message:%@",progress,msg);
}
//播放进度
-(void) onSpeakProgress:(int)progress{
    NSLog(@"play progress:%d",progress);
    
}
//暂停播放
-(void) onSpeakPaused{
    
}

//恢复播放
-(void) onSpeakResumed{
    
}

//结束回调
-(void) onCompleted:(IFlySpeechError *)error{
    
}

@end









