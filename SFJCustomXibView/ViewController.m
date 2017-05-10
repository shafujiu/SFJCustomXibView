//
//  ViewController.m
//  SFJCustomXibView
//
//  Created by 沙缚柩 on 2017/5/10.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "ViewController.h"
#import "SFJCustomBadView.h"
#import "SFJCustomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    SFJCustomBadView *badView = [[SFJCustomBadView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    badView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:badView];
    
    SFJCustomView *view = [[SFJCustomView alloc] initWithFrame:CGRectMake(130, 10, 100, 100)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
