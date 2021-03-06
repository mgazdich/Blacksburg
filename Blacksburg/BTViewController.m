//
//  BTViewController.m
//  Blacksburg
//
//  Created by Mike_Gazdich_rMBP on 9/29/13.
//  Copyright (c) 2013 Mike Gazdich. All rights reserved.
//

#import "BTViewController.h"
#import "WebViewController.h"

@interface BTViewController ()

@property (strong, nonatomic) NSString *urlOfWebsite;
@property (strong, nonatomic) NSString *label;


@end

@implementation BTViewController

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
    self.content = [[NSArray alloc] initWithObjects:@"Home", @"General Info", @"Schedules and Maps", @"BT Access", @"Fares and Passes", @"Kid's Stop", @"Want To", nil];
    

   self.BT_dictionary1 = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"BT" ofType:@"plist"]];
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
    for (int i = 0; i < self.BT_dictionary1.count; i++) {
        NSString* val = [self.BT_dictionary1.allKeys objectAtIndex:i];
        if([nameOfSelectedRow isEqualToString:@"Schedules and Maps"]){
            [self performSegueWithIdentifier:@"schedule" sender:self];
            break;
        }
        else if ([nameOfSelectedRow isEqualToString:val]) {
            self.label = nameOfSelectedRow;
            self.urlOfWebsite = (NSString*)[self.BT_dictionary1 objectForKey: nameOfSelectedRow];
            [self performSegueWithIdentifier:@"BTWeb" sender:self];
            break;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BTViewCellReuseID" forIndexPath:indexPath];
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
    
    if ([[segue identifier] isEqualToString:@"BTWeb"]) {
        
        // Obtain the object reference of the destination view controller
        WebViewController *websiteViewController = [segue destinationViewController];
        websiteViewController.label.title = self.label;
        //Pass the data object to the destination view controller object
        websiteViewController.websiteURL = self.urlOfWebsite;
    }
}

@end
