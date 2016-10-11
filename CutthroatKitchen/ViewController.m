//
//  ViewController.m
//  CutthroatKitchen
//
//  Created by Jo Tu on 10/4/16.
//  Copyright © 2016 alvorithms. All rights reserved.
//

//a single player with AI text-based game based on cutthroat kitchen


#import "ViewController.h"
#import "Recipe.h"
#import "Player.h"
#import "Sabotage.h"

@interface ViewController ()

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
    
    NSString *intro = @"hello chefs. welcome to cutthroat kitchen.";
    NSString *intro2 = @"You're going to compete in 3 culinary challenges.";
    NSString *intro3 = @"After each challenge, one of you will be eliminated.";
    NSString *intro4 = @"I will assign a dish for each challenge and you will have 30 seconds to shop in our pantry.";
    NSString *intro5 = @"Then, comes the fun part. We're going to have an auction";

    NSString *intro6 = @"You'll have an opportunity to bid on items to inflict discomfort and disadvatange onto your opponent chefs.";
    
     NSString *intro7 = @"Of course, if there's going to be an auction, you gotta have some money. I will make that available to you. I have here, $100,000. Each of you will get $25,000 for bidding";
    
    NSString *intro8 = @"By the way, the last chef last standing will only be able to keep the money they have left over, so bid and spend wisely!";
    



    NSLog(@"%@",intro);
    
    
    
    //everyones
    
    [self presentCulinaryChallenge];
    [self startShopping];
    
    [self presentSabotages];
    [self startAuction];
    [self startCooking];
    [self elimination];
    
}


-(void)presentCulinaryChallenge{
    
    NSMutableArray *inputIngredients = @[@"salt",@"pepper",@"eggs",@"bread",@"ham"];
    
    Recipe *eggsBenedict = [[Recipe alloc]initWithName:@"Eggs Benedict" andIngredients: inputIngredients];
    
    
    NSLog(@"Your 1st challenge will be %@",eggsBenedict.name);
    
    
    
    
    //view - present name of recipe
    
    
    
    //CurrentRecipe should be an object that contains ingredient arrays
    //take all ingredients and place it into an array
    //so many paid apis i might have to make a data loader app to fill maybe 50 recipes
    //with ingredients attribute
    
    
    
}


-(void)startShopping{
    
    NSMutableArray *collectedIngredients;
    
    
    
    //when hit submit button add object into a mutable array
    //match array with recipe.ingredients array
    
    
    //for ingredient in recipe.ingredients{
//    if(enteredText.string = ingredient){
    //shopScore++
    //
    //
    
    //user has 30 secs to shop/type up to 10 items in their basket
    //for each correct item, they get temporary 0.5 CP boost for this round
    
    
    
    //cookingPower += (shopScore*.05);
    //shopScore = nil
}


-(void)presentSabotages{
    
    
Sabotage *noKnives = [[Sabotage alloc]initWithName:@"No Knives" info:@"The selected target will be without knives for the entire round" CPDebuff:5 MoraleDebuff:10];
    
    
    NSLog(@"Haha! Here comes the fun part. This sabotage is called, %@",noKnives.name);
    NSLog(@"Info: %@, Cooking Power Damage: %f, Morale Damage : %f",noKnives.info, noKnives.cookingDebuff,noKnives.moraleDebuff);


}

-(void)startAuction{
    //VC.inAuction = true
    
    //auction----
    //it can be conditional based on current VC's bool
    //if VC.inAuction = true

    
    //startAuction can be a Player property bool that can be set to true when an auction starts
    //for example, for _ in PlayerArray(Player.canBid = true)
    
    
    
    
    
    
    //for _ in PlayerArray(if Player.canBid)
    //Player.amountOfBids = arc4random_uniform(3);
    //if Player.amountOfBids = 0//
    //Player.canBid = false
    
    
    
//    if VC.sabotageDealt = true
//    {
    //set VC.inAuction = false
    //for _ in PlayerArray = Player.canBid = false;
    
    //set VC.sabotageDealt = false //resetting the sabotage phase
//}

    
    //AI will bid based on their hidden AI attribute frugality
    //0 bids to max 3 bids
    
    
    
//start bid = 500; min bid 100; max bid = Player.amountOfMoney * .5
//50% chance bid (1-10) * 100 //this means 50% chance to raise bid to 100-1000
//35% chance bid (1-3) * 1000
//15% chance bid max bid;
    

     //one of the debuffs is losing money
    [self applyDebuffs];
    
    
    
    
}


-(void)applyDebuffs{
    
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
    //remove Player from Player Array
    
}











@end
