//
//  UIViewController+CroppingImage.h
//  CroppingImageDemo
//
//  Created by 朱佳男 on 2017/4/24.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (CroppingImage)
- (void)albumImageChoosed:(UIImage*)img;//必须覆盖方法
@end
