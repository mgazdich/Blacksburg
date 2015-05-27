//
//  HospitalWebViewController.h
//  Blacksburg
//
//  Created by Mike_Gazdich_rMBP on 10/2/13.
//  Copyright (c) 2013 Mike Gazdich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HospitalWebViewController : UIViewController <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UINavigationItem *label;

@end
