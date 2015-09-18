//
//  ViewController.m
//  CourseMembers
//
//  Created by Jonas Hansen on 16/09/15.
//  Copyright (c) 2015 Jonas Hansen. All rights reserved.
//

#import "ViewController.h"
#import "DataProvider.h"
#import "PersonData.h"

#define TITLE_FONT_SIZE 30
#define TITLE_LABEL_Y_POSITION 50
#define LABEL_FONT_SIZE 20

#define USE_PERSON_DATA true

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // View (general)
    self.view.backgroundColor = [UIColor blackColor];
    
    // Generate title label
    UILabel* titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, TITLE_LABEL_Y_POSITION, self.view.bounds.size.width, TITLE_FONT_SIZE+10)];
    titleLabel.text = @"Hello TA.BA_IOS.HS1501";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:TITLE_FONT_SIZE];
    titleLabel.textColor = [UIColor orangeColor];

    // Add labels
    DataProvider* dataProvider = [DataProvider sharedDataProvider];
    int count = 0;
    if(USE_PERSON_DATA){
        for(PersonData* person in dataProvider.memberPersons){
            [self addLabelForPerson:person atPosition:++count];
        }
    }else{
        for(NSString* name in dataProvider.memberNames){
            [self addLabelForName:name atPosition:++count];
        }
    }
    
    [self.view addSubview:titleLabel];
}

- (void)addLabelForName:(NSString *)name atPosition:(int)position{
    // Color
    UIColor* textColor;
    switch(position%3){
        case 1:
            textColor = [UIColor greenColor];
            break;
        case 2:
            textColor = [UIColor whiteColor];
            break;
        default:
            textColor = [UIColor redColor];
            break;
    }
    
    // Alignment
    int textAlignment;
    switch(position%2){
        case 1:
            textAlignment = NSTextAlignmentLeft;
            break;
        default:
            textAlignment = NSTextAlignmentRight;
            break;
    }
    
    // Label
    UILabel* nameLabel = [[UILabel alloc]initWithFrame:[self getLabelFrameForPosition:position]];
    nameLabel.text = name;
    nameLabel.textAlignment = textAlignment;
    nameLabel.textColor = textColor;
    nameLabel.font = [UIFont systemFontOfSize:LABEL_FONT_SIZE];

    [self.view addSubview:nameLabel];
}

-(void) addLabelForPerson:(PersonData*)person atPosition:(int)position{
    UIColor* textColor = [UIColor greenColor];
    UIFont* font = [UIFont systemFontOfSize:LABEL_FONT_SIZE];
    
    UILabel* firstNameLabel = [[UILabel alloc]initWithFrame:[self getLabelFrameForPosition:position]];
    firstNameLabel.text = person.firstName;
    firstNameLabel.textAlignment = NSTextAlignmentLeft;
    firstNameLabel.textColor = textColor;
    firstNameLabel.font = font;
    [self.view addSubview:firstNameLabel];
    
    UILabel* lastNameLabel = [[UILabel alloc]initWithFrame:[self getLabelFrameForPosition:position]];
    lastNameLabel.text = person.lastName;
    lastNameLabel.textAlignment = NSTextAlignmentCenter;
    lastNameLabel.textColor = textColor;
    lastNameLabel.font = font;
    [self.view addSubview:lastNameLabel];
    
    UILabel* plzLabel = [[UILabel alloc]initWithFrame:[self getLabelFrameForPosition:position]];
    plzLabel.text = [NSString stringWithFormat:@"%i",person.plz];
    plzLabel.textAlignment = NSTextAlignmentRight;
    plzLabel.textColor = textColor;
    plzLabel.font = font;
    [self.view addSubview:plzLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGRect) getLabelFrameForPosition:(int)position{
    CGFloat height = TITLE_FONT_SIZE+30;
    int xOffset = 30;
    int yPosition = TITLE_LABEL_Y_POSITION + height + (position * height);
    CGRect frame = CGRectMake(xOffset,yPosition,self.view.bounds.size.width - 2*xOffset,height);
    return frame;
}

@end
