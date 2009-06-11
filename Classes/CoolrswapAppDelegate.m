//
//  CoolrswapAppDelegate.m
//  Coolrswap
//
//  Created by Marius Seritan on 6/10/09.
//  Copyright de-co-de software, inc 2009. All rights reserved.
//

#import "CoolrswapAppDelegate.h"
#import "CoolrswapViewController.h"

@implementation CoolrswapAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
