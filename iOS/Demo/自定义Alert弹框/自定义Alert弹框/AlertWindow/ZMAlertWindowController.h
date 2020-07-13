//
//  ZMAlertWindowController.h
//  自定义Alert弹框
//
//  Created by czm on 2019/11/1.
//  Copyright © 2019 czm. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMAlertWindowController : UIViewController

+ (instancetype)alertWindowWith:(NSDictionary *_Nullable)params withFromVc:(UIViewController *_Nullable)fromVc;

- (void)presentFromView;

@end

NS_ASSUME_NONNULL_END
