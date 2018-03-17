//
//  THPlayerController.m
//  HelloAVF_Starter
//
//  Created by ShaJin on 2018/3/15.
//  Copyright © 2018年 ShaJin. All rights reserved.
//

#import "THPlayerController.h"
#import <AVFoundation/AVFoundation.h>
@interface THPlayerController()
@property(nonatomic,strong)NSArray *players;
@property(nonatomic)BOOL playing;
@end

@implementation THPlayerController
-(void)play{
    if (!self.playing) {
        NSTimeInterval delayTime = [self.players[0] deviceCurrentTime] + 0.01;
        for (AVAudioPlayer *player in self.players) {
            [player playAtTime:delayTime];
        }
        self.playing = YES;
    }
}
-(void)stop{
    if (self.playing) {
        for (AVAudioPlayer *player in self.players) {
            [player stop];
            player.currentTime = 0.0f;
        }
        self.playing = NO;
    }
}
-(void)adjustRate:(float)rate{
    for (AVAudioPlayer *player in self.players) {
        player.rate = rate;
    }
}
-(void)adjustPan:(float)pan forPlayerAtIndex:(NSUInteger)index{
    if ([self isValidIndex:index]) {
        AVAudioPlayer *player = self.players[index];
        player.pan = pan;
    }
}
-(void)adjustVolume:(float)volume forPlayerAtIndex:(NSUInteger)index{
    if ([self isValidIndex:index]) {
        AVAudioPlayer *player = self.players[index];
        player.volume = volume;
    }
}
-(BOOL)isValidIndex:(NSUInteger)index{
    return index == 0 || index < self.players.count;
}
-(instancetype)init{
    if (self = [super init]) {
        AVAudioPlayer *guitarPlayer = [self playerForFile:@"guitar"];
        
        AVAudioPlayer *bassPlayer = [self playerForFile:@"bass"];
        
        AVAudioPlayer *drumsPlayer = [self playerForFile:@"drums"];
        
        _players = @[guitarPlayer,bassPlayer,drumsPlayer];
    }
    return self;
}

-(AVAudioPlayer *)playerForFile:(NSString *)name{
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:name withExtension:@"caf"];
    NSError *error;
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:&error];
    
    if (player) {
        player.numberOfLoops = -1;
        player.enableRate = YES;
        [player prepareToPlay];
    }else{
        NSLog(@"Error creating player : %@",[error localizedDescription]);
    }
    return player;
}
@end
