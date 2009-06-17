//
//  CoolrswapViewController.h
//  Coolrswap
//
//  Copyright Cocoa Fluff 2009. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CoolrswapViewController : UIViewController {
    
    // array of ColoredSquare objects holding the squares, need to be mutable to allow for initialization in loop
    NSMutableArray * squareViews;

    // array of images going into the squares, right now this is statically allocated
    NSArray * squareImages;
    
	// array of transform images going into the bottom left hand corner of screen
	NSArray * transformImages;
    	
	IBOutlet UIImageView * transformView;
	
	int transform;
}

@property (retain, nonatomic) UIImageView * transformView;

@end

