//
//  AudioPlayerViewController.m
//  CBExampleAPI
//
//  Created by xychen on 15-1-8.
//  Copyright (c) 2015年 CB. All rights reserved.
//

#import "AudioPlayerViewController.h"

#import <AVFoundation/AVFoundation.h>

@interface AudioPlayerViewController ()
{
    AVAudioPlayer *_audioPlayer;
    NSTimer *_timerVoice;
    float _audioVolume;
}

@end

@implementation AudioPlayerViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.btnPlay addTarget:self action:@selector(playAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.btnStop addTarget:self action:@selector(stopAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [_timerVoice invalidate];
    _timerVoice = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(musicFadeOut) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ButtonAction
- (IBAction)playAction:(id)sender
{
    if (!_audioPlayer)
    {
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"我们去探险吧" ofType:@"mp3"]];
        
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        _audioPlayer.numberOfLoops = -1;// 无限循环
    }
    
    if (![_audioPlayer isPlaying])
    {
        [_audioPlayer play];
        
        _audioVolume = _audioPlayer.volume;
        _audioPlayer.volume = 0;
        
        [_timerVoice invalidate];
        _timerVoice = [NSTimer scheduledTimerWithTimeInterval:0.25 target:self selector:@selector(musicFadeIn) userInfo:nil repeats:YES];
    }
}

- (IBAction)stopAction:(id)sender
{
    [_timerVoice invalidate];
    _timerVoice = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(musicFadeOut) userInfo:nil repeats:YES];
}

#pragma mark - Custom Method
// 播放淡入
- (void)musicFadeIn
{
    NSLog(@"加一次声音");
    _audioPlayer.volume += 0.1;
    
    if (_audioPlayer.volume >= _audioVolume)
    {
        [_timerVoice invalidate];
        NSLog(@"关闭定时器");
    }
}

// 暂停淡出
- (void)musicFadeOut
{
    NSLog(@"减一次声音");
    _audioPlayer.volume -= 0.1;
    
    if (_audioPlayer.volume <= 0.0)
    {
        [_timerVoice invalidate];
        NSLog(@"关闭定时器");
        
        [_audioPlayer stop];
        _audioPlayer = nil;
    }
}

@end
