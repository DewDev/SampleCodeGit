//
//  SQLiteDemoViewController.m
//  SQLiteDemo
//
//  Created by cis on 19/10/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SQLiteDemoViewController.h"
#import "SQLiteDemoAppDelegate.h"


static sqlite3 *database = nil;

@implementation SQLiteDemoViewController

@synthesize coffeeID, coffeeName, isDirty, isDetailViewHydrated, price;



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    //=================================================================
    
    int i= 0;
    float j = 0.1;
    
    int k = 1;
    
    int h = 2;
    
    int o = 3;
    //=================================================================
    
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    appDelegate = (SQLiteDemoAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    self.title = @"Coffee List";
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [appDelegate.coffeeArray count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero];
    }
    
    //Get the object from the array.
    SQLiteDemoViewController *coffeeObj = [appDelegate.coffeeArray objectAtIndex:indexPath.row];
    
    //Set the coffename.
    cell.textLabel.text = coffeeObj.coffeeName;
    
    // Set up the cell
    return cell;
}


+ (void) getInitialDataToDisplay:(NSString *)dbPath {
    
    SQLiteDemoAppDelegate *appDelegate = (SQLiteDemoAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK) {
        
        const char *sql = "select coffeeID, coffeeName from coffee";
        sqlite3_stmt *selectstmt;
        if(sqlite3_prepare_v2(database, sql, -1, &selectstmt, NULL) == SQLITE_OK) {
            
            while(sqlite3_step(selectstmt) == SQLITE_ROW) {
                
                NSInteger primaryKey = sqlite3_column_int(selectstmt, 0);
                SQLiteDemoViewController *coffeeObj = [[SQLiteDemoViewController alloc] initWithPrimaryKey:primaryKey];
                coffeeObj.coffeeName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 1)];
                
                coffeeObj.isDirty = NO;
                
                [appDelegate.coffeeArray addObject:coffeeObj];
            }
        }
    }
    else
        sqlite3_close(database); //Even though the open call failed, close the database connection to release all the memory.
}


- (id) initWithPrimaryKey:(NSInteger) pk {
    
//    [super init];
    coffeeID = pk;
    
    isDetailViewHydrated = NO;
    
    return self;
}

+ (void) finalizeStatements {
    
    if(database) sqlite3_close(database);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
