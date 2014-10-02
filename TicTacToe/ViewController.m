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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.count = 1;

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
    UILabel *temp = [self findLabelUsingPoint:tappedPoint];

    if(temp == self.labelOne)
    {
        [self makeChanges:self.labelOne];
    }
    if(temp == self.labelTwo)
    {
        [self makeChanges:self.labelTwo];
    }
    if(temp == self.labelThree)
    {
        [self makeChanges:self.labelThree];
    }
    if(temp == self.labelFour)
    {
        [self makeChanges:self.labelFour];
    }
    if(temp == self.labelFive)
    {
        [self makeChanges:self.labelFive];
    }
    if(temp == self.labelSix)
    {
        [self makeChanges:self.labelSix];
    }
    if(temp == self.labelSeven)
    {
        [self makeChanges:self.labelSeven];
    }
    if(temp == self.labelEight)
    {
        [self makeChanges:self.labelEight];
    }
    if(temp == self.labelNine)
    {
        [self makeChanges:self.labelNine];
    }
}

-(void) makeChanges:(UILabel *) labelToMakeChanges
{

    if(self.count % 2 == 0)
    {
        labelToMakeChanges.text = @"X";
        labelToMakeChanges.textColor = [UIColor redColor];
    }
    else
    {
        labelToMakeChanges.text = @"O";
        labelToMakeChanges.textColor = [UIColor blueColor];
    }
    self.count++;

}

}



@end
