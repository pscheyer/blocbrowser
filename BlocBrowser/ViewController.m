//
//  ViewController.m
//  BlocBrowser
//
//  Created by Peter Scheyer on 2/4/15.
//  Copyright (c) 2015 Peter Scheyer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate, UITextFieldDelegate>

@property (nonatomic, strong) UIWebView *webview;
@property (nonatomic, strong) UITextField *textField;

@end

@implementation ViewController


-(void)loadView {
    UIView *mainView = [UIView new];
    
    self.webview = [[UIWebView alloc] init];
    self.webview.delegate = self;
    
    self.textField =[[UITextField alloc] init];
    self.textField.keyboardType = UIKeyboardTypeURL;
    self.textField.returnKeyType = UIReturnKeyDone;
    self.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField.placeholder = NSLocalizedString(@"Website URL", @"Placeholder text for web browser URL Field");
    self.textField.backgroundColor = [UIColor colorWithWhite:220/255.0f alpha:1];
    self.textField.delegate = self;
    
    [mainView addSubview:self.webview];
    [mainView addSubview:self.textField];
    self.view = mainView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
//first, calculate some dimensions
    static const CGFloat itemHeight = 50;
    CGFloat width = CGRectGetWidth(self.view.bounds);
    CGFloat browserHeight = CGRectGetHeight(self.view.bounds)- itemHeight;
    
    //now, assign the frames
    self.textField.frame = CGRectMake(0, 0, width, itemHeight);
    self.webview.frame = CGRectMake(0, CGRectGetMaxY(self.textField.frame), width, browserHeight);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    NSString *URLString = textField.text;
    
    NSURL *URL = [NSURL URLWithString:URLString];
    
    if (!URL.scheme) {
        //the user didn't type http: or https:
        URL = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", URLString]];
    }
    
    if (URL) {
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
        [self.webview loadRequest:request];
    }
    return NO;
}


@end
