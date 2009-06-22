//
//  CoolrswapViewController.h
//  Coolrswap
//
//  Copyright Cocoa Fluff 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ImageManager;


@interface CoolrswapViewController : UIViewController {
    
    ImageManager * imageManager;
    
    // array of ColoredSquare objects holding the squares, need to be mutable to allow for initialization in loop
    NSMutableArray * squareViews;

    
	// array of transform images going into the bottom left hand corner of screen
	NSArray * transformImages;
    	
	IBOutlet UIImageView * transformView;
    
    IBOutlet UILabel * totalLabel;
    
    int total;
	
	int transform;
}

@property (retain, nonatomic) UIImageView * transformView;

@end

