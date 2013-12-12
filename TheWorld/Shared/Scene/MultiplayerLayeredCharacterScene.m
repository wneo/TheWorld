//
//  MultiplayerLayeredCharacterScene.m
//  TheWorld
//
//  Created by neo on 13-12-13.
//  Copyright (c) 2013年 neo. All rights reserved.
//

#import "MultiplayerLayeredCharacterScene.h"
@interface MultiplayerLayeredCharacterScene ()
@property (nonatomic) NSMutableArray *players;

@end


@implementation MultiplayerLayeredCharacterScene
- (instancetype)initWithSize:(CGSize)size
{
	self = [super initWithSize:size];
	if (self) {
		self.players = [NSMutableArray arrayWithCapacity:kNumPlayers];
		
	}
	return self;
}
@end
