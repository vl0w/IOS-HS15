//
//  PersonData.h
//  CourseMembers
//
//  Created by Jonas Hansen on 16/09/15.
//  Copyright (c) 2015 Jonas Hansen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonData : NSObject
@property(strong) NSString* firstName;
@property(strong) NSString* lastName;
@property int plz;

-(instancetype) initWithFirstName:(NSString*)firstName lastName:(NSString*)lastName andPLZ:(int)plz;
@end
