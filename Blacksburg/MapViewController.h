//
//  MapViewController.h
//  Blacksburg
//
//  Created by Mike_Gazdich_rMBP on 9/29/13.
//  Copyright (c) 2013 Mike Gazdich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController
@property (strong, nonatomic) IBOutlet MKMapView *map;
- (IBAction)standardMap:(UIBarButtonItem*)sender;
- (IBAction)satelliteMap:(UIBarButtonItem *)sender;
- (IBAction)hybridMap:(UIBarButtonItem *)sender;

@end
