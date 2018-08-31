//
//  LoadCargoesDetailCell.m
//  MRDLogistics
//
//  Created by 董贺楼 on 2018/8/23.
//  Copyright © 2018年 jd. All rights reserved.
//

#import "LoadCargoesDetailCell.h"
#import "Masonry.h"
#define COLOR(rgbValue) COLORWithAlpha(rgbValue,1.0)
//有alpha值
#define COLORWithAlpha(rgbValue,alphaValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:alphaValue]
@interface LoadCargoesDetailCell()
@property(nonatomic,strong)UILabel *billNameLabel; //商品名称
@property(nonatomic,strong)UILabel *purchaseBillCodeLabel; //采购单号
@property(nonatomic,strong)UILabel *billCountLabel; //商品数量/应收数量
@end

@implementation LoadCargoesDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    //商品名称标题
    UILabel *billNameTitle = [[UILabel alloc] init];
    [self.contentView addSubview:billNameTitle];
    [billNameTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(16);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(65);
    }];
    billNameTitle.text = @"商品名称:";
    billNameTitle.font = [UIFont systemFontOfSize:14 weight:0.3];
    billNameTitle.textColor = COLOR(0x333333);
    
    //商品名称的值
    _billNameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.billNameLabel];
    [self.billNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(billNameTitle.mas_right).offset(5);
        make.top.mas_equalTo(16);
        make.right.mas_equalTo(-15);
        make.height.greaterThanOrEqualTo(@20);
    }];
    self.billNameLabel.font = [UIFont systemFontOfSize:14];
    self.billNameLabel.textColor = COLOR(0x333333);
    self.billNameLabel.numberOfLines = 0;
    self.billNameLabel.lineBreakMode = NSLineBreakByCharWrapping;

    //采购单号的标题
    UILabel *purchaseBillCodeTitle = [[UILabel alloc] init];
    [self.contentView addSubview:purchaseBillCodeTitle];
    [purchaseBillCodeTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.equalTo(self.billNameLabel.mas_bottom).offset(11);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(65);
    }];
    purchaseBillCodeTitle.text = @"采购单号:";
    purchaseBillCodeTitle.font = [UIFont systemFontOfSize:14 weight:0.3];
    purchaseBillCodeTitle.textColor = COLOR(0x333333);
    
    //采购单号的值
    _purchaseBillCodeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.purchaseBillCodeLabel];
    [self.purchaseBillCodeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(purchaseBillCodeTitle.mas_right).offset(5);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(20);
        make.top.equalTo(self.billNameLabel.mas_bottom).offset(11);
    }];
    self.purchaseBillCodeLabel.font = [UIFont systemFontOfSize:14];
    self.purchaseBillCodeLabel.textColor = COLOR(0x333333);
    self.purchaseBillCodeLabel.text = @"PO112233445566";
    
    //商品数量/应收数量
    _billCountLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.billCountLabel];
    [self.billCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.width.mas_equalTo(120);
        make.top.equalTo(purchaseBillCodeTitle.mas_bottom).offset(8);
        make.height.mas_equalTo(22);
    }];
    self.billCountLabel.font = [UIFont systemFontOfSize:14];
    self.billCountLabel.textColor = COLOR(0x999999);
  
    //件 单位
    UILabel *jianLabel = [[UILabel alloc] init];
    [self.contentView addSubview:jianLabel];
    [jianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(20);
        make.top.equalTo(purchaseBillCodeTitle.mas_bottom).offset(8);
    }];
    jianLabel.font = [UIFont systemFontOfSize:14];
    jianLabel.textColor = COLOR(0x999999);
    jianLabel.text = @"件";
    
    //揽收数量/实收数量
    _realBillCountTextField = [[UITextField alloc] init];
    [self.contentView addSubview:self.realBillCountTextField];
    [self.realBillCountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(jianLabel.mas_left).offset(-8);
        make.width.mas_equalTo(44);
        make.height.mas_equalTo(24);
        make.centerY.equalTo(self.billCountLabel.mas_centerY);
    }];
    self.realBillCountTextField.font = [UIFont systemFontOfSize:14];
    self.realBillCountTextField.textColor = COLOR(0x333333);
    self.realBillCountTextField.backgroundColor = COLOR(0xF6F6F6);
    self.realBillCountTextField.textAlignment = NSTextAlignmentCenter;
    self.realBillCountTextField.layer.cornerRadius = 4;
    
    //揽收数量/实收数量 title
    UILabel *realBillCountTitle = [[UILabel alloc] init];
    [self.contentView addSubview:realBillCountTitle];
    [realBillCountTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(50);
        make.top.equalTo(purchaseBillCodeTitle.mas_bottom).offset(8);
        make.height.mas_equalTo(22);
        make.right.equalTo(self.realBillCountTextField.mas_left).offset(-8);
    }];
    realBillCountTitle.font = [UIFont systemFontOfSize:14];
    realBillCountTitle.textColor = COLOR(0x999999);
    realBillCountTitle.textAlignment = NSTextAlignmentRight;
    realBillCountTitle.text = @"实收";
    
    UIView *bottomView = [[UIView alloc] init];
    [self.contentView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.height.mas_equalTo(10);
    }];
    bottomView.backgroundColor = COLOR(0xF6F6F6);
    
    return self;
}

//设置字符串局部颜色，str为原字符串，size为字体大小，color为字体颜色
-(NSMutableAttributedString *)setTextColor:(NSString *)str fontSize:(CGFloat)size withRange:(NSRange)range withColor:(UIColor *)color {
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:str];
    [attributedStr addAttribute:NSFontAttributeName
                          value:[UIFont systemFontOfSize:size weight:0.3]
                          range:range];
    [attributedStr addAttribute:NSForegroundColorAttributeName
                          value:color
                          range:range];
    return attributedStr;
}
//设置行间距
-(NSAttributedString *)getAttributedStringWithString:(NSString *)string lineSpace:(CGFloat)lineSpace {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpace; // 调整行间距
    NSRange range = NSMakeRange(0, [string length]);
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    return attributedString;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
