//
//  AttributeEntityTest.m
//  trogz.game.data.lib
//
//  Created by Alek Mitrevski on 7/14/14.
//  Copyright (c) 2014 Alek Mitrevski. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "datamanager.h"

@interface AttributeEntityTest : XCTestCase

@end

@implementation AttributeEntityTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

-(void) testVerifyDb {
    DataManager* dm = [[DataManager alloc] initWithName:@"trogz"];
    
    bool result = [dm verify];
    
    XCTAssertTrue(result, @"unable to verify db, check log");
}

- (void)testReadTableDefinition {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString* plistPath = [bundle pathForResource:@"trogz.gec" ofType:@"plist"];
    NSDictionary *plistContents = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    NSString* userVersion = [plistContents objectForKey:@"userVersion"];
    NSString* schemaVersion = [plistContents objectForKey:@"schemaVersion"];
    
    NSLog(@"user version: %@, schema version: %@", userVersion, schemaVersion);
    
    NSDictionary* entities = [plistContents objectForKey:@"entities"];
    
    [entities enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSString* tableName = (NSString*)key;
        NSDictionary* tableDef = (NSDictionary*)obj;
        
        NSLog(@"table: %@", tableName);
        [tableDef enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            NSString* columnName = (NSString*)key;
            NSDictionary* columnDef = (NSDictionary*)obj;
            
            NSLog(@"column: %@", columnName);
            [columnDef enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                NSString* def = (NSString*) key;
                NSLog(@"def: %@", def);
            }];
        }];
    }];
}

@end
