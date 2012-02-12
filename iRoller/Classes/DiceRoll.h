#import <UIKit/UIKit.h>


@interface DiceRoll : NSObject {
	NSArray* diceSuperArray;		//Contains the equation split up (ex: "1d6","2d8","17"
	NSMutableArray* diceCounter;	//Contains Strings & Numbers. Used for printing.
	NSString* diceString;			//A string created from diceRaw that we can use standard NSString functions on
	NSNumber* diceTotal;
    NSMutableString* displayString;
}
-(void)run;					//Runonce function
-(void)_format;				//Display output based on diceCounter
-(void)_roll;				//Take care of the rolling and appending of formatting to diceCounter
-(int)_randNum:(int)high;	//Spit back a int between 1 and (int)high
-(void)_reset;				//Clear all variables (for looping purposes)

@property (retain) NSNumber* diceTotal;		//Setter/Getter for external use
@property (retain) NSString* diceString;	
@property (retain) NSMutableString* displayString;
@end
