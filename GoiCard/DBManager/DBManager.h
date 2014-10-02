//
//  DBManager.h
//  GoiCard
//
//  Created by thangnh on 9/27/14.
//  Copyright (c) 2014 thangnh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Card.h"


@interface DBManager : NSObject

+ (DBManager *)getInstance;
- (Card *)getCardWithLevel:(int)level;
- (BOOL)addCard:(Card *)card;

@end
