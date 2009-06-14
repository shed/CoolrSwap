//
//  CoolrswapViewController.m
//  Coolrswap
//
//  Copyright Cocoa Fluff 2009. All rights reserved.
//

#import "CoolrswapViewController.h"

@implementation CoolrswapViewController

// for now use a pre-defined number of  rows and cols, this may change to provide for different levels of
// 
#define NB_ROWS 4
#define NB_COLS 4

// parameter definining the layout of the squares
#define SQ_WIDTH 70
#define SQ_HEIGHT 70
#define SQ_MARGIN 10


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
    squareImages = [[NSArray arrayWithObjects: [UIImage imageNamed:@"Blue.png"],
              [UIImage imageNamed:@"Red.png"], 
              [UIImage imageNamed:@"Green.png"], 
              [UIImage imageNamed:@"Yellow.png"], nil] retain];
}

- (void)initSquares {
    squareViews = [[NSMutableArray alloc] init];
    
    for ( int row=0;row<NB_ROWS;row++ )  {
        for( int col=0;col<NB_COLS;col++ ) {
            // start position for each square
            int x = col*(SQ_WIDTH+SQ_MARGIN)+10;
            int y = row*(SQ_HEIGHT+SQ_MARGIN);
            UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(x,y,SQ_WIDTH,SQ_HEIGHT)];
            [[self view] addSubview: imageView];
            [squareViews addObject: imageView];
            
            // release the image view since it's been held by the view, and the array
            [imageView release];
        }
    }
}

- (void)putRandomSquares {
    // initialize the random generator to a random-er value
    srandom((long)[[NSDate date] timeIntervalSince1970]);
    int nbImages = [squareImages count];    
    for( int i=0; i<[squareViews count]; i++ ) {
        UIImageView * squareView = [squareViews objectAtIndex:i];
        squareView.image = [squareImages objectAtIndex: random()%nbImages];
    }
}

-(void)animate_ {
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initImages];
    [self initSquares];
    [self putRandomSquares];
    [self animate_];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"Touched");
    [self putRandomSquares];
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
    [squareImages release];
    [squareViews release];
    [super dealloc];
}

@end
