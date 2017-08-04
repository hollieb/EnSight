//
//  NSString+Andy.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Andy)
/**
 *
 *  @param font
 *  @param maxSize 
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

- (void)saveContentToFile:(NSString *)cachePath atomically:(BOOL)useAuxiliaryFile;

@end
