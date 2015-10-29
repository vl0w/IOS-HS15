//
//  ViewController.m
//  ComAndCon
//
//  Created by Jonas Hansen on 28/10/15.
//  Copyright © 2015 Jonas Hansen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dummyStrings = [[NSArray alloc]initWithObjects:@"One",@"Two",@"Three", nil];
    self.pickerStrings = self.dummyStrings;
}

- (IBAction)dataSourceChangePressed:(id)sender {
    UISegmentedControl* control = sender;
    if(control.selectedSegmentIndex==0){
        self.pickerStrings = self.dummyStrings;
    }else if(control.selectedSegmentIndex==1){
        self.pickerStrings = [self getXMLData];
    }else{
        self.pickerStrings = [self getJSONData];
    }
    
    // Reload component
    [self.pickerView reloadAllComponents];
}

- (IBAction)testOperationQueuePressedWithSender:(id)sender {
    NSMutableArray* orderArray = [[NSMutableArray alloc]init];
    
    NSBlockOperation* blockOp1 = [NSBlockOperation blockOperationWithBlock:^{
        [orderArray addObject:@"1"];
    }];
    
    NSBlockOperation* blockOp2 = [NSBlockOperation blockOperationWithBlock:^{
        [orderArray addObject:@"2"];
    }];
    
    NSBlockOperation* blockOp3 = [NSBlockOperation blockOperationWithBlock:^{
        [orderArray addObject:@"3"];
    }];

    [blockOp1 addDependency:blockOp2];
    [blockOp1 addDependency:blockOp3];
    [blockOp2 addDependency:blockOp3];
    
    // Invoke operations
    NSArray* blocks = [[NSArray alloc]initWithObjects:blockOp1, blockOp2, blockOp3, nil];
    
    NSOperationQueue* queue = [[NSOperationQueue alloc]init];
    [queue addOperations:blocks waitUntilFinished:YES];
    
    // Alert view
    NSString* alertMessage = [[NSString alloc]initWithFormat:@"The operations were processed in this order: %@->%@->%@",
                                                                    [orderArray objectAtIndex:0],
                                                                    [orderArray objectAtIndex:1],
                                                                    [orderArray objectAtIndex:2]];
    
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"Order"
                                                                             message:alertMessage
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* actionOk = [UIAlertAction actionWithTitle:@"Ok"
                                                style:UIAlertActionStyleDefault
                                                     handler:nil];
    [alertController addAction:actionOk];
    [self presentViewController:alertController animated:YES completion:nil];
}

// MARK: PickerView behaviour

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.pickerStrings.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.pickerStrings[row];
}

// MARK: JSON

- (NSArray*)getJSONData{
    self.tmpXmlStrings = [[NSMutableArray alloc]init];
    
    NSURL* url = [[NSURL alloc]initWithString:@"http://wherever.ch/hslu/iPhoneAdressData.json"];
    NSData* data = [[NSData alloc]initWithContentsOfURL:url];
    
    NSArray* jsonArray = [[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil]init];

    for(NSDictionary* item in jsonArray){
        NSString* concatenatedString = [[NSString alloc] initWithFormat:@"%@ %@ %@"
                                        ,[item objectForKey:@"firstName"]
                                        , [item objectForKey:@"lastName"]
                                        , [item objectForKey:@"plz"]];
        [self.tmpXmlStrings addObject:concatenatedString];
    }
    
    return self.tmpXmlStrings;
}

// MARK: XML

- (NSArray*)getXMLData{
    self.tmpXmlStrings = [[NSMutableArray alloc]init];
    
    NSURL* url = [[NSURL alloc]initWithString:@"http://wherever.ch/hslu/iPhoneAdressData.xml"];
    NSXMLParser* parser = [[NSXMLParser alloc]initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser parse];
    return self.tmpXmlStrings;
}


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    if([elementName isEqualToString:@"Entry"]){
        NSString* concatenatedString = [[NSString alloc] initWithFormat:@"%@ %@ %@"
                                        ,[attributeDict objectForKey:@"firstName"]
                                        , [attributeDict objectForKey:@"lastName"]
                                        , [attributeDict objectForKey:@"plz"]];
        [self.tmpXmlStrings addObject:concatenatedString];
    }
}

@end
