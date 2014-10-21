//
//  Attributes.m
//  trogz.game.data.lib
//
//  Created by Alek Mitrevski on 7/14/14.
//  Copyright (c) 2014 Alek Mitrevski. All rights reserved.
//

#import "attributeentity.h"

NSString* const attributeTableName = @"attribute";
NSString* const idAttribute = @"id";
NSString* const nameAttribute = @"name";
NSString* const categoryAttribute = @"category";
NSString* const descriptionAttribute = @"description";
NSString* const createdDtAttribute = @"created_dt";
NSString* const modifiedDtAttribute = @"modified_dt";

@implementation AttributeEntity
@synthesize attributeId, attributeCategory, attributeCreated, attributeDescription, attributeModified, attributeName;

// constructors
-(id) init {
    return [self init:nil withEntityReferenceName:attributeTableName andEntity:0];
}

-(id) init: (id<EntityContainerProtocol>) dbContainer {
    return [super init:dbContainer withEntityReferenceName:attributeTableName];
}

-(id) init: (id<EntityContainerProtocol>) dbContainer withEntity:(int) entityId {
    return [super init: dbContainer withEntityReferenceName:attributeTableName andEntity:entityId];
}

// Getters
-(long) getAttributeId {
    return [[self getNumberAtColumnName:idAttribute withDefault:[NSNumber numberWithLong:0]] longValue];
}

-(NSString*) getAttributeCategory {
    return [self getTextAtColumnName:categoryAttribute withDefault:@""];
}

-(NSString*) getAttributeDescription {
    return [self getTextAtColumnName:descriptionAttribute withDefault:@""];
}

-(NSString*) getAttributeName {
    return [self getTextAtColumnName:nameAttribute withDefault:@""];
}

-(NSDate*) getAttributeCreated {
    return [self getDateAtColumnName:createdDtAttribute withDefault:[NSDate date]];
}

-(NSDate*) getAttributeModified {
    return [self getDateAtColumnName:modifiedDtAttribute withDefault:[NSDate date]];
}

// Setters
-(void) setAttributeCategory:(NSString *) category {
    [self setText:category atColumnName:categoryAttribute];
}

-(void) setAttributeDescription:(NSString *) description {
    [self setText:description atColumnName:descriptionAttribute];
}

-(void) setAttributeName:(NSString *) name {
    [self setText:name atColumnName:nameAttribute];
}

-(void) setAttributeCreated:(NSDate *) dt {
    [self setDate:dt atColumnName:createdDtAttribute];
}

-(void) setAttributeModified:(NSDate *) dt {
    [self setDate:dt atColumnName:createdDtAttribute];
}

@end
