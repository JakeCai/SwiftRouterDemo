//
//  UserModuleRegister.m
//  UserModule
//
//  Created by Jake Cai on 2019/8/2.
//  Copyright © 2019 Jake. All rights reserved.
//

#import "UserModuleRegister.h"
#import <UserModule/UserModule-Swift.h>

@implementation UserModuleRegister

+ (void)load {
    [UserModule registerClass];
}

@end
