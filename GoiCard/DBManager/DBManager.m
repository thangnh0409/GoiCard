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

#pragma mark - Card

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
    
    NSString *sql = [NSString stringWithFormat:@"SELECT c.cardId, c.word_kanji, c.word_hira, c.mean_vi, ex.example FROM card c JOIN word_example ex ON c.cardId = ex.cardId WHERE c.status = %d", level];
    sqlite3_stmt * statement;
    
    int sqlResult = sqlite3_prepare_v2(database, [sql UTF8String], -1, &statement, NULL);
    
    if(sqlResult == SQLITE_OK)
    {
        while(sqlite3_step(statement) == SQLITE_ROW)
        {
            card.cardId = (int)sqlite3_column_int(statement, 0);
            char *word = (char*)sqlite3_column_text(statement, 1);
            card.wordKanji = [NSString stringWithUTF8String:word];
            char *word2 = (char*)sqlite3_column_text(statement, 2);
            card.wordHira = [NSString stringWithUTF8String:word2];
            char *meanChr = (char*)sqlite3_column_text(statement, 3);
            card.meanVi = [NSString stringWithUTF8String:meanChr];
            char *word3 = (char*)sqlite3_column_text(statement, 4);
            card.example = [NSString stringWithUTF8String:word3];
        }

    }else{
        printf( "could not prepare statemnt: %s\n", sqlite3_errmsg(database) );

    }
    
    sqlite3_reset(statement);
    sqlite3_finalize(statement);
    
    sqlite3_close(database);

    return card;
}

/**
 @brief: add new card into table card and word_example
 */
- (BOOL)addCard:(Card *)card
{
    BOOL result = NO;
    int rc = 0;
    sqlite3 *database;
    sqlite3_open([[self getDBPath] UTF8String], &database);
    char *errMsg;
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO card (word_kanji, word_hira, mean_vi) VALUE (%@, %@, %@)", card.wordKanji, card.wordHira, card.meanVi];
    rc = sqlite3_exec(database, [sql UTF8String], NULL, NULL, &errMsg);
    if (rc == SQLITE_OK) {
        result = YES;
    }else
        NSLog(@"error when insert data into database!");
    
    sql = [NSString stringWithFormat:@"INSERT INTO word_example (card_id, example) VALUE (SELECT last_insert_rowid(), %@)", card.example];
    rc = sqlite3_exec(database, [sql UTF8String], NULL, NULL, &errMsg);
    
    if (rc == SQLITE_OK) {
        result = YES;
    }else
        NSLog(@"error when insert data into database!");
    
    return result;
}
@end
