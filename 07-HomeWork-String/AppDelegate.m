//
//  AppDelegate.m
//  07-HomeWork-String
//
//  Created by Slava on 17.03.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
//    https://developer.apple.com/reference/foundation/nsstring
    
    NSString *text = @"A string object presents itself as a sequence of UTF–16 code units. You can determine how many UTF-16 code units a string object contains with the length method and can retrieve a specific UTF-16 code unit with the character(at:​) method. These two “primitive” methods provide basic access to a string object. Most use of strings, however, is at a higher level, with the strings being treated as single entities: You compare strings against one another, search them for substrings, combine them into new strings, and so on. If you need to access string objects character by character, you must understand the Unicode character encoding, specifically issues related to composed character sequences. For details see The Unicode Standard, Version 4.0 (The Unicode Consortium, Boston: Addison-Wesley, 2003, ISBN 0-321-18578-1) and the Unicode Consortium web site: http://www.unicode.org/. See also Characters and Grapheme Clusters in String Programming Guide. Localized string comparisons are based on the Unicode Collation Algorithm, as tailored for different languages by CLDR (Common Locale Data Repository). Both are projects of the Unicode Consortium. Unicode is a registered trademark of Unicode, Inc.When creating an NSString object from a UTF-16-encoded string (or a byte stream interpreted as UTF-16), if the byte order is not otherwise specified, NSString assumes that the UTF-16 characters are big-endian, unless there is a BOM (byte-order mark), in which case the BOM dictates the byte order. When creating an NSString object from an array of unichar values, the returned string is always native-endian, since the array always contains UTF–16 code units in native byte order. It is possible to subclass NSString (and NSMutable​String), but doing so requires providing storage facilities for the string (which is not inherited by subclasses) and implementing two primitive methods. The abstract NSString and NSMutable​String classes are the public interface of a class cluster consisting mostly of private, concrete classes that create and return a string object appropriate for a given situation. Making your own concrete subclass of this cluster imposes certain requirements (discussed in Methods to Override). Make sure your reasons for subclassing NSString are valid. Instances of your subclass should represent a string and not something else. Thus the only attributes the subclass should have are the length of the character buffer it’s managing and access to individual characters in the buffer. Valid reasons for making a subclass of NSString include providing a different backing store (perhaps for better performance) or implementing some aspect of object behavior differently, such as memory management. If your purpose is to add non-essential attributes or metadata to your subclass of NSString, a better alternative would be object composition (see Alternatives to Subclassing). Cocoa already provides an example of this with the NSAttributed​String class. Often a better and easier alternative to making a subclass of NSString—or of any other abstract, public class of a class cluster, for that matter—is object composition. This is especially the case when your intent is to add to the subclass metadata or some other attribute that is not essential to a string object. In object composition, you would have an NSString object as one instance variable of your custom class (typically a subclass of NSObject) and one or more instance variables that store the metadata that you want for the custom object. Then just design your subclass interface to include accessor methods for the embedded string object and the metadata. If the behavior you want to add supplements that of the existing class, you could write a category on NSString. Keep in mind, however, that this category will be in effect for all instances of NSString that you use, and this might have unintended consequences.";
#pragma mark - lvl_1
//    Возьмите текст из моего исходника и создайте на его основе строку, с которой будете работать.
    NSString  *textTaskOne = [text substringWithRange:NSMakeRange(180, 400)];
    
//    Выведите на экран сначала первую половину текста, а потом вторую.
    NSInteger maintText = [textTaskOne length] / 2;
    NSString *partOne, *partTwo;
    partOne = [textTaskOne substringToIndex:maintText];
    partTwo = [textTaskOne substringFromIndex:maintText];
    NSLog(@"%@", textTaskOne);
    NSLog(@"%@", partOne);
    NSLog(@"%@", partTwo);
    
//    Создайте массив, каждый элемент которого является предложением данного текста.
    NSArray *array = [textTaskOne componentsSeparatedByString:@" "];
    NSLog(@"%@", array);
    
#pragma mark - lvl_2
//    Используя массив из пункта 3 создайте новый массив, элементы которого это предложения, содержащие слово NSString. Нужно будет использовать поиск и мутабл массивы
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (NSString *string in array) {
        NSRange range = [string rangeOfString:@"String" options:NSCaseInsensitiveSearch];
        if (range.location != NSNotFound) {
            [mutableArray addObject:string];
        }
    }
    NSLog(@"%@", mutableArray);
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
