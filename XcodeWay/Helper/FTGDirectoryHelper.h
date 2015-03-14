//
//  FTGDirectoryHelper.h
//  XcodeWay
//
//  Created by Khoa Pham on 3/14/15.
//  Copyright (c) 2015 Fantageek. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FTGDirectoryItem;

@interface FTGDirectoryHelper : NSObject

+ (FTGDirectoryItem *)lastestModifiedFolderFromPath:(NSString *)path;

@end
