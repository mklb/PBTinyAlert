//
//  PBTinyAlert.m
//  Pods
//
//  Created by Patrick Bläsing on 08.10.14.
//
//

#import "PBTinyAlert.h"
#import <pop/POP.h>

#import <AudioToolbox/AudioToolbox.h>

static int STATUS_BAR_HEIGHT = 20;

static int ALERT_VIEW_HEIGHT = 64;
static int ALERT_VIEW_ADDITIONAL_FILL_HEIGHT = 26;
static int ALERT_VIEW_PADDING = 10;

@interface PBTinyAlert ()
@property UILabel *titleLabel;
@property UILabel *messageLabel;
@property UIWindow *currentWindow;
@property PBEffectType effectType;
@end

@implementation PBTinyAlert


#pragma mark - public methods

+(PBTinyAlert*)withTitle:(NSString*)title Message:(NSString*)message BackgroundColor:(UIColor*)backgroundColor TextColor:(UIColor*)textColor Effect:(PBEffectType)effect{

    PBTinyAlert *alertView;
    
    // set the text color white if no textColor was given
    UIColor *chosenColor = (textColor ? textColor : [UIColor colorWithRed:1 green:1 blue:1 alpha:1]);
    
    
    // generate PBTinyAlert for the different effects
    if (effect == PBBounceEffect) {
        
        alertView = [[self alloc] initWithFrame:CGRectMake(0, -ALERT_VIEW_HEIGHT + ALERT_VIEW_ADDITIONAL_FILL_HEIGHT, [[UIScreen mainScreen]bounds].size.width, ALERT_VIEW_HEIGHT + ALERT_VIEW_ADDITIONAL_FILL_HEIGHT)];
        
    }else {
        
        alertView = [[self alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, ALERT_VIEW_HEIGHT)];
    }
    
    // add effect type and current window
    alertView.effectType = effect;
    alertView.currentWindow = [[UIApplication sharedApplication] keyWindow];
    
    // set background color FlatSuperCoolRed if no textColor was given
    alertView.backgroundColor = (backgroundColor ? backgroundColor : [UIColor colorWithRed:1 green:0.22 blue:0.31 alpha:1]);
    
    
    // if message was set
    if (message) {
        
        // calculate different y positions for the bounce effect
        int yTitleLabelPosition = (alertView.effectType == PBBounceEffect ? STATUS_BAR_HEIGHT + ALERT_VIEW_PADDING + 4 : ALERT_VIEW_PADDING - 3);
        int yMessageLabelPosition = yTitleLabelPosition + ALERT_VIEW_PADDING * 2;
        
        // add title label
        alertView.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(ALERT_VIEW_PADDING, yTitleLabelPosition, alertView.frame.size.width-2*ALERT_VIEW_PADDING, 30)];
        [alertView.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
        
        // add message label
        alertView.messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(ALERT_VIEW_PADDING, yMessageLabelPosition, alertView.frame.size.width-2*ALERT_VIEW_PADDING, 30)];
        [alertView.messageLabel setFont:[UIFont boldSystemFontOfSize:12]];
        
        // customize message
        alertView.messageLabel.text = message;
        alertView.messageLabel.textColor = chosenColor;
        alertView.messageLabel.textAlignment = NSTextAlignmentCenter;
        
        [alertView addSubview:alertView.messageLabel];
        
        
    }else{
        
        // calculate different y positions for the bounce effect
        int yTitleLabelPosition = (alertView.effectType == PBBounceEffect ? STATUS_BAR_HEIGHT + ALERT_VIEW_ADDITIONAL_FILL_HEIGHT - 4 : STATUS_BAR_HEIGHT - 3);
        
        // add title label
        alertView.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(ALERT_VIEW_PADDING, yTitleLabelPosition , alertView.frame.size.width-2*ALERT_VIEW_PADDING, 30)];
        [alertView.titleLabel setFont:[UIFont boldSystemFontOfSize:22]];
    }
    
    // customize title
    alertView.titleLabel.text = title;
    alertView.titleLabel.textColor = chosenColor;
    alertView.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [alertView addSubview:alertView.titleLabel];
    
    
    return alertView;
}

// show PBTinyAlert
-(void)show{
    
    // move window above status bar
    self.currentWindow.windowLevel = UIWindowLevelStatusBar + 1;
    
    // add to subview
    [self.currentWindow addSubview:self];
    
    // check which effect is choosen
    if (self.effectType == PBBounceEffect) {
        
        // add effects
        POPSpringAnimation *anim1 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
        anim1.springBounciness = 15;
        anim1.toValue = @(2 * ALERT_VIEW_PADDING);
        anim1.velocity = @400;
        
        [self.layer pop_addAnimation:anim1 forKey:@"positionAnimation"];
        
    }else if (self.effectType == PBFillEffect){
        
        
        // add fill effect
        POPSpringAnimation *cornerRadiusAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerCornerRadius];
        cornerRadiusAnimation.fromValue = @(400);
        cornerRadiusAnimation.toValue = @(0);
        cornerRadiusAnimation.springSpeed = 10;
        
        // add opacity effect
        POPBasicAnimation *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
        opacityAnimation.fromValue = @(0);
        opacityAnimation.toValue = @(1);
        
        
        // add scale effect
        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        scaleAnimation.fromValue  = [NSValue valueWithCGSize:CGSizeMake(0.0f, 0.0f)];
        scaleAnimation.toValue  = [NSValue valueWithCGSize:CGSizeMake(1.0f, 1.0f)];
        
        [self.layer pop_addAnimation:cornerRadiusAnimation forKey:@"cornerRadiusAnimation"];
        [self.layer pop_addAnimation:opacityAnimation forKey:@"opacityAnimation"];
        [self.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    }
    
}

// show PBTinyAlert with vibration
-(void)showWithVibration{
    // vibrate
    [self vibrate];
    
    [self show];
}

// show PBTinyAlert for X seconds
-(void)showAndHideIn:(float)seconds{
    [self show];
    
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, seconds * NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^(void){
        [self hide];
    });
}

// show PBTinyAlert with vibration and hide in X seconds
-(void)showWithVibrationAndHideIn:(float)seconds{
    
    [self showAndHideIn:seconds];
    [self vibrate];
}

// hide PBTinyAlert
-(void)hide{
    
    // add special effect for bounce effect
    if (self.effectType == PBBounceEffect) {
        
        POPSpringAnimation *anim1 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
        anim1.toValue = @(-ALERT_VIEW_HEIGHT);
        anim1.velocity = @400;
        
        [self.layer pop_addAnimation:anim1 forKey:@"positionAnimation"];
        
    }
    
    // add opacity effect
    POPBasicAnimation *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    opacityAnimation.fromValue = @(1);
    opacityAnimation.toValue = @(0);
    
    // remove from superview
    [opacityAnimation setCompletionBlock:^(POPAnimation *anim, BOOL complete) {
        [self removeFromSuperview];
    }];
    
    [self.layer pop_addAnimation:opacityAnimation forKey:@"opacityAnimation2"];
    
    // set window level to normal
    self.currentWindow.windowLevel = UIWindowLevelNormal;
    
}

#pragma mark - helper methods

-(void)vibrate{
    // vibrate or make piiiiep on unsupported devices
    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
}



#pragma mark - create PBDropDownAlert

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // add touch event
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
        [self addGestureRecognizer:tapGestureRecognizer];
        
    }
    return self;
}

@end
