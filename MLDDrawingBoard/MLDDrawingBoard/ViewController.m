//
//  ViewController.m
//  MLDDrawingBoard
//
//  Created by Moliy on 2017/9/1.
//  Copyright © 2017年 Moliy. All rights reserved.
//

#import "ViewController.h"
#import "MLDDrawingBoard.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView *view = [[MLDDrawingBoard alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:view];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
