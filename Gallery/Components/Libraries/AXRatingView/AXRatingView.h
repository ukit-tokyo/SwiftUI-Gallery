//
//  AXRatingView.h
//

#import <UIKit/UIKit.h>

@interface AXRatingView : UIControl {
  CALayer *_starMaskLayer;
  CALayer *_highlightLayer;
  UIImage *_markImage;
  UIImage *_maskImage;
}
@property (nonatomic) NSUInteger numberOfStar;
@property (copy, nonatomic) NSString *markCharacter;
@property (strong, nonatomic) UIFont *markFont;
@property (strong, nonatomic) UIImage *markImage;
@property (strong, nonatomic) UIImage *maskImage;
@property (strong, nonatomic) UIColor *baseColor;
@property (strong, nonatomic) UIColor *highlightColor;
@property (nonatomic) float padding;
@property (nonatomic) float value;
@property (nonatomic) float stepInterval;
@property (nonatomic) float minimumValue;
@property float iconSize;

@end
