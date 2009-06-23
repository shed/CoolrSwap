//
//  CoolrswapViewController.m
//  Coolrswap
//
//  Copyright Cocoa Fluff 2009. All rights reserved.
//

#import "CoolrswapViewController.h"
#import "ColoredSquare.h"
#import "ImageManager.h"

@implementation CoolrswapViewController

// start to number the squares at this tag
#define SQ_TAG_BASE 128

// for now use a pre-defined number of  rows and cols, this may change to provide for different levels of
// 
#define NB_ROWS 4
#define NB_COLS 4


@synthesize transformView;
/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
- (void)loadView {
}
*/

- (void)initImages {
    imageManager  = [[ImageManager alloc] init];
	
	transformImages = [[NSArray arrayWithObjects:
					   [UIImage imageNamed:@"ColorSwap_Up_alpha.png"],
						[UIImage imageNamed:@"ColorSwap_Right_alpha.png"],
						[UIImage imageNamed:@"ColorSwap_Down_alpha.png"],
						[UIImage imageNamed:@"ColorSwap_Left_alpha.png"],
						[UIImage imageNamed:@"ColorRing_Counter_alpha.png"],
						[UIImage imageNamed:@"ColorRing_Clockwise_alpha.png"], nil] retain];
}

- (void)initSquares {
    squareViews = [[NSMutableArray alloc] init];
    
    for ( int row=0;row<NB_ROWS;row++ )  {
        for( int col=0;col<NB_COLS;col++ ) {
            ColoredSquare * cs = [[ColoredSquare alloc] initWithImages: imageManager parentView: [self view] X:col Y:row];
            [squareViews addObject: cs];
            cs.tag = [squareViews count]-1+SQ_TAG_BASE;
            
        }
    }
}

- (void)putRandomSquares {
    // initialize the random generator to a random-er value
    srandom((long)[[NSDate date] timeIntervalSince1970]);
    int nbImages = [imageManager count];    
    for( int i=0; i<[squareViews count]; i++ ) {
        ColoredSquare * coloredSquare = (ColoredSquare*)[squareViews objectAtIndex:i];
        coloredSquare.color = random()%nbImages;
    }
	
}

-(void) putRandomTransformation {
	transform = random()%[transformImages count];
	transformView.image = [transformImages objectAtIndex: transform];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initImages];
    [self initSquares];
    [self putRandomSquares];
    [self putRandomTransformation];
}

/**
 * Apply the active transformation to this ColoredSquare.
 */
-(void)rotateColor: (ColoredSquare*)coloredSquare direction:(int)direction  {
    // for now just rotate the colors
    int newColor = (coloredSquare.color+direction)%[imageManager count];
    coloredSquare.color = newColor;
}

-(ColoredSquare*)getSquareAtX: (int)x Y:(int)y {
	return [squareViews objectAtIndex: ((y*NB_COLS)+x)];
}

-(void)swap: (ColoredSquare*)coloredSquare X:(int)x Y:(int)y {
	int newX = (coloredSquare.x+x)%NB_ROWS; if ( newX < 0 ) { newX = newX + NB_ROWS;}
	int newY = (coloredSquare.y+y)%NB_COLS; if ( newY < 0 ) { newY = newY + NB_COLS;}
	ColoredSquare * newColoredSquare = [self getSquareAtX: newX Y: newY];
	int tempColor = newColoredSquare.color;
	newColoredSquare.color = coloredSquare.color;
	coloredSquare.color = tempColor;
}

-(void)doTransform: (ColoredSquare*)coloredSquare {
	switch (transform) {
		case 0:
			[self swap: coloredSquare X: 0 Y: -1];
			break;
		case 1:
			[self swap: coloredSquare X: 1 Y: 0];
			break;
		case 2:
			[self swap: coloredSquare X: 0 Y: 1];
			break;
		case 3:
			[self swap: coloredSquare X: -1 Y: 0];
			break;
		case 4:
			[self rotateColor:coloredSquare direction: -1];
			break;
		case 5:
			[self rotateColor:coloredSquare direction: 1];
			break;
		default:
			break;
	}
}

//Determines if there are three colors in a horizontal row
-(NSArray*)colorsMatchedHorizontal{
	for ( int row=0;row<NB_ROWS-2;row++ )  {		
        for( int col=0;col<NB_COLS;col++ ) {
			ColoredSquare * cs1 = [self getSquareAtX: row Y: col];
			ColoredSquare * cs2 = [self getSquareAtX: row+1 Y: col];
			ColoredSquare * cs3 = [self getSquareAtX: row+2 Y: col];
			if ( cs1.color == cs2.color && cs1.color == cs3.color && cs1.color > -1 ) {
				NSLog( @"Found 3 in a horizontal row x: %d y: %d", row, col );
                return [NSArray arrayWithObjects: cs1, cs2, cs3, nil];
			}
		}
    }
    return nil;
}

//Determines if there are three colors in a vertical row
-(NSArray*)colorsMatchedVertical{
	for ( int row=0;row<NB_ROWS;row++ )  {		
        for( int col=0;col<NB_COLS-2;col++ ) {
			ColoredSquare * cs1 = [self getSquareAtX: row Y: col];
			ColoredSquare * cs2 = [self getSquareAtX: row Y: col+1];
			ColoredSquare * cs3 = [self getSquareAtX: row Y: col+2];
			if ( cs1.color == cs2.color && cs1.color == cs3.color && cs1.color > -1 ) {
				NSLog( @"Found 3 in a vertical row x: %d y: %d", row, col );
                return [NSArray arrayWithObjects: cs1, cs2, cs3, nil];
			}
		}
    }
    return nil;
}

-(NSArray*)colorsMatched{
	NSArray * matches = [self colorsMatchedHorizontal];
    if ( matches != nil ) {
        return matches;
    }
    matches = [self colorsMatchedVertical];
    return matches;
}

/*
 * Refresh the color for the black squares.
 */
-(void)refreshSquares {
    for( ColoredSquare * cs in squareViews ) {
        if ( cs.color == -1 ) {
            cs.color = random()%([imageManager count]);
        }
    }

}

-(void)processMatches {
    bool hasSome = false;
    while( TRUE ) {
        NSArray * matches = [self colorsMatched];
        if ( matches == nil ) {
            if ( hasSome ) {
                [self performSelector:@selector(refreshSquares) withObject:self afterDelay:2];            

            }
            break;
        }
        hasSome = true;
        total += 1;
        totalLabel.text = [NSString stringWithFormat: @"%d", total];
        for( ColoredSquare * cs in matches ) {
            cs.color = -1;
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSSet * allTouched = [event touchesForWindow: self.view.window];
    for( UITouch * touched in allTouched ) {
        if ( touched.view.tag >= SQ_TAG_BASE  && touched.view.tag < SQ_TAG_BASE + [squareViews count] ) {
            ColoredSquare * coloredSquare = [squareViews objectAtIndex: touched.view.tag-SQ_TAG_BASE];
            NSLog( [NSString stringWithFormat: @"touched %d x: %d y: %d", coloredSquare.color, 
                    coloredSquare.x, coloredSquare.y ]);
            [self doTransform: coloredSquare];
            [self processMatches];
        }
        [self putRandomTransformation];
    }
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [imageManager release];
    [squareViews release];
	[transformImages release];
    [super dealloc];
}

@end
