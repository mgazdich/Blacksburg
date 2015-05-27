//
//  PlacesViewController.m
//  Blacksburg
//
//  Created by Mike_Gazdich_rMBP on 9/30/13.
//  Copyright (c) 2013 Mike Gazdich. All rights reserved.
//

#import "PlacesViewController.h"
#import "WebViewController.h"

@interface PlacesViewController ()

@property (strong, nonatomic) NSString *urlOfWebsite;
@property (strong, nonatomic) NSString *label;

@end

@implementation PlacesViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.content = [[NSArray alloc] initWithObjects:@"Restaurants", @"Hotels", @"Parking", @"Bars", nil];
    
    
    self.Places_dictionary1 = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Places" ofType:@"plist"]];
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.content.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger rowNumber = [indexPath row];
    NSString *nameOfSelectedRow = [self.content objectAtIndex:rowNumber];
    for (int i = 0; i < self.Places_dictionary1.count; i++) {
        NSString* val = [self.Places_dictionary1.allKeys objectAtIndex:i];
        if ([nameOfSelectedRow isEqualToString:val]) {
            self.label = nameOfSelectedRow;
            self.urlOfWebsite = (NSString*)[self.Places_dictionary1 objectForKey: nameOfSelectedRow];
            [self performSegueWithIdentifier:@"places" sender:self];
            break;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlacesViewCellReuseID" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:@"bInCircle30.png"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSUInteger rowNumber = [indexPath row];          // Identify the row number
    
    NSString *rowName = [self.content objectAtIndex:rowNumber];
    cell.textLabel.text = rowName;
    // Configure the cell...
    
    return cell;
}

#pragma mark - Preparing for Segue

// This method is called by the system whenever you invoke the method performSegueWithIdentifier:sender:
// You never call this method. It is invoked by the system.
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"places"]) {
        
        // Obtain the object reference of the destination view controller
        WebViewController *websiteViewController = [segue destinationViewController];
        websiteViewController.label.title = self.label;
        //Pass the data object to the destination view controller object
        websiteViewController.websiteURL = self.urlOfWebsite;
    }
}

@end
