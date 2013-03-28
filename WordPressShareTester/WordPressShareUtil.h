//
//  WordPressShareUtil.h
//  WordPressShareTester
//
//  Created by Eric J. on 10/28/12.
//  Copyright (c) 2012 Automattic Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WordPressShareUtil : NSObject

+ (BOOL)isWordPressShareAvailable;
+ (void)shareToWordPressSubject:(NSString *)title tags:(NSString *)tags content:(NSString *)content;

@end
