//
//  BTWebViewController.h
//  Blacksburg
//
//  Created by Mike_Gazdich_rMBP on 9/30/13.
//  Copyright (c) 2013 Mike Gazdich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (nonatomic, strong) NSString *websiteURL;
@property (strong, nonatomic) IBOutlet UINavigationItem *label;

@end
