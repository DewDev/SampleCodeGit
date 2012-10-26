//
//  SQLiteDemoViewController.h
//  SQLiteDemo
//
//  Created by cis on 19/10/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "SQLiteDemoAppDelegate.h"


@interface SQLiteDemoViewController : UIViewController
{
    NSInteger coffeeID;
    NSString *coffeeName;
    NSDecimalNumber *price;
    
    //Intrnal variables to keep track of the state of the object.
    BOOL isDirty;
    BOOL isDetailViewHydrated;

    SQLiteDemoAppDelegate *appDelegate;
}


@property (nonatomic, readonly) NSInteger coffeeID;
@property (nonatomic, copy) NSString *coffeeName;
@property (nonatomic, copy) NSDecimalNumber *price;

@property (nonatomic, readwrite) BOOL isDirty;
@property (nonatomic, readwrite) BOOL isDetailViewHydrated;
//Static methods.
+ (void) getInitialDataToDisplay:(NSString *)dbPath;
+ (void) finalizeStatements;

//Instance methods.
- (id) initWithPrimaryKey:(NSInteger)pk;

@end
