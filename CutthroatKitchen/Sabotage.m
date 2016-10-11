//
//  Sabotage.m
//  CutthroatKitchen
//
//  Created by Jo Tu on 10/9/16.
//  Copyright © 2016 alvorithms. All rights reserved.
//

#import "Sabotage.h"

@implementation Sabotage

-(id)initWithName:(NSString*)name info:(NSString*)info CPDebuff:(double)CPDebuff MoraleDebuff:(double)moraleDebuff{
    
    self = [super init];
    
    _name  = name;
    _info = info;
    _cookingDebuff = CPDebuff;
    _moraleDebuff = moraleDebuff;
    
    return self;
}

@end
