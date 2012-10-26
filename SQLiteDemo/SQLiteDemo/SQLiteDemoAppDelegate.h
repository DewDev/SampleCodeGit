//
//  SQLiteDemoAppDelegate.h
//  SQLiteDemo
//
//  Created by cis on 19/10/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SQLiteDemoViewController;

@interface SQLiteDemoAppDelegate : UIResponder <UIApplicationDelegate>

{
    
    //To hold a list of Coffee objects
    NSMutableArray *coffeeArray;


}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) SQLiteDemoViewController *viewController;

@property (nonatomic, retain) NSMutableArray *coffeeArray;

- (void) copyDatabaseIfNeeded;
- (NSString *) getDBPath;

@end
