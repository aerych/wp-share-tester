//
//  ViewController.m
//  WordPressShareTester
//
//  Created by Eric J. on 10/28/12.
//

#import <QuartzCore/QuartzCore.h>
#import "ViewController.h"
#import "WordPressShareUtil.h"

@interface ViewController () {
    id lastTextControl;
}

- (void)keyboardDidShow:(NSNotification *)notification;
- (void)keyboardWillHide:(NSNotification *)notification;
- (void)hitViewTapped;

@end

@implementation ViewController

@synthesize hitView;
@synthesize scrollView;
@synthesize contentView;
@synthesize subjectText;
@synthesize tagsText;
@synthesize bodyText;
@synthesize imageView;
@synthesize imageButton;
@synthesize shareButton;


#pragma mark -
#pragma mark Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hitViewTapped)];
    [tgr setCancelsTouchesInView:NO];
    [self.hitView addGestureRecognizer:tgr];
    
    [self.scrollView setContentSize:self.view.frame.size];
    
    self.bodyText.layer.borderWidth = 1;
    self.bodyText.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    self.imageButton.layer.borderWidth = 1;
    self.imageButton.layer.borderColor = [[UIColor lightGrayColor] CGColor];
}


- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}


#pragma mark -
#pragma mark Instance Methods

- (IBAction)handleShareClick:(id)sender {
    
    NSString *subject = self.subjectText.text;
    NSString *tags = self.tagsText.text;
    NSString *body = self.bodyText.text;
    
    [WordPressShareUtil shareToWordPressSubject:subject tags:tags content:body];
}


- (IBAction)handleImageClick:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.allowsEditing = NO;
    picker.delegate = self;
    
    [self presentViewController:picker animated:YES completion:NULL];
}


- (void)hitViewTapped {
    if([lastTextControl isFirstResponder]) {
        [lastTextControl resignFirstResponder];
    }
}


#pragma mark -
#pragma TextField/TextView Delegate Methods

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    lastTextControl = textField;
}


- (void)textViewDidBeginEditing:(UITextView *)textView {
    lastTextControl = textView;
}


#pragma mark - 
#pragma mark Image Picker Delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setImage:image];
    
    [self.imageView setImage:image];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark -
#pragma Keyboard Methods

- (void)keyboardDidShow:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    CGRect rect = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGRect frame = self.view.bounds;
    frame.size.height = frame.size.height - rect.size.height;
    self.scrollView.frame = frame;
}


- (void)keyboardWillHide:(NSNotification *)notification {
    self.scrollView.frame = self.view.bounds;
}


@end
