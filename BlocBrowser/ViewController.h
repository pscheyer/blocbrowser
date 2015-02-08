//
//  ViewController.h
//  BlocBrowser
//
//  Created by Peter Scheyer on 2/4/15.
//  Copyright (c) 2015 Peter Scheyer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


/** 
 Replaces web view with a fresh one, erasing all history. Also updates the URL field and toolbar buttons appropriately
 */
- (void) resetWebView;


@end

