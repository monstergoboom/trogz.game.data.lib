//
//  Attributes.h
//  trogz.game.data.lib
//
//  Created by Alek Mitrevski on 7/14/14.
//  Copyright (c) 2014 Alek Mitrevski. All rights reserved.
//

#import "gameentity.h"

extern NSString* const idAttribute;
extern NSString* const nameAttribute;
extern NSString* const categoryAttribute;
extern NSString* const descriptionAttribute;
extern NSString* const createdAttribute;
extern NSString* const modifiedAttribute;

@interface AttributeEntity : GameEntity {
    
}

@property(nonatomic, assign, getter=getAttributeId) long attributeId;
@property(nonatomic, strong, getter=getAttributeName, setter=setAttributeName:) NSString* attributeName;
@property(nonatomic, strong, getter=getAttributeCategory, setter=setAttributeCategory:) NSString* attributeCategory;
@property(nonatomic, strong, getter=getAttributeDescription, setter=setAttributeDescription:) NSString* attributeDescription;
@property(nonatomic, strong, getter=getAttributeCreated, setter=setAttributeCreated:) NSDate* attributeCreated;
@property(nonatomic, strong, getter=getAttributeModified, setter=setAttributeModified:) NSDate* attributeModified;

-(id) init: (id<EntityContainerProtocol>) dbContainer;
-(id) init: (id<EntityContainerProtocol>) dbContainer withEntity:(int) entityId;

@end
