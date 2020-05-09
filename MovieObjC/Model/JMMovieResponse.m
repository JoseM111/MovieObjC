//
//  JMMovieResponse.m
//  MovieObjC
//
//  Created by Jose Martinez on 5/8/20.
//  Copyright © 2020 Jose Martinez. All rights reserved.
//

#import "JMMovieResponse.h"

// MARK: _@const
/**©-------------------------------------------©*/
static NSString *const kTitle = @"title";
static NSString *const kVoteAvg = @"vote_average";
static NSString *const kMovieDescription = @"overview";
/**©-------------------------------------------©*/

@implementation JMMovieResponse

// MARK: _@initWithMovieTitle
/**©------------------------------------------------------------------------------©*/
- (instancetype)initWithMovieTitle:(NSString *)title rating:(double)rating movieDescription:(NSString *)movieDescription; {
    self = super.init;
    if (self) {
        _title = title;
        _rating = rating;
        _movieDescription = movieDescription;
    }
    return self;
}
/**©------------------------------------------------------------------------------©*/

// MARK: _@initWithDictionary
/**©------------------------------------------------------------------------------©*/
- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary {
    NSString *title = dictionary[kTitle];
    // NSNumber not working. Had to change to primitive double
    double rating = [dictionary[kVoteAvg]doubleValue];
    NSString *movieDescription = dictionary[kMovieDescription];

    return [self initWithMovieTitle:title rating:rating movieDescription:movieDescription];
}
/**©------------------------------------------------------------------------------©*/

@end/// END OF CLASS @implementation
