//
//  ViewController.m
//  DemoJsonOC
//
//  Created by Uyen Cao on 4/11/18.
//  Copyright © 2018 Uyen Cao. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelName;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    User *newUser = [[User alloc] init];
    newUser = [self parseJsonToUser];
//    [_labelName setText: newUser.name];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSDictionary *)getFileJson {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"document" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

- (User *)parseJsonToUser {
    NSDictionary *json1 = [self getFileJson];
    NSDictionary *json = json1[@"user"];
    User *user = [[User alloc] init];
    user.name = [json objectForKey:@"name"];
    [_labelName setText: user.name];
    user.address = [json objectForKey:@"address"];
    user.year = [[json objectForKey:@"year"] integerValue];
    user.age = [[json objectForKey:@"age"] integerValue];
    user.sex = [[json objectForKey:@"sex"] boolValue];
    return user;
}


@end
