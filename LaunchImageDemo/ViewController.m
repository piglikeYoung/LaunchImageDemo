//
//  ViewController.m
//  LaunchImageDemo
//
//  Created by piglikeyoung on 15/10/28.
//  Copyright © 2015年 pikeYoung. All rights reserved.
//  LaunchImage在APP初始化完之后会立即消失并显示APP的界面 但是有的时候我们不希望它这么快就消失(比如有的人希望有个过渡效果 有的人希望等某些设置或者数据加载完之后再消失) 这也很简单 我们只要自己把LaunchImage再显示出来并且置顶就OK了

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 使用LaunchImage加载启动图片
//    [self setUpLauchIvWithLaunchImage];
    
    // 使用LaunchScreen.storyboard加载启动图片
    [self setUpLauchIvWithLaunchScreen];
}

/**
 *  使用LaunchImage加载启动图片，由于从Assets中获取启动图片，分成各种图片的样式，需要分别处理
 */
- (void) setUpLauchIvWithLaunchImage {
    UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
    CGSize viewSize = keyWindow.bounds.size;
    NSString *viewOrientation = @"Portrait";    //横屏请设置成 @"Landscape"
    NSString *launchImage = nil;
    
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary* dict in imagesDict)
    {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]])
        {
            launchImage = dict[@"UILaunchImageName"];
        }
    }
    
    UIImageView *launchView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:launchImage]];
    launchView.frame = self.view.bounds;
    launchView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:launchView];
    
    [UIView animateWithDuration:2.0f
                          delay:0.0f
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         
                         launchView.alpha = 0.0f;
                         launchView.layer.transform = CATransform3DScale(CATransform3DIdentity, 1.2, 1.2, 1);
                         
                     }
                     completion:^(BOOL finished) {
                         
                         [launchView removeFromSuperview];
                         
                     }];
}


/**
 *  使用LaunchScreen.storyboard加载启动图片
 *  没有横竖屏之说，只有一张图片适用横竖屏
 */
- (void) setUpLauchIvWithLaunchScreen {

    UIImage *launchImage = [UIImage imageNamed:@"ElementStartUpPg"];
    UIImageView *launchView = [[UIImageView alloc] initWithImage:launchImage];
    
    launchView.frame = self.view.bounds;
    launchView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:launchView];
    
    [UIView animateWithDuration:2.0f
                          delay:0.0f
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         
                         launchView.alpha = 0.0f;
                         launchView.layer.transform = CATransform3DScale(CATransform3DIdentity, 1.2, 1.2, 1);
                         
                     }
                     completion:^(BOOL finished) {
                         
                         [launchView removeFromSuperview];
                         
                     }];
}


@end
