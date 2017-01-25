//
//  SizeViewController.m
//  iOSFontDemo
//
//  Created by yuanye on 2017/1/25.
//  Copyright © 2017年 devzhou.com. All rights reserved.
//

#import "SizeViewController.h"

@interface SizeViewController ()

@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) UILabel *sizeLabel;
@property (nonatomic, strong) UILabel *fontLabel;

@end

@implementation SizeViewController

#pragma mark - life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.slider];
    [self.view addSubview:self.sizeLabel];
    [self.view addSubview:self.fontLabel];
    
    self.sizeLabel.text = [NSString stringWithFormat:@"size:%@", @(self.slider.value)];
    self.fontLabel.font = [UIFont fontWithName:self.fontName size:self.slider.value];
    self.fontLabel.text = self.fontName;
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.slider.frame = CGRectMake(40, self.view.frame.size.height - 64, self.view.frame.size.width - 80, 25);
    self.sizeLabel.frame = CGRectMake(0, CGRectGetMinY(self.slider.frame) - 50, self.view.frame.size.width, 20);
    self.fontLabel.frame = CGRectMake(0, 64 + 40, self.view.frame.size.width, CGRectGetMinY(self.sizeLabel.frame) - 64 - 80);
}

#pragma mark - event

- (void)sliderValueChanged:(UISlider *)slider
{
    self.sizeLabel.text = [NSString stringWithFormat:@"size:%@", @(slider.value)];
    self.fontLabel.font = [UIFont fontWithName:self.fontName size:slider.value];
}

#pragma mark - super

- (NSString *)title
{
    if (self.fontName.length > 0) {
        return self.fontName;
    }
    return NSStringFromClass(self.class);
}

#pragma mark - getter

- (UISlider *)slider
{
    if (!_slider) {
        _slider = [[UISlider alloc] init];
        _slider.minimumValue = 1.0;
        _slider.maximumValue = 100.0;
        _slider.value = 17.0;
        [_slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _slider;
}

- (UILabel *)sizeLabel
{
    if (!_sizeLabel) {
        _sizeLabel = [[UILabel alloc] init];
        _sizeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _sizeLabel;
}

- (UILabel *)fontLabel
{
    if (!_fontLabel) {
        _fontLabel = [[UILabel alloc] init];
        _fontLabel.textAlignment = NSTextAlignmentCenter;
        _fontLabel.numberOfLines = 0;
    }
    return _fontLabel;
}

@end
