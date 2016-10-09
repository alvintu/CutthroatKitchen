//
//  ViewController.m
//  CutthroatKitchen
//
//  Created by Jo Tu on 10/4/16.
//  Copyright © 2016 alvorithms. All rights reserved.
//

//a single player with AI text-based game based on cutthroat kitchen


#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) double cookingPower;
@property (nonatomic) double moralePower;
@property (nonatomic) double chanceToWin;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)startGame{
    
    _cookingPower = 0.0;
    _moralePower = 0.0;
    _chanceToWin = 0.0;
    
    NSString *intro = @"welcome to cutthroat kitchen.";
    NSLog(@"%@",intro);
    [self startShopping];
    
    [self presentSabotages];
    [self startBidding];
    
}

-(void)startBidding{
    
}

-(void)presentSabotages{
    
}

-(void)startShopping{
    
}



-(void)test:(NSString*)test{
    
    
}

@end
