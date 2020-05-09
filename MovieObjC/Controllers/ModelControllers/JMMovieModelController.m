#import "JMMovieModelController.h"
#import "JMMovieResponse.h"

// MARK: _@
/**©-------------------------------------------©*/
static NSString * const baseURLStr = @"https://api.themoviedb.org/3";
static NSString * const searchComponent = @"search";
static NSString * const movieComponent = @"movie";
static NSString * const apiKeyItemName = @"api_key";
static NSString * const apiKeyItemValue = @"d46fc3080047bb75e3d11591c0e20445";
static NSString * const searchTermQuery = @"query";
/**©-------------------------------------------©*/

@implementation JMMovieModelController
// MARK: _@fetchMovieForSearchTerm
/**©------------------------------------------------------------------------------©*/
+ (void)fetchMovieForSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray<JMMovieResponse *> *))completion {
    // 1) - URL
    NSURL *baseURL = [NSURL URLWithString:baseURLStr];
    NSURL *searchURL = [baseURL URLByAppendingPathComponent:searchComponent];
    NSURL *movieURL = [searchURL URLByAppendingPathComponent:movieComponent];

    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:movieURL resolvingAgainstBaseURL:true];

    NSURLQueryItem *apiKey = [NSURLQueryItem.alloc initWithName:apiKeyItemName value:apiKeyItemValue];
    NSURLQueryItem *searchQuery = [NSURLQueryItem.alloc initWithName:searchTermQuery value:searchTerm];
    urlComponents.queryItems = @[apiKey, searchQuery];

    NSURL *fullURL = urlComponents.URL;
    NSLog(@"--------------------------------------------"
          " %@"
          "--------------------------------------------", fullURL);

    // 2) - Data-Task
    [[NSURLSession.sharedSession dataTaskWithURL:fullURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    // 3) - Error-Handling
    if (error) {
        NSLog(@"---------------------------------------------------------"
              " Found URL..SYKE!!!🤣 YOUR URL IS HOT GARBAGE[404]..\n%@"
              "---------------------------------------------------------",
              error.localizedDescription);
    }

    /// NOT DEALING WITH RESPONSE (data, _, error)<<-- Swift 4 LIFE💆🏾‍♂️

    // 4) - Check for Data
        if (!data) {
            NSLog(@"Error: No data was returned from the data task...");
            completion(nil);
            return;
        }

    // 5) - Decode-Data
        NSDictionary *jsonTopDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];

        if (!jsonTopDict || ![jsonTopDict isKindOfClass:NSDictionary.class]) {
            NSLog(@"Unable to create a dictionary from the data");
            completion(nil);
            return;
        }

        NSMutableArray *weGotMoviesArray = NSMutableArray.new;
        NSArray *getAllMoviesArray = jsonTopDict[@"results"];

        for (NSDictionary *moviesDict in getAllMoviesArray) {
            JMMovieResponse *movie = [JMMovieResponse.alloc initWithDictionary:moviesDict];

            [weGotMoviesArray addObject:movie];
            completion(weGotMoviesArray);
        }
    }] resume];
}/// END OF FUNC @implementation
/**©------------------------------------------------------------------------------©*/

@end/// END OF CLASS @implementation
