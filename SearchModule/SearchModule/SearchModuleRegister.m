//
//  SearchModuleRegister.m
//  SearchModule
//
//  Created by Jake Cai on 2019/8/2.
//  Copyright © 2019 Jake. All rights reserved.
//

#import "SearchModuleRegister.h"
#import <SearchModule/SearchModule-Swift.h>

@implementation SearchModuleRegister

+ (void)load {
    [SearchModule registerClass];
}

@end
