// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RGCategory.m instead.

#import "_RGCategory.h"

const struct RGCategoryAttributes RGCategoryAttributes = {
	.category = @"category",
};

const struct RGCategoryRelationships RGCategoryRelationships = {
	.channel = @"channel",
	.item = @"item",
};

const struct RGCategoryFetchedProperties RGCategoryFetchedProperties = {
};

@implementation RGCategoryID
@end

@implementation _RGCategory

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"RGCategory" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"RGCategory";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"RGCategory" inManagedObjectContext:moc_];
}

- (RGCategoryID*)objectID {
	return (RGCategoryID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic category;






@dynamic channel;

	

@dynamic item;

	






@end
