//
//  ImageManager.m
//  Coolrswap
//
//  Created by Marius Seritan on 6/22/09.
//  Copyright 2009 de-co-de software, inc. All rights reserved.
//

#import "ImageManager.h"


@implementation ImageManager

-(id)init {
    squareImages = [[NSArray arrayWithObjects: [UIImage imageNamed:@"Blue.png"],
                     [UIImage imageNamed:@"Red.png"], 
                     [UIImage imageNamed:@"Green.png"], 
                     [UIImage imageNamed:@"Yellow.png"], nil] retain];
    fadedImages = [[NSArray arrayWithObjects: [UIImage imageNamed:@"Blue_1.png"],
                     [UIImage imageNamed:@"Red_1.png"], 
                     [UIImage imageNamed:@"Green_1.png"], 
                     [UIImage imageNamed:@"Yellow_1.png"], nil] retain];
    blackImage = [[UIImage imageNamed: @"Black.png"] retain];
    return self;
}

-(void) dealloc
{
    [blackImage release];
    [squareImages release];
    [fadedImages release];
    [super dealloc];
}


// Number of images
-(int)count {
    return [squareImages count];
}

// Full image for the given index
-(UIImage*)getImage:(int)index {
    return [squareImages objectAtIndex: index];
}

// Get faded image for the give index
-(UIImage*)getFadedImage:(int)index {
    return [fadedImages objectAtIndex: index];
}

-(UIImage*)blackImage {
    return blackImage;
}

@end
