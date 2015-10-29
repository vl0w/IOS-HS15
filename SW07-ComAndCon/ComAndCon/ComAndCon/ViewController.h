//
//  ViewController.h
//  ComAndCon
//
//  Created by Jonas Hansen on 28/10/15.
//  Copyright © 2015 Jonas Hansen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, NSXMLParserDelegate>

@property (strong, nonatomic) NSArray* pickerStrings;
@property (strong, nonatomic) NSArray* dummyStrings;
@property (strong, nonatomic) NSMutableArray* tmpXmlStrings;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

- (IBAction)dataSourceChangePressed:(id)sender;
- (IBAction)testOperationQueuePressedWithSender:(id)sender;

- (NSArray*)getXMLData;
- (NSArray*)getJSONData;

@end

