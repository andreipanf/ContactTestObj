//
//  ViewController.m
//  ContactTest
//
//  Created by Andrey on 29.07.16.
//  Copyright © 2016 AndreyPanfilov. All rights reserved.
//

#import "ViewController.h"
#import "Contact.h"
#import "ContactCell.h"
#import "AddressBookHelper.h"
#import "SVProgressHUD.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *errorView;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong,nonatomic) NSArray *contactsArray;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadContacts];
}

-(void)loadContacts
{
    [SVProgressHUD show];
    [AddressBookHelper getAllContacts: ^(NSArray * response){
        self.contactsArray = response;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.errorView.hidden = YES;
            [SVProgressHUD dismiss];
            [self.tableView reloadData];
        });
        
        
    } failure:^(NSString *errorString){
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(appplicationIsActive:)
                                                     name:UIApplicationDidBecomeActiveNotification
                                                   object:nil];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
            self.errorView.hidden = NO;
            self.errorLabel.text = errorString;
        });
    }];
}

- (void)appplicationIsActive:(NSNotification *)notification {
    [self loadContacts];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _contactsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContactCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Contact *contact = [_contactsArray objectAtIndex:indexPath.row];
    
    cell.namePhoneLabel.text = [NSString stringWithFormat:@"%@ / %@",contact.fullName, contact.phoneNumber];
    
    return cell;
    
}

#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Contact *contact = [_contactsArray objectAtIndex:indexPath.row];
    NSString *phoneString = [NSString stringWithFormat:@"tel:%@",contact.phoneNumber];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneString]];
}



@end
