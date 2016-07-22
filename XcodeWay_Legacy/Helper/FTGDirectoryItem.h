//
//  FTGDirectoryItem.h
//  XcodeWay
//
//  Created by Khoa Pham on 3/14/15.
//  Copyright (c) 2015 Fantageek. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, FTGDirectoryItemType) {
    FTGDirectoryItemTypeFile,
    FTGDirectoryItemTypeFolder,
};

@interface FTGDirectoryItem : NSObject

@property (nonatomic, assign) FTGDirectoryItemType type;
@property (nonatomic, strong) NSDate *dateModified;
@property (nonatomic, copy) NSString *name;

+ (instancetype)itemWithAttributes:(NSDictionary *)attributes name:(NSString *)name;

@end
