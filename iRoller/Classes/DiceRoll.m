#import "DiceRoll.h"


@implementation DiceRoll

@synthesize diceString, diceTotal, displayString;

-(void)run {																			//A convienience function.
	[self _reset];																		//Clean everything. Time for a new run																	
	[self _roll];																		//Make rolls
	[self _format];																	//Print input to console
}	
-(void)_format {
	
	for (int i = 0; i < [diceCounter count]; i++) {										//Loop to work through our formatting string
		
		id ArrayCurrent = [diceCounter objectAtIndex:i];								//Create an object using id (no definate class) from the current section
		
		if ([ArrayCurrent isKindOfClass:[NSString class]]) {							//If we have a string
			[displayString appendString:ArrayCurrent];
		}
		
		else {																			//Otherwise
			int j = [[diceCounter objectAtIndex:i] intValue];							//Set the contained value to an int
			if ([[diceCounter objectAtIndex:i+1] isKindOfClass:[NSString class]]) {		//If next object is not another number
				[displayString appendString:[NSString stringWithFormat:@"%d",j]];
			}
			else {																		//Otherwise
				[displayString appendString:[NSString stringWithFormat:@"%d ", j]];		//Append a space with formatting
			}
		}
	}	
}
-(int)_randNum:(int)high {						//This really doesn't need commenting
	int returnVar = (random() % high) + 1;
	return returnVar;
}
-(void)_roll {
	diceSuperArray = [diceString componentsSeparatedByString:@"+"];										//Rip everything apart based on addition
    
	for (int k = 0; k < (int)[diceSuperArray count]; k++) {												//Work through string array with bits of single rolls

		NSArray* diceArray = [[diceSuperArray objectAtIndex:k] componentsSeparatedByString:@"d"];		//Set the sigle roll and parse: 1d6 -> "1","6"
		
		if ([diceArray count] == 1) {																	//Check if it's a dice expression or modifier
				
			int addInt = [[diceArray objectAtIndex:0] intValue];										//rip the string value of the modifer
			diceTotal = [NSNumber numberWithInt:(addInt + [diceTotal intValue])];						//Add onto total
			[diceCounter addObject:@"["];																//Open formatting 
			[diceCounter addObject:[NSNumber numberWithInt:addInt]];									//Attach dice value
			
		}
		
		else {																							//Not a modifer. It's a dice expression (i.e: 1d6)
			
			int diceNumber = [[diceArray objectAtIndex:0] intValue];									//Rip the number of dice to roll to an int
			int diceMax = [[diceArray objectAtIndex:1] intValue];										//Rip the highest face of the dice
			
			NSString *formatting = [NSString stringWithFormat:@"d%d[",diceMax];														//Odd formating stuff here, these lines will craft a string like "d8["
			[diceCounter addObject:formatting];															//Append to our formatting string
			
			for (int j = 0; j < diceNumber; j++) {														//Work through our rolls
				int addedDie = [self _randNum:diceMax];													//Create a random number between 1 & diceMax
				[diceCounter addObject:[NSNumber numberWithInt:addedDie]];								//Craft a NSNumber and add to formatting string
				diceTotal = [NSNumber numberWithInt:([diceTotal intValue] + addedDie)];					//Modify total to include new value
			}
			
		}
		
		if (!(k+1 == (int)[diceSuperArray count])) {													//if we havent worked through the whole expression
			[diceCounter addObject:@"] + "];															//Attach a closing brace and a addtion sign
		}
		
		else {																							//Otherwise
			[diceCounter addObject:@"]"];																//Close the expression
		}
	
	}
}
-(void)_reset {																							//Reset all varibles no explination needed
	diceTotal = [NSNumber numberWithInt:0];																
	diceSuperArray = [NSArray new];
	diceCounter = [NSMutableArray new];
    displayString = [NSMutableString stringWithFormat:@""];
}

@end
