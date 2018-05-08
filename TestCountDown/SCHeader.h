//
//  Header.h
//  TestCountDown
//
//  Created by Scarlett Che on 2018/5/7.
//  Copyright © 2018年 Scarlett Che. All rights reserved.
//

#ifndef SCHeader_h
#define SCHeader_h

typedef NS_ENUM(NSInteger, SCCountdownLabelStatus) {
    SCCountdownLabelStatusNormal,
    SCCountdownLabelStatusCounting,
    SCCountdownLabelStatusFinished
};

#define kCountDownFinishCountingNotification @"kCountDownFinishCountingNotification"

#endif /* SCHeader_h */
