//
//  HistoryViewController.m
//  qtum wallet
//
//  Created by Никита Федоренко on 27.12.16.
//  Copyright © 2016 Designsters. All rights reserved.
//

#import "HistoryViewController.h"
#import "WalletHistoryDelegateDataSource.h"
#import "WalletCoordinator.h"


@interface HistoryViewController ()

@property (nonatomic,assign) BOOL historyLoaded;
@property (nonatomic, strong) NSArray *historyArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self.delegateDataSource;
    self.tableView.dataSource = self.delegateDataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self actionRefreshButton:nil];
}

#pragma mark - Actions

- (IBAction)actionRefreshButton:(id)sender
{
    [SVProgressHUD show];
    [self getHistory];
}

#pragma mark - Private Methods

- (void)getHistory
{
    self.historyLoaded = NO;
    [self.delegate refreshTableViewData];
}

#pragma mark - Public Methods

-(void)reloadTableView{
    self.historyLoaded = YES;
    [SVProgressHUD dismiss];
    [self.tableView reloadData];
}

-(void)failedToGetData{
    self.historyLoaded = YES;
    [SVProgressHUD showErrorWithStatus:@"Some error"];
}


@end