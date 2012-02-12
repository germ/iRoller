//
//  iRollerViewController.h
//  iRoller
//
//  Created by Germ on 10-08-05.
//  Copyright Melville Comprehensive School 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiceRoll.h"

@interface iRollerViewController : UIViewController {
    IBOutlet UITextField* DiceInput;
    IBOutlet UIButton* RollerButton;
    IBOutlet UILabel* DiceDisplay;
    IBOutlet UILabel* DiceSegment;
    IBOutlet UIButton* SideButton;
    IBOutlet UIButton* PlusButton;
    DiceRoll* diceRoller;
}

@property (retain, nonatomic) IBOutlet UITextField* DiceInput;
@property (retain, nonatomic) IBOutlet UILabel* DiceDisplay;
@property (retain, nonatomic) IBOutlet UILabel* DiceSegment;
@property (retain, nonatomic) IBOutlet UIButton* RollerButton;
@property (retain, nonatomic) IBOutlet UIButton* SideButton;
@property (retain, nonatomic) IBOutlet UIButton* PlusButton;
@property (retain, nonatomic) DiceRoll* diceRoller;


-(IBAction)Roll:(id)sender;
-(IBAction)ProcessInput:(id)sender;
-(IBAction)AddSideSymbol;
-(IBAction)AddPlusSymbol;


@end

