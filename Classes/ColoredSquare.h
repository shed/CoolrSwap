//
//  ColoredSquare.h
//  Coolrswap
//
//  Created by Marius Seritan on 6/14/09.
//  Copyright 2009 de-co-de software, inc. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ColoredSquare : NSObject {
    int color;
    UIImageView * view;
}

@property (assign) int color;
@property (retain,nonatomic) UIImageView * view;

@end
