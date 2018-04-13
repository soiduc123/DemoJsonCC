//
//  ViewController.m
//  DemoJsonOC
//
//  Created by Uyen Cao on 4/11/18.
//  Copyright © 2018 Uyen Cao. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
#import "APIHandler.h"
#import "Weather.h"

static NSString * const APIKey = @"54b757e7a79111bbb062aa4c2e506067";

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblHumidity;
@property (weak, nonatomic) IBOutlet UILabel *lblTemperature;
@property (weak, nonatomic) IBOutlet UILabel *lblPressure;
@property (weak, nonatomic) IBOutlet UILabel *lblWindSpeed;
@property (weak, nonatomic) IBOutlet UILabel *lblClouds;
@property (weak, nonatomic) IBOutlet UITextField *txfCityName;


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
    [self fetchWeatherData: self.txfCityName.text];
}

#pragma mark - Fetch JSON from URL
- (void)fetchWeatherData:(NSString *)cityName {
    NSString *urlAsString = [NSString stringWithFormat: @"http://api.openweathermap.org/data/2.5/weather?q=%@&appid=%@", cityName, APIKey];
    NSURL *url = [NSURL URLWithString: [urlAsString stringByReplacingOccurrencesOfString: @" " withString: @"%20"]];
    APIHandler *apiHandler = [[APIHandler alloc] init];
    [apiHandler fetchDataFromUrl: url responseHandler:^(NSDictionary *response, NSError *error) {
        if (error) {
            NSLog(@"error %@", error);
        } else {
            Weather *weather = [[Weather alloc] init];
            weather.humidity = [[response[@"main"] objectForKey: @"humidity"] integerValue];
            weather.temperature = [[response[@"main"] objectForKey: @"temp"] stringValue];
            weather.pressure = [[response[@"main"] objectForKey: @"pressure"] integerValue];
            weather.pressure = [[response[@"main"] objectForKey: @"pressure"] integerValue];
            weather.windSpeed = [[response[@"wind"] objectForKey: @"speed"] stringValue];
            weather.clouds = [[response[@"coulds"] objectForKey: @"all"] integerValue];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self showWeatherData: weather];
            });
        }
    }];
}

#pragma mark - Fetch JSON from local file
- (NSDictionary *)getFileJson {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"document" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

- (User *)parseJsonToUser {
    NSDictionary *json = [self getFileJson][@"user"];
    NSLog(@" %@", json);
    User *user = [[User alloc] init];
    user.name = [json objectForKey:@"name"];
    user.address = [json objectForKey:@"address"];
    user.year = [[json objectForKey:@"year"] integerValue];
    user.age = [[json objectForKey:@"age"] integerValue];
    user.sex = [[json objectForKey:@"sex"] boolValue];
    return user;
}

#pragma mark - Show weather data
-(void)showWeatherData:(Weather *)weather {
    self.lblHumidity.text = [NSString stringWithFormat: @"Humidity: %ld", weather.humidity];
    self.lblTemperature.text = [NSString stringWithFormat: @"Temperature: %@", weather.temperature];
    self.lblPressure.text = [NSString stringWithFormat: @"Pressure: %ld", weather.pressure];
    self.lblWindSpeed.text = [NSString stringWithFormat: @"Pressure: %@", weather.windSpeed];
    self.lblClouds.text = [NSString stringWithFormat: @"Pressure: %ld", weather.clouds];
}
@end
