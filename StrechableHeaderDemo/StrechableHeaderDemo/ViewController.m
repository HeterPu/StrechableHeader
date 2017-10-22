//
//  ViewController.m
//  StrechableHeaderDemo
//
//  Created by peter on 2017/10/22.
//  Copyright © 2017年 peter. All rights reserved.
//

#import "ViewController.h"

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

- (IBAction)toggleNAVIBAR:(UIButton *)sender {
    
    if(self.navigationController.navigationBar.isHidden)
    {
        [sender setSelected:false];
        [self.navigationController setNavigationBarHidden:false animated:true];
    }
    else
    {
        [sender setSelected:true];
        [self.navigationController setNavigationBarHidden:true animated:true];
    }
}

@end
