// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RGObject.m instead.

#import "_RGObject.h"

const struct RGObjectAttributes RGObjectAttributes = {
	.articleLink = @"articleLink",
	.detailHTML = @"detailHTML",
	.imageFull = @"imageFull",
	.imageThumbnail = @"imageThumbnail",
	.itemDescription = @"itemDescription",
	.itemId = @"itemId",
	.nextLevel = @"nextLevel",
	.numberOfSubentries = @"numberOfSubentries",
	.parentId = @"parentId",
};

const struct RGObjectRelationships RGObjectRelationships = {
};

const struct RGObjectFetchedProperties RGObjectFetchedProperties = {
};

@implementation RGObjectID
@end

@implementation _RGObject

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"RGObject" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"RGObject";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"RGObject" inManagedObjectContext:moc_];
}

- (RGObjectID*)objectID {
	return (RGObjectID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"numberOfSubentriesValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"numberOfSubentries"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic articleLink;






@dynamic detailHTML;






@dynamic imageFull;






@dynamic imageThumbnail;






@dynamic itemDescription;






@dynamic itemId;






@dynamic nextLevel;






@dynamic numberOfSubentries;



- (int32_t)numberOfSubentriesValue {
	NSNumber *result = [self numberOfSubentries];
	return [result intValue];
}

- (void)setNumberOfSubentriesValue:(int32_t)value_ {
	[self setNumberOfSubentries:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveNumberOfSubentriesValue {
	NSNumber *result = [self primitiveNumberOfSubentries];
	return [result intValue];
}

- (void)setPrimitiveNumberOfSubentriesValue:(int32_t)value_ {
	[self setPrimitiveNumberOfSubentries:[NSNumber numberWithInt:value_]];
}





@dynamic parentId;











@end
