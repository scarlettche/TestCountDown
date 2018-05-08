//
//  SCCountdownButton.h
//  TestCountDown
//
//  Created by Scarlett Che on 2018/5/7.
//  Copyright © 2018年 Scarlett Che. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCCountdownButton : UIButton
@property (nonatomic, assign) SCCountdownLabelStatus    status;

- (void)setTotalInterval:(NSTimeInterval)interval formatter:(NSAttributedString *)attrFormatter forState:(UIControlState)state;

@end
