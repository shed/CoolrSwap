//
//  CoolrswapAppDelegate.h
//  Coolrswap
//
//  Created by Marius Seritan on 6/10/09.
//  Copyright de-co-de software, inc 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoolrswapViewController;

@interface CoolrswapAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CoolrswapViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CoolrswapViewController *viewController;

@end

