#import "_RGObject.h"

@interface RGObject : _RGObject {}

// Custom logic goes here.
+ (id)objectWithItemId:(NSString *)itemId inContext:(NSManagedObjectContext *)context;

@end
