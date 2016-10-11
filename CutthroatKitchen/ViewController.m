//
//  ViewController.m
//  CutthroatKitchen
//
//  Created by Jo Tu on 10/4/16.
//  Copyright © 2016 alvorithms. All rights reserved.
//

//a single player with AI text-based game based on cutthroat kitchen


#define ARC4RANDOM_MAX      0x100000000


#import "ViewController.h"
#import "Recipe.h"
#import "Player.h"
#import "Sabotage.h"

@interface ViewController ()

@property (nonatomic) double chanceToWin;
@property (nonatomic) BOOL inAuction;
@property (nonatomic) BOOL sabotageDealt;
@property (nonatomic) NSMutableArray *players;
@property (nonatomic) Player *lastBidder;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Player *player1 = [[Player alloc]initWithName:@"player1"];
    Player *player2 = [[Player alloc]initWithName:@"player2"];
    Player *player3 = [[Player alloc]initWithName:@"player3"];
    Player *player4 = [[Player alloc]initWithName:@"player4"];
    
    _players = [@[player1,player2,player3,player4]mutableCopy];

    
    [self startGame];

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
    self.inAuction = true;
    
    int bid = 500; //starting bid -500

    
    if (self.inAuction){

    
    for(Player *player in self.players){  //allow all Players to bid
        player.canBid = true;
        }
    
    }
    
    
    
    for(Player *player in self.players){
        
    if(player.canBid){
        
    player.numOfBids = arc4random_uniform(3);
        
        //generate number of Bids property using arc4random_uniform;
        //0 bids to max 2 bids

        
        NSLog(@"%i",player.numOfBids);
        
        if( player.numOfBids == 0 || self.lastBidder == player){
            player.canBid = false;
        }

    }
    }
    
    for(Player *player in self.players){
        while(player.numOfBids > 0){
   
    for(Player *player in self.players){
        
        if(player.numOfBids > 0 && self.lastBidder != player){
            float bidChance = ((double)arc4random() / ARC4RANDOM_MAX);
            //amount an AI will bid depends on a percentage
            
            int bidAmount;
            
            if(bidChance >= .90){
                bidAmount = player.wallet * .1;
            }
            else if(bidChance < .90 && bidChance > 0.5){
                bidAmount = player.wallet * .04;
            }
            else{
                bidAmount = player.wallet * .02;
                
            }

         
         

             if(self.lastBidder != player){
            bid += bidAmount;

            
             }

            self.lastBidder = player;
            
            
             
            
            NSLog(@"%@ bids %i",self.lastBidder.name, bid);
            
          


            //start bid = 500; min bid 100; max bid = Player.amountOfMoney * .5
            //50% chance bid (1-10) * 100 //this means 50% chance to raise bid to 100-1000
            //35% chance bid (1-3) * 1000
            //15% chance bid max bid;
            
            player.numOfBids -=1;


            

            if( player.numOfBids == 0){
                player.canBid = false;


            }
            
        }}
        
            
            //the logic is done for AI's bidding against each other
            //but how would this work with one single Player
            //a single Player has an unlimited amount of bids based on his leftover Money
            //you can just set a timer for AI every 2 secs to check if the last bid was theirs...
            //if not, use a bid/if no bids, then AI stop bidding
            //the logic for the actual player has very little to do with the AI;
            //in the view, we can show the current bid in the center
            //and current bids appear and then fade on top of the player's head;
            
            
            
            //bid on sabotage
            //requirements - cannot bid twice in row so track last bid
            //bids can only be 100 to Player.amountOfMoney *.5
        }
    }
    
    
    
    
    



    
    
    
//    if VC.sabotageDealt = true
//    {
    //set VC.inAuction = false
    //for _ in PlayerArray = Player.canBid = false;
    
    //set VC.sabotageDealt = false //resetting the sabotage phase
//}


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
