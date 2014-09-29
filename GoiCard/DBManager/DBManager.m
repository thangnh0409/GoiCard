//
//  DBManager.m
//  GoiCard
//
//  Created by thangnh on 9/27/14.
//  Copyright (c) 2014 thangnh. All rights reserved.
//

#import "DBManager.h"

#define DATABASE_NAME @""

@implementation DBManager

static DBManager *instance = NULL;

+ (DBManager *)getInstance
{
    if (instance == nil) {
        @synchronized(self){
            if (instance == nil) {
                instance = [[DBManager alloc]init];
            }
        }
    }
    return instance;
}

#pragma mark Class functions
- (NSString *)getDBPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
	NSString *documentsDir = [paths objectAtIndex:0];
	return [documentsDir stringByAppendingPathComponent:DATABASE_NAME];
}

- (void)copyDatabaseIfNeeded {
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSError *error;
	NSString *dbPath = [self getDBPath];
	BOOL success = [fileManager fileExistsAtPath:dbPath];
	
	if(!success) {
		NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:DATABASE_NAME];
		success = [fileManager copyItemAtPath:defaultDBPath toPath:dbPath error:&error];
		
		if (!success)
			NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
	}
}

#pragma mark - Get Card

/**
 @brief: get card by selected level
 @param:
    level = 1 : no study
    level = 2 : not remember
 */
- (Card *)getCardWithLevel:(int)level
{
    Card *card = [[Card alloc]init];
    sqlite3 *database;
    sqlite3_open([[self getDBPath] UTF8String], &database);
    
    NSString *sql = @"";
    sqlite3_stmt * statement;
    
    int sqlResult = sqlite3_prepare_v2(database, [sql UTF8String], -1, &statement, NULL);
    
    if(sqlResult == SQLITE_OK)
    {
        while(sqlite3_step(statement) == SQLITE_ROW)
        {

        }
    }
    
    sqlite3_reset(statement);
    sqlite3_finalize(statement);
    
    sqlite3_close(database);

    return card;
}
@end
