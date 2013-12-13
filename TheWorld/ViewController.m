//
//  ViewController.m
//  TheWorld
//
//  Created by neo on 13-12-13.
//  Copyright (c) 2013年 neo. All rights reserved.
//

#import "ViewController.h"
#import "TheWorldScene.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet SKView *skView;
@property (weak, nonatomic) IBOutlet UIImageView *gameLogo;
@property (weak, nonatomic) IBOutlet UIImageView *gameName;
@property (weak, nonatomic) IBOutlet UIButton *archerButton;
@property (weak, nonatomic) IBOutlet UIButton *warriorButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingProcessIndicator;

@property (nonatomic) TheWorldScene *scene;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.loadingProcessIndicator startAnimating];
	[TheWorldScene loadSceneAssetsWithCompletionHandler:^{
		CGSize viewSize = self.view.bounds.size;
		TheWorldScene *scene = [[TheWorldScene alloc] initWithSize:viewSize];
		scene.scaleMode = SKSceneScaleModeAspectFill;
		
		self.scene = scene;
		[self.skView presentScene:scene];
	}];
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
#pragma mark - UI Display and Actions
- (void)hideUIElements:(BOOL)shouldHide animated:(BOOL)shouldAnimate {
    CGFloat alpha = shouldHide ? 0.0f : 1.0f;
    
    if (shouldAnimate) {
        [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.gameLogo.alpha = alpha;
            self.archerButton.alpha = alpha;
            self.warriorButton.alpha = alpha;
			self.gameName.alpha = alpha;
        } completion:NULL];
    } else {
        self.gameLogo.alpha = alpha;
		self.archerButton.alpha = alpha;
		self.warriorButton.alpha = alpha;
		self.gameName.alpha = alpha;
    }
}
- (IBAction)pressAbort:(id)sender
{
}
- (IBAction)pressStart:(id)sender
{
	[self startGame];
}
- (void)startGame
{
	[self hideUIElements:YES animated:YES];
}
@end
