#import "ABSplashViewController.h"
#import "CustomCirlce.h"

@interface ABSplashViewController()
@property (nonatomic,strong) UIView *containerView;
@property (nonatomic,strong) CustomCirlce *customCircle;
@end

@implementation ABSplashViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
    self.containerView = [[UIView alloc] initWithFrame:self.view.frame];
    self.containerView.backgroundColor =  [UIColor colorWithRed:52/255.0 green:152/255.0 blue:219/255.0 alpha:1.0];
    
    self.customCircle = [[CustomCirlce alloc] initWithFrame:CGRectMake(100, 100, 82, 82)];
    self.customCircle.circleDiameter = 80.0;
    self.customCircle.color = [UIColor whiteColor];
    self.customCircle.center = self.view.center;
    
    [self.containerView addSubview:self.customCircle];
    
    [self.view addSubview:self.containerView];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    __weak ABSplashViewController *weak = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            weak.customCircle.transform = CGAffineTransformMakeScale(0.8, 0.8);
        }completion:^(BOOL finished){
            [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                weak.customCircle.transform = CGAffineTransformMakeScale(10.5, 10.5);
                weak.containerView.alpha = 0.5;
            } completion:^(BOOL finished){
                weak.window.hidden = YES;
            }];
            
        }];
        
    });
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


@end
