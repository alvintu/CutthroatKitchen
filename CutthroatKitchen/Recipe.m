//
//  Recipe.m
//  CutthroatKitchen
//
//  Created by Jo Tu on 10/9/16.
//  Copyright © 2016 alvorithms. All rights reserved.
//

#import "Recipe.h"

@implementation Recipe

-(id)initWithName:(NSString*)name andIngredients:(NSMutableArray*)ingredients{
    self = [super init];
        
        _name = name;
        _ingredients = ingredients;
    
    return self;
}


@end
