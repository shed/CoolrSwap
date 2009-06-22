//
//  ColoredSquare.m
//  Coolrswap
//
//  Created by Marius Seritan on 6/14/09.
//  Copyright 2009 de-co-de software, inc. All rights reserved.
//

#import "ColoredSquare.h"


@implementation ColoredSquare

@synthesize color;
@synthesize x;
@synthesize y;


-(id)initWithImages:(NSArray*)_colorImages parentView: (UIView*)parentView X:(int)col Y:(int)row {
    colorImages = _colorImages;
    x = col;
    y = row;

    view = [[UIImageView alloc] initWithFrame:CGRectMake(col*(SQ_WIDTH+SQ_MARGIN)+10, row*(SQ_HEIGHT+SQ_MARGIN),SQ_WIDTH,SQ_HEIGHT)];
    [parentView addSubview: view];
    view.userInteractionEnabled = TRUE;
    return self;
}

- (void)animateFirstTouchAtPoint {
    
#define GROW_ANIMATION_DURATION_SECONDS 0.15
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:GROW_ANIMATION_DURATION_SECONDS];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(growAnimationDidStop:finished:context:)];
    CGAffineTransform transform = CGAffineTransformMakeScale(1.2, 1.2);
    view.transform = transform;
    [UIView commitAnimations];
}


- (void)growAnimationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    
#define MOVE_ANIMATION_DURATION_SECONDS 0.15
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:MOVE_ANIMATION_DURATION_SECONDS];
    view.transform = CGAffineTransformMakeScale(1.1, 1.1);    
    [UIView commitAnimations];
}

-(void)setColor:(int)_color {
    color = _color;
    view.image = [colorImages objectAtIndex: color];
    [self animateFirstTouchAtPoint];
}

-(void)setTag:(int)_tag {
    view.tag = _tag;
}

-(int)tag {
    return view.tag;
}



@end
