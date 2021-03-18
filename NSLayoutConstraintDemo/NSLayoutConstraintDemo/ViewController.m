//
//  ViewController.m
//  NSLayoutConstraintDemo
//
//  Created by 李学良 on 2021/3/18.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *yellowView;
@property (nonatomic, strong) UIView *greenView;

@end

@implementation ViewController
#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.preservesSuperviewLayoutMargins = NO;
    [self.view addSubview:self.contentView];
    [self.view addSubview:self.redView];
    [self.contentView addSubview:self.yellowView];
    [self.contentView addSubview:self.greenView];
    [self setupAllConstraintsOfViews];

    
    
    
}



- (void)setupAllConstraintsOfViews {
    // self.view
    // NSLayoutAttributeTop
    // 会被奇奇怪怪的障碍物的遮挡，用户自己设置间距来适配安全区域
    NSLayoutConstraint *contentLeft = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    
    NSLayoutConstraint *contentTop = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    
    NSLayoutConstraint *contentWith = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    NSLayoutConstraint *contentHeight = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    [self.view addConstraint:contentLeft];
    [self.view addConstraint:contentTop];
    [self.view addConstraint:contentWith];
    [self.view addConstraint:contentHeight];
    
    
    
    // layoutMarginsGuide布局
    // NSLayoutAttributeTop
    // 在不会被奇奇怪怪的障碍物的遮挡的情况下，系统又设置了一个初始的设置间距
    NSLayoutConstraint *redTop =  [NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view.layoutMarginsGuide attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *redLeft =  [NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view.layoutMarginsGuide attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    
    NSLayoutConstraint *redWidth = [NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
    NSLayoutConstraint *redHeight = [NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
    [self.view addConstraint:redTop];
    [self.view addConstraint:redLeft];
    [self.redView addConstraint:redWidth];
    [self.redView addConstraint:redHeight];
    
    
    // layoutMarginsGuide
    // NSLayoutAttributeTopMargin
    // 在不会被奇奇怪怪的障碍物的遮挡的情况下，用户自己设置间距padding，或者用父试图layoutMargins来约束子视图距离它的间距
    CGFloat padding = 10;
    NSLayoutConstraint *yellowViewTop = [NSLayoutConstraint constraintWithItem:self.yellowView attribute:NSLayoutAttributeTopMargin relatedBy:NSLayoutRelationEqual toItem:self.contentView.layoutMarginsGuide attribute:NSLayoutAttributeTopMargin multiplier:1 constant:padding];
    
    NSLayoutConstraint *yellowViewLeft = [NSLayoutConstraint constraintWithItem:self.yellowView attribute:NSLayoutAttributeLeftMargin relatedBy:NSLayoutRelationEqual toItem:self.contentView.layoutMarginsGuide attribute:NSLayoutAttributeLeftMargin multiplier:1 constant:padding];
    
    NSLayoutConstraint *yellowViewRight = [NSLayoutConstraint constraintWithItem:self.yellowView attribute:NSLayoutAttributeRightMargin relatedBy:NSLayoutRelationEqual toItem:self.contentView.layoutMarginsGuide attribute:NSLayoutAttributeRightMargin multiplier:1 constant:-padding];
    NSLayoutConstraint *yellowViewBottom = [NSLayoutConstraint constraintWithItem:self.yellowView attribute:NSLayoutAttributeBottomMargin relatedBy:NSLayoutRelationEqual toItem:self.contentView.layoutMarginsGuide attribute:NSLayoutAttributeBottomMargin multiplier:1 constant:-padding];
    [self.contentView addConstraint:yellowViewTop];
    [self.contentView addConstraint:yellowViewLeft];
    [self.contentView addConstraint:yellowViewRight];
    [self.contentView addConstraint:yellowViewBottom];
    // 可以设置layoutMargins间距
    //    self.contentView.layoutMargins = UIEdgeInsetsMake(50, 50, 50, 50);
    
    
    
    // safeAreaLayoutGuide
    // NSLayoutAttributeTop
    // 在不会被奇奇怪怪的障碍物的遮挡的情况下，用户自己设置间距padding
    // 如果用safeAreaLayoutGuide，最好搭配NSLayoutAttributeTop类型的属性设置约束，否则系统系统会初始化一些默认的间距
    BOOL isAttributeMargin = NO;
    CGFloat additionalPadding = padding + 10;
    NSLayoutAttribute layoutAttributeTop = isAttributeMargin ? NSLayoutAttributeTopMargin :NSLayoutAttributeTop;
    NSLayoutAttribute layoutAttributeLeft = isAttributeMargin ? NSLayoutAttributeLeftMargin : NSLayoutAttributeLeft;
    NSLayoutAttribute layoutAttributeRight = isAttributeMargin ? NSLayoutAttributeRightMargin: NSLayoutAttributeRight;
    NSLayoutAttribute layoutAttributeBottom = isAttributeMargin ? NSLayoutAttributeBottomMargin
    : NSLayoutAttributeBottom;
    
    
    NSLayoutConstraint *greenViewTop = [NSLayoutConstraint constraintWithItem:self.greenView attribute:layoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView.safeAreaLayoutGuide attribute:layoutAttributeTop multiplier:1 constant:additionalPadding];
    
    NSLayoutConstraint *greenViewLeft = [NSLayoutConstraint constraintWithItem:self.greenView attribute:layoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView.safeAreaLayoutGuide attribute:layoutAttributeLeft multiplier:1 constant:additionalPadding];
    
    NSLayoutConstraint *greenViewRight = [NSLayoutConstraint constraintWithItem:self.greenView attribute:layoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView.safeAreaLayoutGuide attribute:layoutAttributeRight multiplier:1 constant:-additionalPadding];
    NSLayoutConstraint *greenViewBottom = [NSLayoutConstraint constraintWithItem:self.greenView attribute:layoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView.safeAreaLayoutGuide attribute:layoutAttributeBottom multiplier:1 constant:-additionalPadding];
    [self.contentView addConstraint:greenViewTop];
    [self.contentView addConstraint:greenViewLeft];
    [self.contentView addConstraint:greenViewRight];
    [self.contentView addConstraint:greenViewBottom];
}



#pragma mark - setters and getters
- (UIView *)redView {
    if (!_redView) {
        _redView = [UIView new];
        _redView.translatesAutoresizingMaskIntoConstraints = NO;
        _redView.backgroundColor = [UIColor redColor];
    }
    return _redView;
}

- (UIView *)yellowView {
    if (!_yellowView) {
        _yellowView = [UIView new];
        _yellowView.translatesAutoresizingMaskIntoConstraints = NO;
        _yellowView.backgroundColor = [UIColor yellowColor];
    }
    return _yellowView;
}
- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.translatesAutoresizingMaskIntoConstraints = NO;
        _contentView.backgroundColor = [UIColor blueColor];
    }
    return _contentView;
}
- (UIView *)greenView {
    if (!_greenView) {
        _greenView = [UIView new];
        _greenView.translatesAutoresizingMaskIntoConstraints = NO;
        _greenView.backgroundColor = [UIColor greenColor];
    }
    return _greenView;
}
@end
