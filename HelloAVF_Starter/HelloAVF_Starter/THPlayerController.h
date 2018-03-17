//
//  THPlayerController.h
//  HelloAVF_Starter
//
//  Created by ShaJin on 2018/3/15.
//  Copyright © 2018年 ShaJin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface THPlayerController : NSObject

@property(nonatomic,readonly,getter=isPlaying) BOOL playing;

// Global methods
-(void)play;
-(void)stop;
-(void)adjustRate:(float)rate;
// Player-specific methods
-(void)adjustPan:(float)pan forPlayerAtIndex:(NSUInteger)index;
-(void)adjustVolume:(float)volume forPlayerAtIndex:(NSUInteger)index;
@end
