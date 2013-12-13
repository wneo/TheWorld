//
//  MultiplayerLayeredCharacterScene.m
//  TheWorld
//
//  Created by neo on 13-12-13.
//  Copyright (c) 2013年 neo. All rights reserved.
//

#import "MultiplayerLayeredCharacterScene.h"
#import "Player.h"

@interface MultiplayerLayeredCharacterScene ()
@property (nonatomic) NSMutableArray *players;
@property (nonatomic) Player *defaultPlayer;
@property (nonatomic) SKNode *world;
@property (nonatomic) NSMutableArray *layers;


@property (nonatomic) NSMutableArray *hudAvatars;              // keep track of the various nodes for the HUD
@property (nonatomic) NSMutableArray *hudLabels;               // - there are always 'kNumPlayers' instances in each array
@property (nonatomic) NSMutableArray *hudScores;
@property (nonatomic) NSMutableArray *hudLifeHeartArrays;      // an array of NSArrays of life hearts

@end


@implementation MultiplayerLayeredCharacterScene

#pragma mark - Initialization
- (instancetype)initWithSize:(CGSize)size
{
	self = [super initWithSize:size];
	if (self) {
		self.players = [NSMutableArray arrayWithCapacity:kNumPlayers];
		self.defaultPlayer = [[Player alloc] init];
		[self.players addObject:self.defaultPlayer];
		
		self.world = [[SKNode alloc] init];
		self.world.name = @"world";
		
		self.layers = [NSMutableArray arrayWithCapacity:kWorldLayerCount];
		for (int i = 0; i < kWorldLayerCount; i++) {
			SKNode *layer = [[SKNode alloc] init];
			layer.zPosition = i - kWorldLayerCount;
			[self.world addChild:layer];
			[self.layers addObject:layer];
		}
		
		[self addChild:self.world];
		[self buildHUD];
	}
	return self;
}

#pragma mark - HUD and Scores
- (void)buildHUD
{
	NSString *iconNames[] = {@"iconWarrior_blue", @"iconWarrior_green", @"iconWarrior_pink", @"iconWarrior_red"};
	NSArray *colors = @[ [SKColor greenColor], [SKColor blueColor], [SKColor yellowColor], [SKColor redColor] ];
	CGFloat hudX = 30;
    CGFloat hudY = self.frame.size.height - 30;
    CGFloat hudD = self.frame.size.width / kNumPlayers;
	
	self.hudAvatars = [NSMutableArray arrayWithCapacity:kNumPlayers];
	self.hudLabels = [NSMutableArray arrayWithCapacity:kNumPlayers];
    self.hudScores = [NSMutableArray arrayWithCapacity:kNumPlayers];
	self.hudLifeHeartArrays = [NSMutableArray arrayWithCapacity:kNumPlayers];
	
	SKNode *hud = [[SKNode alloc] init];
	
	for (int i = 0; i < kNumPlayers; i++) {
		SKSpriteNode *avatar = [SKSpriteNode spriteNodeWithImageNamed:iconNames[i]];
		avatar.scale = 0.5;
        avatar.alpha = 0.5;
		avatar.position = CGPointMake(hudX + i * hudD + (avatar.size.width * 0.5), self.frame.size.height - avatar.size.height * 0.5 - 8 );
		[self.hudAvatars addObject:avatar];
		[hud addChild:avatar];
		
		SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Copperplate"];
        label.text = @"NO PLAYER";
        label.fontColor = colors[i];
        label.fontSize = 16;
        label.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
        label.position = CGPointMake(hudX + i * hudD + (avatar.size.width * 1.0), hudY + 10 );
        [self.hudLabels addObject:label];
        [hud addChild:label];
		
		SKLabelNode *score = [SKLabelNode labelNodeWithFontNamed:@"Copperplate"];
        score.text = @"SCORE: 0";
        score.fontColor = colors[i];
        score.fontSize = 16;
        score.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
        score.position = CGPointMake(hudX + i * hudD + (avatar.size.width * 1.0), hudY - 40 );
        [self.hudScores addObject:score];
        [hud addChild:score];
		
		[self.hudLifeHeartArrays addObject:[NSMutableArray arrayWithCapacity:kStartLives]];
        for (int j = 0; j < kStartLives; j++) {
            SKSpriteNode *heart = [SKSpriteNode spriteNodeWithImageNamed:@"lives.png"];
            heart.scale = 0.4;
            heart.position = CGPointMake(hudX + i * hudD + (avatar.size.width * 1.0) + 18 + ((heart.size.width + 5) * j), hudY - 10);
            heart.alpha = 0.1;
            [self.hudLifeHeartArrays[i] addObject:heart];
            [hud addChild:heart];
        }
	}
	[self addChild:hud];
}
#pragma mark - Shared Assets
+ (void)loadSceneAssetsWithCompletionHandler:(APAAssetLoadCompletionHandler)handler
{
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
		[self loadSceneAssets];
		
		if (handler) {
			dispatch_async(dispatch_get_main_queue(), ^{
				handler();
			});
		}
	});
	
}

+ (void)loadSceneAssets {
    // Overridden by subclasses.
}
@end
