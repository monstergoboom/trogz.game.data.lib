//
//  DataManager.m
//  trogz.game.data.lib
//
//  Created by Alek Mitrevski on 7/14/14.
//  Copyright (c) 2014 Alek Mitrevski. All rights reserved.
//

#import "datamanager.h"

@implementation DataManager
@synthesize needsUpdateSchema, needsCreateSchema, needsDataRefresh;

// bundle config file
static NSString* const dbName = @"trogz";
static NSString* const resourceTypeName = @"plist";

// root definition
static NSString* const userVersionAttribute = @"userVersion";
static NSString* const scheamVersionAttribute = @"scheamVersion";
static NSString* const modifiedDateAttribtue = @"modifiedDate";
static NSString* const modifiedByAttribute = @"modifiedBy";
static NSString* const templateAttribute = @"template";
static NSString* const entitiesAttribute = @"entities";

-(id) init {
    self = [super initWithName:dbName];
    if (self!=nil) {
        resourceSchemaVersion = 0;
        resourceUserVersion = 0;
        
        bundle = [NSBundle bundleForClass:[self class]];
        resourcePath = [bundle pathForResource: name ofType:resourceTypeName];
        
        needsDataRefresh = false;
        needsCreateSchema = false;
        needsUpdateSchema = false;
    }
    
    return self;
}

-(bool) verify {
    bool result = false;
    
    if(resourcePath.length > 0) {
        NSDictionary *content = [NSDictionary dictionaryWithContentsOfFile:resourcePath];
        
        NSNumber* uv = [content valueForKey:userVersionAttribute];
        NSNumber* sv = [content objectForKey:scheamVersionAttribute];
        
        if(uv!=nil && sv!=nil) {
            if(uv.longValue > userVersion) {
                [self setNeedsDataRefresh:true];
                
                if ( sv.longValue > schemaVersion) {
                    [self setNeedsUpdateSchema:true];
                }
                else if(sv.longValue == 0) {
                    [self setNeedsCreateSchema:true];
                }
            }
            
            resourceUserVersion = uv.intValue;
            resourceSchemaVersion = uv.intValue;
            
            result = true;
            
            NSLog(@"create database: %d, update database: %d, refresh data: %d", needsCreateSchema, needsUpdateSchema, needsDataRefresh);
        }
        else {
            NSLog(@"incorrect file type or missing properties. userVersion, schemaVersion");
        }
    }
    else {
        NSLog(@"path and resource not found. %@.%@", dbName, resourceTypeName);
    }
    
    return result;
}

-(bool) update {
    bool result = false;
    
    if(needsCreateSchema) {
    }
    else if(needsUpdateSchema) {
        
    }
    
    if(needsDataRefresh){
        [self updateUserVersion:resourceUserVersion];
    }

    return result;
}

@end
