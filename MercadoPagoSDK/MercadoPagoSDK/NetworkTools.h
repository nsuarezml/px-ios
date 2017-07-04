//
//  NetworkTools.h
//  MercadoPagoSDK
//
//  Created by AUGUSTO COLLERONE ALFONSO on 7/4/17.
//  Copyright © 2017 MercadoPago. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkTools : NSObject

+ (NSString *)getIPAddress:(BOOL)preferIPv4;
+ (NSDictionary *)getIPAddresses;


@end
