//  FISAppDelegate.m

#import "FISAppDelegate.h"

@interface FISAppDelegate ()

@end


@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSString *punctuationTest = @")";
    NSLog(@"Is ! a valid punctuation? %d", [self validPunctuaton:punctuationTest]);
    
    return YES;
}

-(BOOL)validPunctuaton:(NSString *)punctuation{
    NSArray *punctuations = @[@".", @"?", @"!", @",", @";", @":", @"-"];
    for( NSString *properPunctuation in punctuations){
        if([punctuation isEqualToString:properPunctuation]){
            //NSLog(@"\n\n\n\n\n\n\n\n checking punctuation: %@", punctuation);
            return YES;
        }
    }
    return NO;
}

@end
