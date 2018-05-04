//
//  ViewController.m
//  DemoJsonOC
//
//  Created by Uyen Cao on 4/11/18.
//  Copyright © 2018 Uyen Cao. All rights reserved.
//

#import "ViewController.h"
#import <dispatch/dispatch.h>
#import "WClient.h"
#import "WTMainModel.h"
#import "WTResponseModel.h"

static NSString * const APIKey = @"54b757e7a79111bbb062aa4c2e506067";

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblHumidity;
@property (weak, nonatomic) IBOutlet UILabel *lblTemperature;
@property (weak, nonatomic) IBOutlet UILabel *lblPressure;
@property (weak, nonatomic) IBOutlet UILabel *lblWindSpeed;
@property (weak, nonatomic) IBOutlet UILabel *lblClouds;
@property (weak, nonatomic) IBOutlet UITextField *txfCityName;
@property (weak, nonatomic) IBOutlet UIImageView *imgBackGround;
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic) dispatch_group_t group;

@end

@implementation ViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)txfCityNameDidEndOnExit:(id)sender {
    [[WClient shared] getWeatherStatus: self.txfCityName.text withSuccessBlock:^(WTResponseModel *response) {
        [self showData: response];
    } andOnFailure:^(WTError *error) {
        [self clearData];
        [self alert: error.message title: @"lỗi"];
    }];
}

-(void)showData:(WTResponseModel *)weather {
    self.lblHumidity.text = [NSString stringWithFormat: @"Humidity: %@", [weather main].humidity];
    self.lblTemperature.text = [NSString stringWithFormat: @"Temperature: %@", [weather main].temp];
    self.lblPressure.text = [NSString stringWithFormat: @"Pressure: %@", [weather main].pressure];
    self.lblWindSpeed.text = [NSString stringWithFormat: @"WindSpeed: %@", [weather wind].speed];
    self.lblClouds.text = [NSString stringWithFormat: @"Clouds: %@", [weather clouds].all];
}

-(void)clearData {
    self.txfCityName.text = @"";
    self.lblHumidity.text = @"Humidity";
    self.lblTemperature.text = @"Temperature";
    self.lblPressure.text = @"Pressure";
    self.lblWindSpeed.text = @"WindSpeed";
    self.lblClouds.text = @"Clouds";
}

#pragma mark - create Notification
-(void)createNotification {
    [[NSNotificationCenter defaultCenter] addObserver: self selector:@selector(receivedNotification:) name: @"Fetch Error" object: nil];
}

-(void)receivedNotification:(NSNotification *) notification {
    if([[notification name] isEqualToString: @"Fetch Error"]) {
        [self alert:[notification.userInfo[@"error"] objectForKey: @"message"] title: @"Error"];
    }
}

#pragma mark - Alert
-(void)alert:(NSString *)message title:(NSString *)title {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle: title message: message preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle: @"OK" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
    [alert addAction: defaultAction];
    [self presentViewController: alert animated:true completion: nil];
}

@end
