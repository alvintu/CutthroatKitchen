//
//  ViewController.m
//  CutthroatKitchen
//
//  Created by Jo Tu on 10/4/16.
//  Copyright © 2016 alvorithms. All rights reserved.
//

//a single player with AI text-based game based on cutthroat kitchen


#define ARC4RANDOM_MAX      0x100000000
#include <stdlib.h>


#import "ViewController.h"
#import "Recipe.h"
#import "Player.h"
#import "Sabotage.h"

@interface ViewController ()

@property (nonatomic) double chanceToWin;
@property (nonatomic) BOOL inAuction;
@property (nonatomic) BOOL sabotageDealt;
@property (nonatomic) NSMutableArray *players;
@property (nonatomic) NSMutableArray *sabotageList;
@property (nonatomic) NSMutableArray *biddingList;

@property (nonatomic) Player *lastBidder;
@property (nonatomic) Recipe *currentChallenge;
@property (nonatomic) Sabotage *currentSabotage;
@property (nonatomic) Player *mainPlayer;
@property (nonatomic) Player *currentTarget;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Player *player1 = [[Player alloc]initWithName:@"player1"];
    
    //player1 is me//send a textfield entry into this name init
    
    Player *player2 = [[Player alloc]initWithName:@"player2"];
    Player *player3 = [[Player alloc]initWithName:@"player3"];
    Player *player4 = [[Player alloc]initWithName:@"player4"];
    
    _mainPlayer = player1;
    
    
    
//    player1.cookingPower = 
    
    _players = [@[player1,player2,player3,player4]mutableCopy];
    
    _sabotageList = [@[player1,player2,player3,player4]mutableCopy];

    
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
    
//    [self presentCulinaryChallenge];
//    [self startShopping];
//    
    [self presentSabotages];
    [self startAuction];
    [self startCooking];
    [self elimination];
    
}


-(void)presentCulinaryChallenge{
    
    NSMutableArray *inputIngredients = [@[@"salt",@"pepper",@"eggs",@"bread",@"ham"]mutableCopy];
    
    Recipe *eggsBenedict = [[Recipe alloc]initWithName:@"Eggs Benedict" andIngredients: inputIngredients];
    
    
    NSLog(@"Your 1st challenge will be %@",eggsBenedict.name);
    
    
    
    self.currentChallenge = eggsBenedict;
    //view - present name of recipe
    
    
    
    //CurrentRecipe should be an object that contains ingredient arrays
    //take all ingredients and place it into an array
    //so many paid apis i might have to make a data loader app to fill maybe 50 recipes
    //with ingredients attribute
    
    
    
}


-(void)startShopping{
    
    double shopScore = 0;

    
    NSMutableArray *collectedIngredients = [[NSMutableArray alloc]init];
    
    [collectedIngredients addObject:@"salt"];
    [collectedIngredients addObject:@"poop"];
    [collectedIngredients addObject:@"eggs"];
    
    NSLog(@"collectedIngredients :  %@",collectedIngredients);
    
    
    
    NSLog(@"challengeIngredients : %@",_currentChallenge);

    
    //when hit submit button add object into a mutable array
    //match array with recipe.ingredients array
    
    
    for (NSString* challengeIngredient in self.currentChallenge.ingredients){
        for(NSString* myIngrediient in collectedIngredients){
    if([myIngrediient isEqualToString:challengeIngredient]){
        shopScore++;
    }
            
        
        }
    }
    
    double cookingPower = 0;
    cookingPower += shopScore;
    
    
    
    
    NSLog(@"shopScore is %f, therefore cookingPower is %.02f",shopScore,cookingPower);
    
    
    //user has 30 secs to shop/type up to maximum of 10 items in their basket
    //for each correct item, they get temporary 0.5 CP boost for this round
    
    
    
    //cookingPower += (shopScore*.5);
    //shopScore = nil
    
    
    
    for(Player *player in  _players){
        NSLog(@"%@ cookingPower is %f", player.name, player.cookingPower);
    };
    
    _mainPlayer.cookingPower += cookingPower;
    
    
    
    NSLog(@"%@ cookingPower is %f", _mainPlayer.name, _mainPlayer.cookingPower);


}


-(void)presentSabotages{
    
    
Sabotage *noKnives = [[Sabotage alloc]initWithName:@"No Knives" info:@"The selected target will be without knives for the entire round" CPDebuff:5 MoraleDebuff:10];
    
    _currentSabotage = noKnives;
    
    
    NSLog(@"Haha! Here comes the fun part. This sabotage is called, %@",noKnives.name);
    NSLog(@"Info: %@, Cooking Power Damage: %f, Morale Damage : %f",noKnives.info, noKnives.cookingDebuff,noKnives.moraleDebuff);


}

-(void)startAuction{
    
    _biddingList = [[NSMutableArray alloc]init];
    self.inAuction = true; //start viewconroller's action sequence
    
    int bid = 500; //starting bid 500

    
        for(Player *player in self.players){ //alow all players to have a chance to bid
            player.canBid = true;
            [_biddingList addObject:player];
        }

    
    
    for(Player *player in self.players){
        
    if(player.canBid){
        
    player.numOfBids = arc4random_uniform(8);   //roll players intended amount of times to bid
        
        
        NSLog(@"\n%@ intends on bidding %i times",player.name,player.numOfBids);
        
        if( player.numOfBids == 0){
            player.canBid = false;
            [_biddingList removeObject:player];

        }

    }
    }
    
    
//    for(Player *player in self.players){

    NSLog(@"bidding list countis  %lu",(unsigned long)_biddingList.count);
//    while(player.numOfBids > 0 ){  //while we're in auction
    
    while(_biddingList.count > 1){
    
        
  
        
        
        for(Player *player in self.players){

    
        
        if(self.lastBidder == player){  //if the last bidder is the current player they can't bid
            self.lastBidder.canBid = NO;
        }
        
        
    if(player.canBid){
            
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
            
            bid += bidAmount;

        self.lastBidder = player;

            NSLog(@"%@ bids %i",self.lastBidder.name, bid);


            player.numOfBids -=1;
        
        if(_biddingList.count == 1){
            break;
        }



            if( player.numOfBids == 0){
                player.canBid = false;
                NSLog(@"%@ will be removed because he has %i bids left",player.name,player.numOfBids);
                [_biddingList removeObject:player];

            }
            

        
        
}
        
    }
    
//    }
    }
    

    
    NSLog(@" count of bidding list is %lu",_biddingList.count);
    
    self.lastBidder = _biddingList.firstObject;
    
    
        self.lastBidder.wallet -= bid;

        //deduct $ from wallet when bid is won
        
        NSLog(@"%@ is the winner of the sabotage",self.lastBidder.name);
        NSLog(@"%@ has $%i left",self.lastBidder.name, self.lastBidder.wallet);

    
    
    
        
    

    
    
    
    
    [_sabotageList removeObject:self.lastBidder];
    
    
    
    int countOfPotentialTargets =(int) _sabotageList.count;
    int randomGen = arc4random_uniform(countOfPotentialTargets);
    
    _currentSabotage.target =  [_players objectAtIndex:randomGen];


    
    NSLog(@"%@ cookingPower was %.02f and morale was %.02f",_currentSabotage.target.name,_currentSabotage.target
          .cookingPower,_currentSabotage.target
          .moralePower);
    
//random player? player1 can select
    
    _currentSabotage.target.cookingPower -= _currentSabotage.cookingDebuff;
    _currentSabotage.target.moralePower -= _currentSabotage.moraleDebuff;

    
    NSLog(@"%@ cookingPower is now  %.02f and moralePower is  now %.02f",_currentSabotage.target.name,_currentSabotage.target
          .cookingPower,_currentSabotage.target
          .moralePower);
    //give player1 to random select target
    //or another method to press a player to apply debuffs
    //for now lets do it randomly to simplicity
    
    


    [self applyDebuffs];
    
    
    
    
}


-(void)applyDebuffs{
    
    
    
}

-(void)startCooking{
    //cooking scene needs to be done last because it contains things i do not know yet
    
    
    
    
    //30 seconds
    //random food objects appear to test your hand -eye coordination
    //something like fruit ninja, you can only touch the food items
    //the more food items you get the highest the multiplier will be (50 consecutive items will net you 1.50x bonus towards your CP)
    //random stuff like bugs, roaches, plants, clothing will appear
    //if you hit the non-food items you will get an
    
}






-(void)elimination{
    
    NSMutableArray *scores = [[NSMutableArray alloc]init];
    
    
    
    for(Player *player in self.players){
        player.score =  player.cookingPower * player.moralePower;
        
        [scores addObject:[NSNumber numberWithDouble:player.score]];
        
//        NSLog(@"%f",player.chanceToWin);
    }
    //eliminate the person with the lowest % chance to win
    //chance to win is calculated by (endOfRoundCP * multiplier) + morale
    //everyone starts with 100% morale, everyone's CP is a range of 65-75
    //remove Player from Player Array
//    
//    small = element[0]
//    for each element in array, starting from 1 (not 0):
//        if (element < small)
//            small = element
//            
//            
    //time complexity is (O)n
    
    NSNumber *lowestScore = scores[0];
    for(NSNumber *score in scores){
        NSLog(@"%@",score);

        
        if (score < lowestScore){
            
            
            lowestScore = score;
            
        }
        
        
    }

    
    NSLog(@"lowestScore is %@",lowestScore);
    
    NSMutableArray *tempCopy =  [[NSMutableArray alloc]init];
    tempCopy = [self.players mutableCopy];
    
    
    for(Player *player in tempCopy){
        if([NSNumber numberWithDouble:player.score] == lowestScore){
//
            NSLog(@"%@ has the lowest score with a score of : %f",player.name, player.score);
            [self.players removeObject:player]; //remove player with lowest score
//
          
//
        }
    }
    
    for(Player *player in self.players){
        NSLog(@"%@",player.name);
    }
    
}





@end
