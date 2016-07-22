//
//  FTGDirectoryHelper.m
//  XcodeWay
//
//  Created by Khoa Pham on 3/14/15.
//  Copyright (c) 2015 Fantageek. All rights reserved.
//

#import "FTGDirectoryHelper.h"
#import "FTGDirectoryItem.h"

@implementation FTGDirectoryHelper

+ (FTGDirectoryItem *)lastestModifiedFolderFromPath:(NSString *)path {
    NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
    NSMutableArray *items = [NSMutableArray array];

    // Get items
    for (NSString *file in files) {
        NSString *fullFilePath = [path stringByAppendingPathComponent:file];
        NSDictionary *attributes = [self attributesOfItemAtPath:fullFilePath];

        FTGDirectoryItem *item = [FTGDirectoryItem itemWithAttributes:attributes name:file];

        if (item.type == FTGDirectoryItemTypeFolder) {
            [items addObject:item];
        }

    }

    // Sort
    NSArray *sortedItems = [items sortedArrayUsingComparator:^NSComparisonResult(FTGDirectoryItem *i1, FTGDirectoryItem *i2) {
        return [i1.dateModified compare:i2.dateModified];
    }];

    return sortedItems.lastObject;
}

+ (NSDictionary *)attributesOfItemAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil];
}

@end
