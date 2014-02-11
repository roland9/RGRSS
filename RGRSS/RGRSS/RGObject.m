#import "RGObject.h"
#import <CoreData+MagicalRecord.h>


@interface RGObject ()

// Private interface goes here.

@end


@implementation RGObject

// Custom logic goes here.

+ (id)objectWithItemId:(NSString *)itemId inContext:(NSManagedObjectContext *)context
{
    RGObject *object = [self MR_findFirstByAttribute:@"itemId" withValue:itemId inContext:context];
    if (object == nil)
    {
        object = [self MR_createInContext:context];
        object.itemId = itemId;
    }
    return object;
}

// isEqual: is required for the predicate search
#warning not allowed anymore
//- (BOOL)isEqual:(RGObject *)object {
//    return
//    [object.itemId isEqualToString:self.itemId]  &&
//    [object.parentId isEqualToString:self.parentId] &&
//    [object.itemDescription isEqualToString:self.itemDescription] &&
//    [object.nextLevel isEqualToString:self.nextLevel] &&
//    [object.imageFull isEqualToString:self.imageFull] &&
//    [object.imageThumbnail isEqualToString:self.imageThumbnail] &&
//    [object.articleLink isEqualToString:self.articleLink] &&
//    [object.detailHTML isEqualToString:self.detailHTML];
//    // &&     [object.numberOfSubentries isEqualToNumber:self.numberOfSubentries];
//}

@end
