//
//  Card.h
//  GoiCard
//
//  Created by thangnh on 9/27/14.
//  Copyright (c) 2014 thangnh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic, assign) int cardId;
@property (nonatomic, retain) NSString *wordKanji;
@property (nonatomic, retain) NSString *wordHira;
@property (nonatomic, retain) NSString *meanVi;
@property (nonatomic, assign) int status;
@property (nonatomic, assign) int topicId;

@end
