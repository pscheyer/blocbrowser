//
//  ViewController.m
//  BlocBrowser
//
//  Created by Peter Scheyer on 2/4/15.
//  Copyright (c) 2015 Peter Scheyer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webview;

@end

@implementation ViewController


-(void)loadView {
    UIView *mainView = [UIView new];
    
    self.webview = [[UIWebView alloc] init];
    self.webview.delegate = self;
    
    [mainView addSubview:self.webview];
    self.view = mainView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    //make the webview fill the main view
    self.webview.frame = self.view.frame;
    
    
}


@end
