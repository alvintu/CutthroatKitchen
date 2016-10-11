//
//  Recipe.h
//  CutthroatKitchen
//
//  Created by Jo Tu on 10/9/16.
//  Copyright © 2016 alvorithms. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject

-(id)initWithName:(NSString*)name andIngredients:(NSMutableArray*)ingredients;

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSMutableArray *ingredients;


@end
