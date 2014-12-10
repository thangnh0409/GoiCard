//
//  Constant.h
//  GoiCard
//
//  Created by thangnh on 12/5/14.
//  Copyright (c) 2014 thangnh. All rights reserved.
//

#ifndef GoiCard_Constant_h
#define GoiCard_Constant_h

/**
 @brief: update card status
 level = 1 : chua hoc
 level = 2 : chua thuoc
 level = 3 : da thuoc
 */

typedef enum {
    NONE,
    NOT_STUDY,
    NOT_REMEMBER,
    REMEMBER
} LEVEL;

#define TIME_SETTING        @"TimeSetting"
#define NUM_WORD_SETTING    @"WordSetting"
#endif
