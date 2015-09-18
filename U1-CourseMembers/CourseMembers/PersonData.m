//
//  PersonData.m
//  CourseMembers
//
//  Created by Jonas Hansen on 16/09/15.
//  Copyright (c) 2015 Jonas Hansen. All rights reserved.
//

#import "PersonData.h"

@implementation PersonData
-(instancetype) initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName andPLZ:(int)plz{
    self.firstName = firstName;
    self.lastName = lastName;
    self.plz = plz;
    return self;
}

@end
