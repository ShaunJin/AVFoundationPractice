//
//  ViewController.m
//  HelloAVF_Starter
//
//  Created by ShaJin on 2018/3/13.
//  Copyright © 2018年 ShaJin. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()
@property(nonatomic,strong)NSURL *fileURL;
@property(nonatomic,strong)AVAudioPlayer *player;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 播放本地mp3文件 */
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"Promise" withExtension:@"mp3"];
    NSLog(@"url = %@",fileURL.absoluteString);
    
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
    
    if (self.player) {
        [self.player prepareToPlay];
        self.player.numberOfLoops = -1;
        [self.player play];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
