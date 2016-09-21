//
//  MessageViewController.m
//  WeCat
//
//  Created by  唐忠政 on 16/7/16.
//  Copyright © 2016年  唐忠政. All rights reserved.
//

#import "MessageViewController.h"
#import "Message.h"
#import "MessageCell.h"


#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

@interface MessageViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_DataArray;
    Message *_message;
    UIImageView *_imageView;
    UITextField *_textField;
}

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH-45-64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
//    _tableView.rowHeight = 200;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.contentOffset = CGPointMake(CGFLOAT_MAX, CGFLOAT_MAX);
    [self.view addSubview:_tableView];
    [self createBttomView];
    [self loadData];
    //注册键盘出现的通知
    
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(keyboardWasShown:)
     
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    //注册键盘消失的通知
    
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(keyboardWillBeHidden:)
     
                                                 name:UIKeyboardWillHideNotification object:nil];
}

-(void)loadData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"messages" ofType:@"plist"];
    _DataArray = [NSMutableArray arrayWithContentsOfFile:path];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _DataArray.count;
}

-(void)createBttomView {
    NSLog(@"1");
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, kScreenH-45-64, kScreenW, 45)];
//    imageView.backgroundColor = [UIColor blackColor];
    _imageView.image = [UIImage imageNamed:@"toolbar_bottom_bar"];
    _imageView.userInteractionEnabled = YES;
    [self.view addSubview:_imageView];
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setImage:[UIImage imageNamed:@"chat_bottom_voice_press"] forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"chat_bottom_voice_nor"] forState:UIControlStateHighlighted];
    btn1.frame = CGRectMake(5, 5, 37, 40);
    [btn1 addTarget:self action:@selector(btn1Aciton) forControlEvents:UIControlEventTouchUpInside];
    [_imageView addSubview:btn1];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(47, 6, kScreenW - 47 - 95, 32)];
    _textField.layer.cornerRadius = 6;
    _textField.tag = 1001;
    _textField.textAlignment = NSTextAlignmentRight;
    _textField.backgroundColor = [UIColor whiteColor];
    _textField.delegate = self;
    [_imageView addSubview:_textField];
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setImage:[UIImage imageNamed:@"chat_bottom_up_nor"] forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"chat_bottom_up_press"] forState:UIControlStateHighlighted];
    btn2.frame = CGRectMake(kScreenW-90, -2, 50, 50);
    [_imageView addSubview:btn2];
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn3 setImage:[UIImage imageNamed:@"chat_bottom_smile_nor"] forState:UIControlStateNormal];
    [btn3 setImage:[UIImage imageNamed:@"chat_bottom_smile_press"] forState:UIControlStateHighlighted];
    btn3.frame = CGRectMake(kScreenW-50, -2, 50, 50);
        [_imageView addSubview:btn3];
    
    
}

-(void)btn1Aciton {
    NSLog(@"1");
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSString *cellID = @"cell";
//    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//    if (cell == nil) {
//        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
//        }
    MessageCell *cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    _message = [[Message alloc] init];
    _message.icon = [_DataArray[indexPath.row] valueForKey:@"icon"];
    _message.content = [_DataArray[indexPath.row] valueForKey:@"content"];
    _message.time = [_DataArray[indexPath.row] valueForKey:@"time"];
    _message.isSelf = [_DataArray[indexPath.row] valueForKey:@"isSelf"];
    cell.message = _message;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    Message *message = [[Message alloc] init];
    message.content = [_DataArray[indexPath.row] valueForKey:@"content"];
    CGFloat height = message.frame.size.height;
    
    return height +55;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



- (void)keyboardWasShown:(NSNotification*)aNotification

{
    
    //键盘高度
    CGRect keyBoardFrame = [[[aNotification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
//    [_tableView setContentOffset:CGPointMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        //表视图滚动至底部。
    [UIView animateWithDuration:0.5 animations:^{
        _tableView.frame = CGRectMake(0, -keyBoardFrame.size.height, kScreenW, kScreenH-64-45);
        _imageView.frame = CGRectMake(0,  kScreenH-45-64-keyBoardFrame.size.height, kScreenW, 45);
    }];
    
    
    //重新加载表视图
//    [_tableView reloadData];
    
    
}



-(void)keyboardWillBeHidden:(NSNotification*)aNotification

{
    _imageView.frame = CGRectMake(0, kScreenH-45-64, kScreenW, 45);
    _tableView.frame = CGRectMake(0, 0, kScreenW, kScreenH-64-45);
    [_tableView reloadData];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {

    NSLog(@"%@",_textField.text);
    [_tableView setContentOffset:CGPointMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    NSDictionary *dic = @{@"icon":@"icon01.jpg",
                          @"content":_textField.text,
                          @"time":@"今天 10:25",
                          @"isSelf":@YES};
    [_DataArray addObject:dic];
    [_tableView reloadData];
    _textField.text = @"";
    //表视图滚动至底部。
    
    
//    @"icon"];
//    _message.content = [_DataArray[indexPath.row] valueForKey:@"content"];
//    _message.time = [_DataArray[indexPath.row] valueForKey:@"time"];
//    _message.isSelf = [_DataArray[indexPath.row] valueForKey:@"isSelf"];
    return YES;
}

#pragma mark - 单机窗口键盘隐藏
//说明：其实是选中到单元格了
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //直接调用隐藏键盘的方法即可
    [_textField resignFirstResponder];
}

#pragma mark - 滑动窗口时，键盘隐藏
- (void) scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    //直接调用隐藏键盘的方法即可
    [_textField resignFirstResponder];
    
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
