//
//  DataProvider.h
//  CourseMembers
//
//  Created by Jonas Hansen on 16/09/15.
//  Copyright (c) 2015 Jonas Hansen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataProvider : NSObject
@property(strong) NSArray* memberNames;
@property(strong) NSArray* memberPersons;

+(DataProvider*) sharedDataProvider;
@end
