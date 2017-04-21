//
//  SubscribeTokenDataSourceDelegate.h
//  qtum wallet
//
//  Created by Никита Федоренко on 03.03.17.
//  Copyright © 2017 Designsters. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Spendable.h"

@interface SubscribeTokenDataSourceDelegate : NSObject <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) NSArray <Spendable>* tokensArray;

@end
