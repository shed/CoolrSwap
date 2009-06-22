//
//  ImageManager.h
//  Coolrswap
//
//  Copyright 2009 Cocoa Fluff All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ImageManager : NSObject {
    // array of images going into the squares, right now this is statically allocated
    NSArray * squareImages;
    
    NSArray * fadedImages;
}

// Number of images
-(int)count;

// Full image for the given index
-(UIImage*)getImage:(int)index;

// Get faded image for the give index
-(UIImage*)getFadedImage:(int)index;


@end
