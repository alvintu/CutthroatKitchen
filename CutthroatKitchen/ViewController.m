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
    
    NSString *intro = @"hello chefs. welcome to cutthroat kitchen.";
    NSString *intro2 = @"You're going to compete in 3 culinary challenges.";
    NSString *intro3 = @"After each challenge, one of you will be eliminated.";
    NSString *intro4 = @"I will assign a dish for each challenge and you will have 30 seconds to shop in our pantry.";
    NSString *intro5 = @"Then, comes the fun part. We're going to have an auction";

    NSString *intro6 = @"You'll have an opportunity to bid on items to inflict discomfort and disadvatange onto your opponent chefs.";
    
     NSString *intro7 = @"Of course, if there's going to be an auction, you gotta have some money. I will make that available to you. I have here, $100,000. Each of you will get $25,000 for bidding";
    
    NSString *intro8 = @"By the way, the last chef last standing will only be able to keep the money they have left over, so bid and spend wisely!";
    



    NSLog(@"%@",intro);
    
    
    [self presentCulinaryChallenge];
    [self startShopping];
    
    [self presentSabotages];
    [self startBidding];
    
    [self startCooking];
    [self elimination];
    
}


-(void)presentCulinaryChallenge{
    
    //present recipe from  bigOvenAPI
    //Here's a sample response for GET /recipe/530115
    
    

    
    
    
}


-(void)startShopping{
    
    //user has 30 secs to shop/type up to 10 items in their basket
    
    
}


-(void)presentSabotages{
    //present sabotages and give range that it can damage someone's CP temporarily
    //present sabotages and give range that it can damage someone's morale for rest of round

    
}

-(void)startBidding{
    
    //AI will bid based on their hidden AI attribute frugality
    //0 bids to max 3 bids

    
}

-(void)startCooking{
    
    //30 seconds
    //random food objects appear to test your hand -eye coordination
    //something like fruit ninja, you can only touch the food items
    //the more food items you get the highest the multiplier will be (50 consecutive items will net you 1.50x bonus towards your CP)
    //random stuff like bugs, roaches, plants, clothing will appear
    //if you hit the non-food items you will get an
    
}






-(void)elimination{
    
    //eliminate the person with the lowest % chance to win
    //chance to win is calculated by (endOfRoundCP * multiplier) + morale
    //everyone starts with 100% morale, everyone's CP is a range of 65-75
    
}











@end
