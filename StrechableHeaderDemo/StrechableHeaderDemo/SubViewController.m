//
//  SubViewController.m
//  StrechableHeaderDemo
//
//  Created by peter on 2017/10/22.
//  Copyright © 2017年 peter. All rights reserved.
//

#import "SubViewController.h"
#import "CustomHeader.h"
#import "UIScrollView+StrechableHeader.h"

@interface SubViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(nonatomic,strong) CustomHeader *header;

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialization];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)initialization{
//    [self.scrollView setStrechHeader:[self header]];
}


-(CustomHeader *)header {
    if (!_header) {
        _header = [[[NSBundle mainBundle]loadNibNamed:@"CustomHeader" owner:nil options:nil]lastObject];
        _header.frame = CGRectMake(0, 0, 0 ,100);
    }
    return  _header;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.scrollView updateStrechHeader];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
