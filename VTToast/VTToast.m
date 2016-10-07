//
//  VTToast.m
//  Test
//
//  Created by lucas fernández on 07/10/2016.
//  Copyright © 2016 lucas fernández. All rights reserved.
//

#import "VTToast.h"

@implementation VTToast


+(void)showToastWithMessage:(NSString*)String{
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectZero];
    
    //label text
    label.text = String;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
    label.minimumScaleFactor = 0.9;
    label.adjustsFontSizeToFitWidth = YES;
    label.textColor = [UIColor whiteColor];
    label.adjustsFontSizeToFitWidth = true;
    label.backgroundColor = [UIColor blackColor];
    [label sizeToFit];
    label.numberOfLines = 2;
    
    //label shadow
    label.layer.shadowColor = [UIColor grayColor].CGColor;
    label.layer.shadowOffset = CGSizeMake(4, 3);
    label.layer.shadowOpacity = 0.3;
    
    //label bounds
    double width =  delegate.window.bounds.size.width - (delegate.window.bounds.size.width / 8);
    label.frame = CGRectMake((delegate.window.bounds.size.width / 2) - (width / 2) , delegate.window.bounds.size.height - 60, delegate.window.bounds.size.width - (delegate.window.bounds.size.width / 8), 50);
    label.clipsToBounds = YES;
    label.layer.cornerRadius = 15;
    label.alpha = 0;
    
    [delegate.window addSubview:label];
    
    for (UIView *view in delegate.window.subviews){
        if ([view isKindOfClass:[UILabel class]]){
            [view removeFromSuperview];
        }
    }
    
    //label animation
    [UIView animateWithDuration:1.5 delay:0.0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations: ^(void){
        NSLog(@"ALPHA: %f", label.alpha);
        label.alpha = 0.80;
    } completion:^(BOOL finished){
        [UIView animateWithDuration:1 delay:1.5 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations: ^(void){
            label.alpha = 0;
        } completion:^(BOOL finished){
            [label removeFromSuperview];
        }];
        
    }];
}


@end
