#import "iRollerViewController.h"
#import "DiceRoll.h"

@implementation iRollerViewController

@synthesize DiceInput, DiceDisplay, RollerButton, diceRoller, SideButton, PlusButton, DiceSegment;

-(void)awakeFromNib {
    diceRoller = [DiceRoll alloc];
}
-(IBAction)Roll:(id)sender {
    [diceRoller run];
	DiceDisplay.text = [NSString stringWithFormat:@"%d",[diceRoller.diceTotal intValue]];
    NSLog(@"%@",diceRoller.displayString);
    DiceSegment.text = diceRoller.displayString;
}
-(IBAction)ProcessInput:(id)sender {
	diceRoller.diceString = [DiceInput text];
}
-(IBAction)AddSideSymbol {
    NSString *tempString = [NSString stringWithFormat:@"d"];
    NSString *finalString = [DiceInput.text stringByAppendingString:tempString];
    diceRoller.diceString = finalString;
    DiceInput.text = finalString;
}    
-(IBAction)AddPlusSymbol {
    NSString *tempString = [NSString stringWithFormat:@"+"];
    NSString *finalString = [DiceInput.text stringByAppendingString:tempString];
    diceRoller.diceString = finalString;
    DiceInput.text = finalString;
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/
/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/
/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/
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
    [super dealloc];
}

@end
