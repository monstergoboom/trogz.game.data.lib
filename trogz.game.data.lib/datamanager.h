//
//  DataManager.h
//  trogz.game.data.lib
//
//  Created by Alek Mitrevski on 7/14/14.
//  Copyright (c) 2014 Alek Mitrevski. All rights reserved.
//

#import "GameEntityContainer.h"

@interface DataManager : GameEntityContainer {
    bool needsDataRefresh;
    bool needsUpdateSchema;
    bool needsCreateSchema;
    
    NSBundle* bundle;
    NSString* resourcePath;
    
    int resourceUserVersion;
    int resourceSchemaVersion;
}

@property (nonatomic, assign) bool needsDataRefresh;
@property (nonatomic, assign) bool needsUpdateSchema;
@property (nonatomic, assign) bool needsCreateSchema;

-(bool) verify;
-(bool) update;

@end
