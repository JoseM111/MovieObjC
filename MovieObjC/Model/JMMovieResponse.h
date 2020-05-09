#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMMovieResponse : NSObject

// MARK: _@Properties
/**©------------------------------------------------------------------------------©*/
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly) double rating;
@property (nonatomic, readonly, copy) NSString *movieDescription;
/**©------------------------------------------------------------------------------©*/

// MARK: _@
/**©------------------------------------------------------------------------------©*/
-(instancetype) initWithMovieTitle:(NSString *)title
                            rating:(double)rating
                  movieDescription:(NSString *)movieDescription;
/**©------------------------------------------------------------------------------©*/

@end

// MARK: _@Extension of JMMovieResponse: JSONConvertable
/**©------------------------------------------------------------------------------©*/
@interface JMMovieResponse (JSONConvertable)
-(instancetype) initWithDictionary:(NSDictionary <NSString *, id> *)dictionary;
@end
/**©------------------------------------------------------------------------------©*/

NS_ASSUME_NONNULL_END
