//
//  NSString+Andy.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "NSString+Andy.h"

@implementation NSString (Andy)
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (void)saveContentToFile:(NSString *)fileName atomically:(BOOL)useAuxiliaryFile
{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    AndyLog(@"%@", uuid);
    
    const char *cuuid = [uuid UTF8String];
    
    
    dispatch_queue_t network_queue = dispatch_queue_create(cuuid, nil);
    
    dispatch_async(network_queue, ^{
        
        NSString *cacheFilePath = [AndyCommonFunction getCacheFilePathWithFileName:fileName];
        
        [self writeToFile:cacheFilePath atomically:useAuxiliaryFile encoding:NSUTF8StringEncoding error:nil];
    });
}

@end
