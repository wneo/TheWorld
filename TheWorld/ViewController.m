//
//  ViewController.m
//  TheWorld
//
//  Created by neo on 13-12-13.
//  Copyright (c) 2013年 neo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet SKView *skView;
@property (weak, nonatomic) IBOutlet UIImageView *gameLogo;
@property (weak, nonatomic) IBOutlet UIImageView *gameName;
@property (weak, nonatomic) IBOutlet UIButton *archerButton;
@property (weak, nonatomic) IBOutlet UIButton *warriorButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingProcessIndicator;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.loadingProcessIndicator startAnimating];
	//SKView *spriteView = (SKView *)self.view;
	//spriteView.showsFPS = YES;
	//spriteView.showsNodeCount = YES;
	//spriteView.showsDrawCount = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
