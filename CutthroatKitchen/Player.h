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
@property (nonatomic) double chanceToWin;

@property (nonatomic,strong) NSString *name;

@end
