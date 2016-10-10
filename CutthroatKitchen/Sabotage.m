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
//    Sabotage init = [Sabotage initwith:target(s) andCPDamage orMoraleDamage
//damage inflicted is Sabotage.CPDamage/target.counts + moraleDamage/target.counts

//present sabotages and give range that it can damage someone's CP
//present sabotages and give range that it can damage someone's morale
//temp/permanent attribute decreases should not be in this method, but rather at the end of round or new round method
