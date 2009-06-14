//
//  CoolrswapViewController.h
//  Coolrswap
//
//  Copyright Cocoa Fluff 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoolrswapViewController : UIViewController {
    
    // array of views displaying the squares, need to be mutable to allow for initialization in loop
    NSMutableArray * squareViews;

    // array of images going into the squares, right now this is statically allocated
    NSArray * squareImages;
    
}

- (IBAction)touched:(id)target;


@end

