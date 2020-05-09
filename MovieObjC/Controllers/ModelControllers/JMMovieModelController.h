#import <Foundation/Foundation.h>

@class JMMovieResponse;

NS_ASSUME_NONNULL_BEGIN

@interface JMMovieModelController : NSObject

// MARK: _@
/**©------------------------------------------------------------------------------©*/
+(void) fetchMovieForSearchTerm:(NSString *)searchTerm
                     completion:(void (^) (NSArray <JMMovieResponse *> *_Nullable movies))completion;
/**©------------------------------------------------------------------------------©*/
@end

NS_ASSUME_NONNULL_END
