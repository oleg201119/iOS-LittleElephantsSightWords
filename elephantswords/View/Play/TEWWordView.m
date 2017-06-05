//
//  TEWWordView.m
//  elephantswords
//
//  Created by star on 6/3/17.
//  Copyright © 2017 gavin. All rights reserved.
//

#import "TEWWordView.h"

@implementation TEWWordView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self initView];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initView];
    }
    
    return self;
}

- (void)initView {
    [[NSBundle mainBundle] loadNibNamed:@"WordView" owner:self options:nil];
    
    [self addSubview:self.contentView];
    self.contentView.frame = self.bounds;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
