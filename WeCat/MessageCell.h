//
//  MessageCell.h
//  WeCat
//
//  Created by  唐忠政 on 16/7/16.
//  Copyright © 2016年  唐忠政. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"

//1) 聊天窗口的间隙
#define kEdgeSize       10
//2) 头像的宽度
#define kHeadImageSize  40
@interface MessageCell : UITableViewCell

@property(nonatomic,strong)Message *message;

@end
