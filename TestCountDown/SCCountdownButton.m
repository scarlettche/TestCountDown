//
//  SCCountdownButton.m
//  TestCountDown
//
//  Created by Scarlett Che on 2018/5/7.
//  Copyright © 2018年 Scarlett Che. All rights reserved.
//

#import "SCCountdownButton.h"
#import "YYWeakProxy.h"
#import "SCHeader.h"

@interface SCCountdownButton ()
@property (nonatomic, copy) NSAttributedString   *attrFormatter;
@property (nonatomic, copy) NSString *formatter;
@property (nonatomic, assign) NSTimeInterval    startTimeIntervalSince1970;

@property (nonatomic, assign) UIControlState    controlState;
@property (nonatomic, assign) NSTimeInterval    totalInterval;

@property (nonatomic, strong) NSTimer   *timer;

@end

@implementation SCCountdownButton
- (void)setTotalInterval:(NSTimeInterval)interval formatter:(NSAttributedString *)attrFormatter forState:(UIControlState)state {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    
    self.controlState = state;
    self.startTimeIntervalSince1970 = [NSDate date].timeIntervalSince1970;
    self.totalInterval = interval;
    self.attrFormatter = attrFormatter;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:[YYWeakProxy proxyWithTarget:self] selector:@selector(didChangeTimer:) userInfo:nil repeats:YES];
}

- (void)didChangeTimer:(NSTimer *)timer {
    double pastTime = [NSDate date].timeIntervalSince1970 - self.startTimeIntervalSince1970;
    
    double interval = _totalInterval - pastTime;
    if (interval < 0) {
        [_timer invalidate];
        _timer = nil;
        
        self.status = SCCountdownLabelStatusFinished;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kCountDownFinishCountingNotification object:nil];
        return;
    }
    
    NSInteger day = interval / (24*3600);
    NSInteger h = fmod(interval, 24 * 3600) / 3600;
    NSInteger m = fmod(interval, 3600) / 60;
    NSInteger s = fmod(interval, 60);
    
    NSString *text = nil;
    if (self.attrFormatter.length > 0) {
        text = self.attrFormatter.string;
    } else if (self.formatter.length > 0) {
        text = self.formatter;
    }
    
    text = [text stringByReplacingOccurrencesOfString:@"ss" withString:@(s).stringValue];
    text = [text stringByReplacingOccurrencesOfString:@"dd" withString:@(day).stringValue];
    text = [text stringByReplacingOccurrencesOfString:@"HH" withString:@(h).stringValue];
    text = [text stringByReplacingOccurrencesOfString:@"hh" withString:@(h).stringValue];
    text = [text stringByReplacingOccurrencesOfString:@"mm" withString:@(m).stringValue];
    
    if (self.attrFormatter.length > 0) {
        [self setAttributedTitle:self.attrFormatter forState:self.state];
    } else if (self.formatter.length > 0) {
        [self setTitle:self.formatter forState:self.state];
    }
}

@end
