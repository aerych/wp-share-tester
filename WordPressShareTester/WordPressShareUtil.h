//
//  WordPressShareUtil.h
//  WordPressShareTester
//
//  Created by Eric J. on 10/28/12.
//

#import <Foundation/Foundation.h>

@interface WordPressShareUtil : NSObject

+ (BOOL)isWordPressShareAvailable;
+ (void)shareToWordPressSubject:(NSString *)title tags:(NSString *)tags content:(NSString *)content;

@end
