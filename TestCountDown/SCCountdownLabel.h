//
//  SCCountdownLabel.h
//  TestCountDown
//
//  Created by Scarlett Che on 2018/5/7.
//  Copyright © 2018年 Scarlett Che. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCHeader.h"

@interface SCCountdownLabel : UILabel
@property (nonatomic, assign) SCCountdownLabelStatus    status;

@property (nonatomic, copy, readonly) NSString        *normalText;
@property (nonatomic, copy, readonly) NSString        *finishedText;
@property (nonatomic, copy) NSString        *countDownFormatter;

@property (nonatomic, copy) NSString    *normalColor;
@property (nonatomic, copy) NSString    *countingColor;
@property (nonatomic, copy) NSString    *finishColor;

- (instancetype)initWithTotalInterval:(NSTimeInterval)total dateformatter:(NSString *)dateFormatter;

- (void)setupTotalInterval:(NSTimeInterval)total dateformatter:(NSString *)dateFormatter;

@end
