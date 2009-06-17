//
//  ColoredSquare.h
//  Coolrswap
//
//  Created by Marius Seritan on 6/14/09.
//  Copyright 2009 de-co-de software, inc. All rights reserved.
//

#import <Foundation/Foundation.h>

// parameter definining the layout of the squares
#define SQ_WIDTH 70
#define SQ_HEIGHT 70
#define SQ_MARGIN 10


@interface ColoredSquare : NSObject {
    int color;
	int x;
	int y;
    UIImageView * view;
    
    // hold the array of images to be used for representing colors
    NSArray * colorImages;
}

@property (assign) int color;
@property (assign) int x;
@property (assign) int y;
@property (assign) int tag;

-(id)initWithImages:(NSArray*)_colorImages parentView:(UIView*)parentView X:(int)col Y:(int)row;
    

@end
