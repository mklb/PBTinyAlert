//
//  PBTinyAlert.h
//  Pods
//
//  Created by Patrick Bläsing on 08.10.14.
//
//

#import <UIKit/UIKit.h>

typedef enum {
    PBBounceEffect,
    PBFillEffect
} PBEffectType;

@interface PBTinyAlert : UIView
+(PBTinyAlert*)withTitle:(NSString*)title Message:(NSString*)message BackgroundColor:(UIColor*)backgroundColor TextColor:(UIColor*)textColor Effect:(PBEffectType)effect;
-(void)show;
-(void)showWithVibration;
-(void)showAndHideIn:(float)seconds;
-(void)showWithVibrationAndHideIn:(float)seconds;
-(void)hide;
-(void)vibrate;
@end