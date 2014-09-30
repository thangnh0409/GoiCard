//
//  DBManager.h
//  GoiCard
//
//  Created by thangnh on 9/27/14.
//  Copyright (c) 2014 thangnh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import <sqlite3.h>

@interface DBManager : NSObject

+ (DBManager *)getInstance;
- (Card *)getCardByLevel:(int)level;

@end
