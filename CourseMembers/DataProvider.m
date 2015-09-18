//
//  DataProvider.m
//  CourseMembers
//
//  Created by Jonas Hansen on 16/09/15.
//  Copyright (c) 2015 Jonas Hansen. All rights reserved.
//

#import "DataProvider.h"
#import "PersonData.h"

@implementation DataProvider

static DataProvider* dataProvider;

+(DataProvider*) sharedDataProvider{
    if(dataProvider == nil){
        dataProvider = [[DataProvider alloc]init];
    }
    return dataProvider;
}

-(instancetype)init {
    // Names
    NSArray* memberNames = [NSArray arrayWithObjects:
                            @"Jonas",
                            @"Michi",
                            @"Silvio",
                            @"Steffi",
                            @"Dorian",
                            @"Rainer",
                            nil
    ];
    self.memberNames = memberNames;
    
    // Persons
    NSArray* memberPersons = [NSArray arrayWithObjects:
                              [[PersonData alloc] initWithFirstName:@"Jonas" lastName:@"Hansen" andPLZ:6218],
                              [[PersonData alloc] initWithFirstName:@"Michael" lastName:@"Zurmühle" andPLZ:1],
                              [[PersonData alloc] initWithFirstName:@"Silvio" lastName:@"Stappung" andPLZ:1337],
                              [[PersonData alloc] initWithFirstName:@"Steffanie" lastName:@"Vogel" andPLZ:2],
                              [[PersonData alloc] initWithFirstName:@"Dorian" lastName:@"der Übermensch" andPLZ:-1],
                              [[PersonData alloc] initWithFirstName:@"Rainer" lastName:@"Winkler" andPLZ:91448],
                              nil
    ];
    self.memberPersons = memberPersons;
    
    return self;
}

@end
