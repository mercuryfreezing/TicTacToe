//
//  HelpPageController.m
//  TicTacToe
//
//  Created by roshan on 03/10/2014.
//  Copyright (c) 2014 learningIOS. All rights reserved.
//

#import "HelpPageController.h"

@interface HelpPageController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation HelpPageController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadPage:@"http://en.wikipedia.org/wiki/Tic-tac-toe"];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Helper
-(void)loadPage:(NSString *) urlString{

    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
