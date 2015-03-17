#import "CustomCirlce.h"
#define CIRCLE_DIAMETER 70

@implementation CustomCirlce

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.opaque = YES;

        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self drawCircleWithColor:self.color];
}

- (void) drawCircleWithColor:(UIColor *)color
{
    NSLog(@"%@",NSStringFromCGRect(self.frame));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,color.CGColor);
    
    CGRect rectangle;
    if (self.circleDiameter <= 0) {
        rectangle = CGRectMake(2,2,CGRectGetWidth(self.frame)-2,CGRectGetHeight(self.frame)-2);
    } else {
        rectangle = CGRectMake(2,2,self.circleDiameter-2,self.circleDiameter-2);
    }

    CGContextAddEllipseInRect(context, rectangle);
    CGContextClip(context);
    CGContextFillRect(context,rectangle);

}



@end
