//
//  THSpeechController.m
//  HelloAVF_Starter
//
//  Created by ShaJin on 2018/3/13.
//  Copyright © 2018年 ShaJin. All rights reserved.
//
// 文字转语音示例
#import "THSpeechController.h"

@interface THSpeechController()<AVSpeechSynthesizerDelegate>
@property(nonatomic,strong)AVSpeechSynthesizer *synthesizer;
@property(nonatomic,strong)NSArray *voices;
@property(nonatomic,strong)NSArray *speechStrings;
@end

@implementation THSpeechController

+(instancetype)speechController{
    return [[self alloc] init];
}

-(id)init{
    self = [super init];
    if (self) {
        _synthesizer = [[AVSpeechSynthesizer alloc] init];
        _synthesizer.delegate = self;
        _voices = @[[AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"],[AVSpeechSynthesisVoice voiceWithLanguage:@"en-GB"]];
        _speechStrings = [self buildSpeechStrings];
    }
    return self;
}

-(NSArray *)buildSpeechStrings{
    return @[@"Hello AVFoundation. How are you?",
             @"I'm well! Thanks for asking.",
             @"Are you excited about the book?",
             @"Very! I have always felt so misunderstood",
             @"What's your favorite feature?",
             @"Oh, they're all my babies. I couldn't possibyly choose.",
             @"It was great to speak with you!",
             @"The pleasure was all mine! Have fun!"];
}

-(void)beginConversation{
    for (NSUInteger i = 0 ; i < self.speechStrings.count; i++) {
        AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:self.speechStrings[i]];
        utterance.voice = self.voices[i % 2];
        utterance.rate = 0.4;
        utterance.pitchMultiplier = 0.8;
        utterance.postUtteranceDelay = 0.1;
        [self.synthesizer speakUtterance:utterance];
    }
}

@end
