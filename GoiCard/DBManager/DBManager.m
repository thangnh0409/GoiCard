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

static DBManager *shareInstance = nil;

+ (DBManager *)getInstance
{
    if (!shareInstance) {
        @synchronized(self){
            if (!shareInstance) {
                shareInstance = [[DBManager alloc]init];
            }
        }
    }
    return shareInstance;
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

#pragma mark - Get card

/**
 @brief: Get card for study by level 
 @param: level - level use selected in menu
    level = 1 : new card
    level = 2 : don't remember card
 */
- (Card *)getCardByLevel:(int)level
{
    Card *card = [[Card alloc] init];
    sqlite3 *database;
    sqlite3_open([[self getDBPath] UTF8String], &database);
    
    NSString *sql = @"SELECT * FROM cards WHERE ";
    sqlite3_stmt * statement;
    
    int sqlResult = sqlite3_prepare_v2(database, [sql UTF8String], -1, &statement, NULL);
    
    if(sqlResult == SQLITE_OK)
    {
        while(sqlite3_step(statement) == SQLITE_ROW)
        {

        }
    }else{
        printf( "could not prepare statemnt: %s\n", sqlite3_errmsg(database) );
    }
    
    sqlite3_reset(statement);
    sqlite3_finalize(statement);
    
    sqlite3_close(database);
    
    return card;
}


@end
