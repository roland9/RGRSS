#import "RGChannel.h"
#import <CoreData+MagicalRecord.h>


@interface RGChannel ()

// Private interface goes here.

@end


@implementation RGChannel

// Custom logic goes here.

+ (id) feedWithName:(NSString *)name inContext:(NSManagedObjectContext *)context
{
    RGChannel *feed = [self MR_findFirstByAttribute:@"link" withValue:name inContext:context];
    if (feed == nil)
    {
        feed = [self MR_createInContext:context];
        feed.link = name;
    }
    return feed;
}

@end
