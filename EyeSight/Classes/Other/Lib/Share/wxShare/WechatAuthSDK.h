//
//  WechatAuthSDK.h
//  WechatAuthSDK
//
//  Created by 李凯 on 13-11-29.
//  Copyright (c) 2013年 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

enum  AuthErrCode {
    WechatAuth_Err_Ok = 0,
    WechatAuth_Err_NormalErr = -1,
    WechatAuth_Err_NetworkErr = -2,
    WechatAuth_Err_GetQrcodeFailed = -3,
    WechatAuth_Err_Cancel = -4,
    WechatAuth_Err_Timeout = -5,
};

@protocol WechatAuthAPIDelegate<NSObject>
@optional

- (void)onAuthGotQrcode:(UIImage *)image;
- (void)onQrcodeScanned;
- (void)onAuthFinish:(int)errCode AuthCode:(NSString *)authCode;

@end

@interface WechatAuthSDK : NSObject{
    NSString *_sdkVersion;
    __weak id<WechatAuthAPIDelegate> _delegate;
}

@property(nonatomic, weak) id<WechatAuthAPIDelegate> delegate;
@property(nonatomic, readonly) NSString *sdkVersion;

/*! @brief WechatAuthAPIDelegate
 *
 * @param appId
 * @param nonceStr
 * @param timeStamp
 * @param scope
 * @param signature
 * @param schemeData
 * @return YES，
    一Auth，AuthStopAuthNO。
 */

- (BOOL)Auth:(NSString *)appId
    nonceStr:(NSString *)nonceStr
   timeStamp:(NSString*)timeStamp
       scope:(NSString *)scope
   signature:(NSString *)signature
  schemeData:(NSString *)schemeData;


/*! @brief
 *
 * @return YES，NO。
 */
- (BOOL)StopAuth;

@end
