//
//  FTGDirectoryItem.m
//  XcodeWay
//
//  Created by Khoa Pham on 3/14/15.
//  Copyright (c) 2015 Fantageek. All rights reserved.
//

#import "FTGDirectoryItem.h"

@implementation FTGDirectoryItem

+ (instancetype)itemWithAttributes:(NSDictionary *)attributes name:(NSString *)name {
    FTGDirectoryItem *item = [[FTGDirectoryItem alloc] init];

    item.dateModified = attributes[NSFileModificationDate];
    item.name = name;

    if ([name rangeOfString:@"."].location != NSNotFound) {
        item.type = FTGDirectoryItemTypeFile;
    } else {
        item.type = FTGDirectoryItemTypeFolder;
    }

    return item;
}

@end
