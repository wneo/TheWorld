//
//  MultiplayerLayeredCharacterScene.h
//  TheWorld
//
//  Created by neo on 13-12-13.
//  Copyright (c) 2013年 neo. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>


#define kNumPlayers 4

typedef enum : uint8_t {
	WorldLayerGround = 0,
	WorldLayerBelowCharacter,
	WorldLayerCharacter,
	WorldLayerAboveCharacter,
	WorldLayerTop,
	kWorldLayerCount
} WorldLayer;

/* Completion handler for callback after loading assets asynchronously. */
typedef void (^APAAssetLoadCompletionHandler)(void);

@interface MultiplayerLayeredCharacterScene : SKScene

#pragma mark - HUD and Scores
- (void)buildHUD;

#pragma mark - Shared Assets
+ (void)loadSceneAssetsWithCompletionHandler:(APAAssetLoadCompletionHandler)handler;
@end
