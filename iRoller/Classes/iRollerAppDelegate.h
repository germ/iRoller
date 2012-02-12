//
//  iRollerAppDelegate.h
//  iRoller
//
//  Created by Germ on 10-08-05.
//  Copyright Melville Comprehensive School 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iRollerViewController;

@interface iRollerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    iRollerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet iRollerViewController *viewController;

@end

