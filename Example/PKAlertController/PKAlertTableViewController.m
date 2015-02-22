//
//  PKAlertTableViewController.m
//  PKAlertController
//
//  Created by Satoshi Ohki on 2015/02/21.
//  Copyright (c) 2015年 Satoshi Ohki. All rights reserved.
//

#import "PKAlertTableViewController.h"

#import <PKAlertController.h>

@interface PKAlertTableViewController ()

@end

@implementation PKAlertTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg"]];
    self.tableView.backgroundView = imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performDisplayAlertAtIndexPath:indexPath];
}

#pragma mark - Navigation

- (void)performDisplayAlertAtIndexPath:(NSIndexPath *)indexPath {
    PKAlertControllerStyle style = (PKAlertControllerStyle)indexPath.row;
    PKAlertControllerConfiguration *configuration = [PKAlertControllerConfiguration defaultConfiguration];
    [configuration addActions:@[
                                [PKAlertAction okAction],
                                ]];
    configuration.preferredStyle = style;
    PKAlertViewController *alertController = [PKAlertViewController alertControllerWithConfiguration:configuration];
//    PKAlertViewController *alertController = [PKAlertViewController simpleAlertControllerWithConfigurationBlock:^(PKAlertControllerConfiguration *configuration) {
//        configuration.title = @"Alert title";
//        configuration.message = @"Alert message message message msg.";
//        configuration.preferredStyle = style;
//    }];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
