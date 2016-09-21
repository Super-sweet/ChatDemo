//
//  Message.m
//  WeCat
//
//  Created by  唐忠政 on 16/7/16.
//  Copyright © 2016年  唐忠政. All rights reserved.
//

#import "Message.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

@implementation Message

- (instancetype)init
{
    self = [super init];
    if (self) {
       _contentFontSize = 16;
    }
    return self;
}

-(void)setDic:(NSMutableDictionary *)dic {
    _dic =dic;
    _content = [dic valueForKey:@"content"];
    _time = [dic valueForKey:@"time"];
    _icon = [dic valueForKey:@"icon"];
    _isSelf = [dic valueForKey:@"self"];
}

-(void)setContent:(NSString *)content {
    if (![content isEqualToString:_content]) {
        _content = content;
        
        //2) 根据文字的内容和字体的大小进行content的frame的设置
        //a) 通过字体的大小获取相关的字体内容
        NSDictionary *arrtributeDic = @{ NSFontAttributeName : [UIFont systemFontOfSize:_contentFontSize]};
        //b) 通过获取的字体属性，计算content的frame大小
        CGRect frame = [content boundingRectWithSize:CGSizeMake(kScreenW-160, 1000)
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:arrtributeDic
                                             context:nil];
        //c) 赋值_frame
        _frame = frame;
    }
    
    
}

@end
