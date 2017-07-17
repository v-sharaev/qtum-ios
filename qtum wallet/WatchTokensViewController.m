//
//  WatchTokensViewController.m
//  qtum wallet
//
//  Created by Vladimir Lebedevich on 12.06.17.
//  Copyright © 2017 PixelPlex. All rights reserved.
//

#import "WatchTokensViewController.h"
#import "TextFieldWithLine.h"
#import "ImputTextView.h"
#import "ContractFileManager.h"

@interface WatchTokensViewController ()

@property (weak, nonatomic) IBOutlet TextFieldWithLine *contractNameField;
@property (weak, nonatomic) IBOutlet TextFieldWithLine *contractAddressTextField;
@property (weak, nonatomic) IBOutlet ImputTextView *abiTextView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation WatchTokensViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.delegate = self.collectionSource;
    self.collectionView.dataSource = self.collectionSource;
}

#pragma mark - Private Methods

-(void)createSmartContract {
    
    if ([[ContractManager sharedInstance] addNewTokenWithContractAddress:self.contractAddressTextField.text withAbi:self.abiTextView.text andWithName:self.contractNameField.text]) {
        [SVProgressHUD showSuccessWithStatus:NSLocalizedString(@"Done", "")];
        [self.delegate didPressedBack];
    } else {
        [SVProgressHUD showSuccessWithStatus:NSLocalizedString(@"Error", "")];
    }
}

- (IBAction)didPressedBackAction:(id)sender {
    [self.delegate didPressedBack];
}

- (IBAction)didPressedOkAction:(id)sender {
    [SVProgressHUD show];
    [self createSmartContract];
}

- (IBAction)didPressedCancelAction:(id)sender {
    [self.delegate didPressedBack];
}

- (IBAction)didVoidTapAction:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)chooseFromLibraryButtonPressed:(id)sender {
    
    [self.delegate didSelectChooseFromLibrary:self];
}

- (void)changeStateForSelectedTemplate:(TemplateModel *)templateModel {
    
    self.abiTextView.text = templateModel ? [[ContractFileManager sharedInstance] escapeAbiWithTemplate:templateModel.path]: @"";
    [self.abiTextView setContentOffset:CGPointZero];
}

@end
