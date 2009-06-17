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
	int x;
	int y;
    UIImageView * view;
}

@property (assign) int color;
@property (assign) int x;
@property (assign) int y;
@property (retain,nonatomic) UIImageView * view;

@end
