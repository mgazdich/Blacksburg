//
//  PlacesWebViewController.h
//  Blacksburg
//
//  Created by Mike_Gazdich_rMBP on 9/30/13.
//  Copyright (c) 2013 Mike Gazdich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlacesWebViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UINavigationItem *label;
@property (nonatomic, strong) NSString *websiteURL;

@end
