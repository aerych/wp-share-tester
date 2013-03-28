//
//  WordPressShareUtil.m
//  WordPressShareTester
//
//  Created by Eric J. on 10/28/12.
//

#import "WordPressShareUtil.h"

@implementation WordPressShareUtil


+ (BOOL)isWordPressShareAvailable {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"wordpress-share://"]];
}


+ (void)shareToWordPressSubject:(NSString *)title tags:(NSString *)tags content:(NSString *)content {
    
    if (![WordPressShareUtil isWordPressShareAvailable]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Could not share"
                                                            message:@"WordPress is not installed or is not a version that supports sharing."
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    
    title = [title stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    tags = [tags stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    content = [content stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
    NSString *path = [NSString stringWithFormat:@"wordpress-share://?title=%@&tags=%@&content=%@", title, tags, content];
    
    NSURL *url = [NSURL URLWithString:path];
    [[UIApplication sharedApplication] openURL:url];
}


@end
