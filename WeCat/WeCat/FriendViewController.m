//
//  FriendViewController.m
//  WeCat
//
//  Created by  唐忠政 on 16/7/16.
//  Copyright © 2016年  唐忠政. All rights reserved.
//

#import "FriendViewController.h"
#import "TableViewCell.h"
#import "MessageViewController.h"

@interface FriendViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    MessageViewController *_messageVC;
//    NSArray *DataArray;
}

@property(nonatomic,strong)NSMutableArray *DataArray;


@end

@implementation FriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我的好友";
//    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    rightBtn.frame = CGRectMake(0, 0, 50, 50);
//    rightBtn.backgroundColor = [UIColor blueColor];
//    [rightBtn setTitle:@"注销" forState:UIControlStateNormal];
//    [rightBtn setImage:[UIImage imageNamed:@"chat_bottom_up_nor"] forState:UIControlStateNormal];
//    [rightBtn addTarget:self action:@selector(rightBtnAction:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
//    self.navigationItem.rightBarButtonItem = rightItem;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"注销"
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(barButtonItemAction:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    [self createTableView];
}

-(void)barButtonItemAction:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    [UIView animateWithDuration:1 animations:^{
        self.view.window.rootViewController = [storyboard instantiateInitialViewController];
    }];
    
}

-(void)createTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64) style:UITableViewStylePlain];
    self.navigationController.navigationBar.translucent = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 100;
    [self.view addSubview:_tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"cellID"];
    
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 11;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    NSString *str = [NSString stringWithFormat:@"联系人：%ld号",indexPath.row+5];
    NSString *str2 = [NSString stringWithFormat:@"用户名：%02ld",indexPath.row+5];
    NSDictionary *dic = @{@"image":@"defaultPerson",
                          @"friends":str,
                          @"useID":str2};
    
    cell.dic = dic;
    
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    static NSString *headID = @"headID";
    UITableViewHeaderFooterView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headID];
    if (headView == nil) {
        headView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:headID];
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
//        [headView addGestureRecognizer:tap];
        
    }
    headView.textLabel.text = @"我的好友";
    headView.textLabel.font = [UIFont systemFontOfSize:12];
    headView.backgroundColor = [UIColor brownColor];
    return headView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *str2 = [NSString stringWithFormat:@"%02ld",indexPath.row+5];
    
    if (_messageVC == nil) {
        _messageVC = [[MessageViewController alloc] init];
    }
    
    _messageVC.title= str2;
    [self.navigationController pushViewController:_messageVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
