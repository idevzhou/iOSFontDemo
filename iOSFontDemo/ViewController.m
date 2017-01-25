//
//  ViewController.m
//  iOSFontDemo
//
//  Created by yuanye on 2017/1/25.
//  Copyright © 2017年 devzhou.com. All rights reserved.
//

#import "ViewController.h"
#import "SizeViewController.h"

static NSString * const kFontKeyFamilyName = @"familyName";
static NSString * const kFontKeyFontNames = @"fontNames";
static NSString * const kCellReuseIdentifier = @"UITableViewCell";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *fontList;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

#pragma mark - life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:kCellReuseIdentifier];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseIdentifier forIndexPath:indexPath];
    NSDictionary *dict = self.fontList[indexPath.section];
    NSArray *fontNames = dict[kFontKeyFontNames];
    NSString *fontName = fontNames[indexPath.row];
    cell.textLabel.text = fontName;
    cell.textLabel.font = [UIFont fontWithName:fontName size:17.0];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary *dict = self.fontList[section];
    return dict[kFontKeyFamilyName];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.fontList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dict = self.fontList[section];
    NSArray *fontNames = dict[kFontKeyFontNames];
    return fontNames.count;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *dict = self.fontList[indexPath.section];
    NSArray *fontNames = dict[kFontKeyFontNames];
    NSString *fontName = fontNames[indexPath.row];
    
    SizeViewController *sizeVC = [[SizeViewController alloc] init];
    sizeVC.fontName = fontName;
    [self.navigationController pushViewController:sizeVC animated:YES];
}

#pragma mark - super

- (NSString *)title
{
    return @"Font";
}

#pragma mark - getter

- (NSMutableArray *)fontList
{
    if (!_fontList) {
        _fontList = [NSMutableArray array];
        
        for (NSString *familyName in [UIFont familyNames]) {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            [dict setValue:familyName forKey:kFontKeyFamilyName];
            NSArray *fontName = [UIFont fontNamesForFamilyName:familyName];
            [dict setValue:fontName forKey:kFontKeyFontNames];
            [_fontList addObject:dict];
        }
    }
    return _fontList;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.1)];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.1)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

@end
