//
//  ViewController.h
//  CourseMembers
//
//  Created by Jonas Hansen on 16/09/15.
//  Copyright (c) 2015 Jonas Hansen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonData.h"

@interface ViewController : UIViewController
-(void) addLabelForName:(NSString*)text atPosition:(int)position;
-(void) addLabelForPerson:(PersonData*)person atPosition:(int)position;
@end

