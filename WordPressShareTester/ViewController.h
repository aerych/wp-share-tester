//
//  ViewController.h
//  WordPressShareTester
//
//  Created by Eric J. on 10/28/12.
//  Copyright (c) 2012 Automattic Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong) IBOutlet UIView *hitView;
@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIView *contentView;
@property (nonatomic, strong) IBOutlet UITextField *subjectText;
@property (nonatomic, strong) IBOutlet UITextField *tagsText;
@property (nonatomic, strong) IBOutlet UITextView *bodyText;
@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UIButton *imageButton;
@property (nonatomic, strong) IBOutlet UIButton *shareButton; 

- (IBAction)handleShareClick:(id)sender;
- (IBAction)handleImageClick:(id)sender;

@end
