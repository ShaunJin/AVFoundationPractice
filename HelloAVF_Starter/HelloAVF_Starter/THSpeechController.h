//
//  THSpeechController.h
//  HelloAVF_Starter
//
//  Created by ShaJin on 2018/3/13.
//  Copyright © 2018年 ShaJin. All rights reserved.
//
// 文字转语音示例
#import <AVFoundation/AVFoundation.h>
@interface THSpeechController : NSObject
@property(nonatomic,strong,readonly)AVSpeechSynthesizer *synthesizer;

+(instancetype)speechController;

-(void)beginConversation;

@end
