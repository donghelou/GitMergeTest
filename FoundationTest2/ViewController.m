//
//  ViewController.m
//  FoundationTest2
//
//  Created by 董贺楼 on 2018/8/30.
//  Copyright © 2018年 董贺楼. All rights reserved.
//

#import "ViewController.h"
#import "LoadCargoesDetailCell.h"
#import "Masonry.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property(nonatomic,strong)UITableView *dataTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _dataTableView = [[UITableView alloc] init];
    [self.view addSubview:self.dataTableView];
    [self.dataTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.equalTo(self.view);
    }];
    self.dataTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.dataTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.dataTableView.backgroundColor = [UIColor whiteColor];
    self.dataTableView.delegate = self;
    self.dataTableView.dataSource = self;
    
    UIButton *button2 = [[UIButton alloc] init];
    [self.view addSubview:button2];
    
    //test1
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    LoadCargoesDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[LoadCargoesDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.realBillCountTextField.delegate = self;
    cell.realBillCountTextField.keyboardType = UIKeyboardTypeNumberPad;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}
-(void) textFieldDidBeginEditing:(UITextField *)textField {
    self.dataTableView.scrollEnabled = NO;
    UITextPosition *endDocument = textField.endOfDocument;//获取 text的 尾部的 TextPositext
    UITextPosition *end = [textField positionFromPosition:endDocument offset:0];
    UITextPosition *start = [textField positionFromPosition:end offset:-textField.text.length];//左－右＋
    textField.selectedTextRange = [textField textRangeFromPosition:start toPosition:end];
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    self.dataTableView.scrollEnabled = YES;
    UITextPosition *beginDocument = textField.beginningOfDocument;
    UITextPosition *end = [textField positionFromPosition:beginDocument offset:0];
    UITextPosition *start = [textField positionFromPosition:beginDocument offset:0];//左－右＋
    textField.selectedTextRange = [textField textRangeFromPosition:start toPosition:end];
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
