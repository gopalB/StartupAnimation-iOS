#import "ABStartupWindow.h"
#import "ABSplashViewController.h"

@interface ABStartupWindow()

@end

@implementation ABStartupWindow

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.windowLevel = UIWindowLevelNormal + 1.0f;
                
        ABSplashViewController *vc = [[ABSplashViewController alloc] init];
        vc.window = self;
        self.rootViewController = vc;
        
    }
    return self;
}


@end
