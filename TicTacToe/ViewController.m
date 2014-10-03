//
//  ViewController.m
//  TicTacToe
//
//  Created by roshan on 02/10/2014.
//  Copyright (c) 2014 learningIOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelOne;
@property (weak, nonatomic) IBOutlet UILabel *labelTwo;
@property (weak, nonatomic) IBOutlet UILabel *labelThree;
@property (weak, nonatomic) IBOutlet UILabel *labelFour;
@property (weak, nonatomic) IBOutlet UILabel *labelFive;
@property (weak, nonatomic) IBOutlet UILabel *labelSix;
@property (weak, nonatomic) IBOutlet UILabel *labelSeven;
@property (weak, nonatomic) IBOutlet UILabel *labelEight;
@property (weak, nonatomic) IBOutlet UILabel *labelNine;
@property (weak, nonatomic) IBOutlet UILabel *whichPlayerLabel;
@property int count;
@property (weak, nonatomic) IBOutlet UILabel *whoWon;
@property (weak, nonatomic) IBOutlet UILabel *xDragLabel;
@property (weak, nonatomic) IBOutlet UILabel *yDragLabel;

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;

@property (nonatomic, strong) NSTimer *theTimer;

@property (weak, nonatomic) IBOutlet UILabel *minutesDisplay;
@property (weak, nonatomic) IBOutlet UILabel *secondsDisplay;
@property int seconds;
@property int minutes;


@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.count = 1;
    self.whichPlayerLabel.text = @"TURN: O";

    [NSTimer scheduledTimerWithTimeInterval:1.0                                     target:self
                                   selector:@selector(timerFire:)
                                   userInfo:nil
                                    repeats:YES];

                  self.seconds = 0;
                  self.minutes = 0;


}

-(void) timerFire:(NSTimer *) timer{

    self.seconds++;
    if (self.seconds == 60) {
        self.minutes++;
        self.seconds = 0;
    }

    self.secondsDisplay.text = [NSString stringWithFormat:@"sec:%d", self.seconds];
    self.minutesDisplay.text = [NSString stringWithFormat:@"min:%d", self.minutes];


}



-(UILabel *) findLabelUsingPoint:(CGPoint) point
{
    UILabel *pointOnLabel = [[UILabel alloc] init];

         if(CGRectContainsPoint(self.labelOne.frame, point))
             {
                 pointOnLabel = self.labelOne;
             }
        else if(CGRectContainsPoint(self.labelTwo.frame, point))
            {
                    pointOnLabel = self.labelTwo;
            }
        else if(CGRectContainsPoint(self.labelThree.frame, point))
            {
                pointOnLabel = self.labelThree;
            }
        else if(CGRectContainsPoint(self.labelFour.frame, point))
            {
                pointOnLabel = self.labelFour;
            }
        else if(CGRectContainsPoint(self.labelFive.frame, point))
            {
                pointOnLabel = self.labelFive;
            }
        else if(CGRectContainsPoint(self.labelSix.frame, point))
            {
                pointOnLabel = self.labelSix;
            }
        else if(CGRectContainsPoint(self.labelSeven.frame, point))
            {
                pointOnLabel = self.labelSeven;
            }
        else if(CGRectContainsPoint(self.labelEight.frame, point))
            {
                pointOnLabel = self.labelEight;
            }
        else if(CGRectContainsPoint(self.labelNine.frame, point))
            {
                pointOnLabel = self.labelNine;
            }

    return pointOnLabel;
}

-(IBAction) onLabelTapped:(UITapGestureRecognizer *) tapGesture{


    CGPoint tappedPoint = [tapGesture locationInView:self.view];
    UILabel *labelIdentifiedFromTap = [self findLabelUsingPoint:tappedPoint];
    [self makeChangesCheckGameResult:labelIdentifiedFromTap];
}

-(IBAction) onDrag:(UIPanGestureRecognizer *) panGesture{


    if([panGesture state] == UIGestureRecognizerStateEnded)
    {

        CGPoint point = [panGesture locationInView:self.view];

        if(self.count % 2)
        {
            self.yDragLabel.center = point;
            UILabel *labelIdentifiedFromPanGesture = [self findLabelUsingPoint:point];
            [self makeChangesCheckGameResult:labelIdentifiedFromPanGesture];
        }
        else
        {
            self.xDragLabel.center = point;
            UILabel *labelIdentifiedFromPanGesture = [self findLabelUsingPoint:point];
            [self makeChangesCheckGameResult:labelIdentifiedFromPanGesture];
        }

    }
    else
    {
        CGPoint point = [panGesture locationInView:self.view];
        if(self.count % 2)
        {
            self.yDragLabel.center = point;

        }
        else
        {
            self.xDragLabel.center = point;
        }
    }

}

-(void) makeChangesCheckGameResult:(UILabel *) temp
{

    if(temp == self.labelOne)
    {
        [self makeChanges:self.labelOne];
        [self checkGameResult];
    }
    if(temp == self.labelTwo)
    {
        [self makeChanges:self.labelTwo];
        [self checkGameResult];
    }
    if(temp == self.labelThree)
    {
        [self makeChanges:self.labelThree];
        [self checkGameResult];
    }
    if(temp == self.labelFour)
    {
        [self makeChanges:self.labelFour];
        [self checkGameResult];
    }
    if(temp == self.labelFive)
    {
        [self makeChanges:self.labelFive];
        [self checkGameResult];
    }
    if(temp == self.labelSix)
    {
        [self makeChanges:self.labelSix];
        [self checkGameResult];
    }
    if(temp == self.labelSeven)
    {
        [self makeChanges:self.labelSeven];
        [self checkGameResult];
    }
    if(temp == self.labelEight)
    {
        [self makeChanges:self.labelEight];
        [self checkGameResult];
    }
    if(temp == self.labelNine)
    {
        [self makeChanges:self.labelNine];
        [self checkGameResult];
    }

}

-(void) makeChanges:(UILabel *) labelToMakeChanges
{

    if(self.count % 2 == 0)
    {
        labelToMakeChanges.text = @"X";
        labelToMakeChanges.textColor = [UIColor redColor];
        self.whichPlayerLabel.text = @"TURN: O";

    }
    else
    {
        labelToMakeChanges.text = @"O";
        labelToMakeChanges.textColor = [UIColor blueColor];
        self.whichPlayerLabel.text = @"TURN: X";

    }
    self.count++;

}

-(void) checkGameResult{


    if(([self.labelOne.text isEqualToString: self.labelTwo.text]) && ([self.labelTwo.text isEqualToString:self.labelThree.text]))
        {
        NSString *winnerText = [NSString stringWithFormat:@"%@", self.labelThree.text];
        [self showWinner:winnerText];
        NSLog(@"%d", (int)[winnerText length]);

        }

    else if(([self.labelFour.text isEqualToString: self.labelFive.text]) && ([self.labelFive.text isEqualToString:self.labelSix.text]))
        {
            NSString *winnerText = [NSString stringWithFormat:@"%@", self.labelSix.text];
            [self showWinner:winnerText];

        }
    else if(([self.labelSeven.text isEqualToString: self.labelEight.text]) && ([self.labelEight.text isEqualToString:self.labelNine.text]))
        {
            NSString *winnerText = [NSString stringWithFormat:@"%@", self.labelNine.text];
            [self showWinner:winnerText];

        }
    else if(([self.labelOne.text isEqualToString: self.labelFour.text]) && ([self.labelFour.text isEqualToString:self.labelSeven.text]))
        {
            NSString *winnerText = [NSString stringWithFormat:@"%@", self.labelSeven.text];
            [self showWinner:winnerText];

        }
    else if(([self.labelTwo.text isEqualToString: self.labelFive.text]) && ([self.labelFive.text isEqualToString:self.labelEight.text]))
        {
           NSString *winnerText = [NSString stringWithFormat:@"%@", self.labelEight.text];
            [self showWinner:winnerText];

        }
    else if(([self.labelThree.text isEqualToString: self.labelSix.text]) && ([self.labelSix.text isEqualToString:self.labelNine.text]))
        {
            NSString *winnerText = [NSString stringWithFormat:@"%@", self.labelNine.text];
            [self showWinner:winnerText];

        }
    else if(([self.labelOne.text isEqualToString: self.labelTwo.text]) && ([self.labelFive.text isEqualToString:self.labelNine.text]))
        {
            NSString *winnerText = [NSString stringWithFormat:@"%@", self.labelNine.text];
            [self showWinner:winnerText];

        }
}

-(void) showWinner:(NSString *) whoWonString {

    UIAlertView *winnerAlert = [[UIAlertView alloc] init];
    winnerAlert.delegate = self;


    if([whoWonString length] > 0)
    {
        winnerAlert.title = [NSString stringWithFormat:@"%@ %@", whoWonString, @"WINS THIS ROUND!!"];
        [winnerAlert addButtonWithTitle:@"Play Again"];
        [winnerAlert show];
        self.whoWon.text = @"";
        [self resetGame];

    }

}

-(void) resetGame{
    self.labelOne.text = @"";
    self.labelTwo.text = @"";
    self.labelThree.text = @"";
    self.labelFour.text = @"";
    self.labelFive.text = @"";
    self.labelSix.text = @"";
    self.labelSeven.text = @"";
    self.labelEight.text = @"";
    self.labelNine.text = @"";

    self.count = 1;
    self.whichPlayerLabel.text = @"TURN O";

    self.seconds = 0;
    self.minutes = 0;

}



@end
