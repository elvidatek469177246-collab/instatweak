#import <UIKit/UIKit.h>

extern NSString * const kCFStreamPropertyHTTPProxyHost;
extern NSString * const kCFStreamPropertyHTTPProxyPort;
extern NSString * const kCFStreamPropertyHTTPSProxyHost;
extern NSString * const kCFStreamPropertyHTTPSProxyPort;

%hook NSURLSessionConfiguration

- (NSDictionary *)connectionProxyDictionary {
    NSMutableDictionary *proxyDict = [[NSMutableDictionary alloc] init];
    
    [proxyDict setObject:@"117.32.37.72" forKey:kCFStreamPropertyHTTPProxyHost];
    [proxyDict setObject:[NSNumber numberWithInt:8080] forKey:kCFStreamPropertyHTTPProxyPort];
    
    [proxyDict setObject:@"117.32.37.72" forKey:kCFStreamPropertyHTTPSProxyHost];
    [proxyDict setObject:[NSNumber numberWithInt:8080] forKey:kCFStreamPropertyHTTPSProxyPort];
    
    return proxyDict;
}

%end

%hook INSplashViewController

- (void)viewDidAppear:(BOOL)animated {
    %orig;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"تم التفعيل"
                                                                   message:@"🔐 انستقرام يرى IP مختلف\n\nالـ IP الذي يشوفه انستقرام: 117.32.37.72\n\n✅ تم تغيير IP التطبيق بنجاح..."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:@"موافق"
                                                            style:UIAlertActionStyleDefault
                                                          handler:nil];
    [alert addAction:dismissAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

%end
