//
//  SCCountdownLabel.m
//  TestCountDown
//
//  Created by Scarlett Che on 2018/5/7.
//  Copyright © 2018年 Scarlett Che. All rights reserved.
//

#import "SCCountdownLabel.h"
#import "YYWeakProxy.h"

@interface SCCountdownLabel ()
@property (nonatomic, assign) NSTimeInterval    startTimeIntervalSince1970;
@property (nonatomic, assign) NSTimeInterval    totalInterval;

@property (nonatomic, strong) NSTimer   *timer;
@end

@implementation SCCountdownLabel
- (instancetype)initWithTotalInterval:(NSTimeInterval)total dateformatter:(NSString *)dateFormatter {
    if (self = [super init]) {
        [self setupTotalInterval:total dateformatter:dateFormatter];
    }
    return self;
}

- (void)setupTotalInterval:(NSTimeInterval)total dateformatter:(NSString *)dateFormatter {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    
    self.startTimeIntervalSince1970 = [NSDate date].timeIntervalSince1970;
    self.totalInterval = total;
    self.text = self.normalText;
    self.countDownFormatter = dateFormatter;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:[YYWeakProxy proxyWithTarget:self] selector:@selector(didChangeTimer:) userInfo:nil repeats:YES];
}

- (void)didChangeTimer:(NSTimer *)timer {
    double pastTime = [NSDate date].timeIntervalSince1970 - self.startTimeIntervalSince1970;
    
    double interval = _totalInterval - pastTime;
    if (interval < 0) {
        [_timer invalidate];
        _timer = nil;
        
        self.status = SCCountdownLabelStatusFinished;
        self.text = self.finishedText;
        return;
    }
    
    NSInteger day = interval / (24*3600);
    NSInteger h = fmod(interval, 24 * 3600) / 3600;
    NSInteger m = fmod(interval, 3600) / 60;
    NSInteger s = fmod(interval, 60);
    
    NSString *text = self.countDownFormatter;
    text = [text stringByReplacingOccurrencesOfString:@"ss" withString:@(s).stringValue];
    text = [text stringByReplacingOccurrencesOfString:@"dd" withString:@(day).stringValue];
    text = [text stringByReplacingOccurrencesOfString:@"HH" withString:@(h).stringValue];
    text = [text stringByReplacingOccurrencesOfString:@"hh" withString:@(h).stringValue];
    text = [text stringByReplacingOccurrencesOfString:@"mm" withString:@(m).stringValue];
    self.text = text;
}

@end
