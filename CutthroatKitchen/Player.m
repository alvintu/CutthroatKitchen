//
//  Player.m
//  CutthroatKitchen
//
//  Created by Jo Tu on 10/9/16.
//  Copyright © 2016 alvorithms. All rights reserved.
//
#include <stdlib.h>

#import "Player.h"

@implementation Player


-(id)initWithName:(NSString*)name{
    self = [super init];
    
    _name = name;
    
    _wallet = 25000;
    double randomGen = arc4random_uniform(20);
    
    
    
    
    _cookingPower =  50 + randomGen; //random cooking Power from 50 to 69
    _moralePower = 100;
    _chanceToWin =  0;
    
    
    return self;
    
}
@end
