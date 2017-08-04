//
//  AndyDailyListModel.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyDailyListModel.h"
#import "MJExtension.h"
#import "AndyDailyVideoListModel.h"

@implementation AndyDailyListModel

- (NSDictionary *)objectClassInArray
{
    return @{@"videoList" : [AndyDailyVideoListModel class]};
}

- (NSString *)realDate
{
   NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:self.date / 1000];
    
//#warning NSDate
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
//#warning
    fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    NSDate *createdDate = [fmt dateFromString:[NSString stringWithFormat:@"%@", confromTimesp]];
//    
    return [NSString stringWithFormat:@"%@", createdDate];
    
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"- yyyyMMdd -"];
    [dateFormat setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8*60*60]];
    
    NSString *currentDateStr = [dateFormat stringFromDate:[NSDate dateWithTimeIntervalSince1970:self.date / 1000]];

    NSDate *now= [NSDate dateWithTimeIntervalSince1970:self.date / 1000];
    ///NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateStyle = kCFDateFormatterMediumStyle;
    //fmt.timeStyle = kCFDateFormatterMediumStyle;
    fmt.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];//
    NSString *dataString =[fmt stringFromDate:now];
    //NSLog(@"%@",dataString);
    
    NSArray *arr = [dataString componentsSeparatedByString:@","];
    NSArray *detailArr = [[NSString stringWithFormat:@"%@", arr[0]] componentsSeparatedByString:@" "];
    NSString *realString = [NSString stringWithFormat:@"- %@. %@ - ", detailArr[0], detailArr[1]];
    
    return realString;
}


@end
