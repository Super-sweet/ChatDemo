//
//  ViewController.m
//  WeCat
//
//  Created by  唐忠政 on 16/7/16.
//  Copyright © 2016年  唐忠政. All rights reserved.
//

#import "ViewController.h"
#import "FriendViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn:(id)sender {
    FriendViewController *FVC = [[FriendViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:FVC];
    self.view.window.rootViewController = navi;
}
@end
