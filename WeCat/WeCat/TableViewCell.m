//
//  TableViewCell.m
//  WeCat
//
//  Created by  唐忠政 on 16/7/16.
//  Copyright © 2016年  唐忠政. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *PersonImage;

@property (weak, nonatomic) IBOutlet UILabel *Label;
@property (weak, nonatomic) IBOutlet UILabel *useIDLabel;

@end

@implementation TableViewCell

- (void)awakeFromNib {
    NSLog(@"1");

}

-(void) setDic:(NSDictionary *)dic {
    _dic = dic;
    _PersonImage.image = [UIImage imageNamed:[_dic valueForKey:@"image"]];
    
    _Label.text = [_dic valueForKey:@"friends"];
    
    _useIDLabel.text = [_dic valueForKey:@"useID"];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
