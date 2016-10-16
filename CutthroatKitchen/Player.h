//
//  Player.h
//  CutthroatKitchen
//
//  Created by Jo Tu on 10/9/16.
//  Copyright © 2016 alvorithms. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject


-(id)initWithName:(NSString*)name;

@property (nonatomic) double cookingPower;
@property (nonatomic) double moralePower;
@property (nonatomic) double score;

@property (nonatomic,strong) NSString *name;
@property (nonatomic) BOOL canBid;
@property (nonatomic) int numOfBids;
@property (nonatomic) int wallet;


@end
