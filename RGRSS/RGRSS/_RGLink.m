// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RGLink.m instead.

#import "_RGLink.h"

const struct RGLinkAttributes RGLinkAttributes = {
	.href = @"href",
	.rel = @"rel",
	.title = @"title",
	.type = @"type",
};

const struct RGLinkRelationships RGLinkRelationships = {
};

const struct RGLinkFetchedProperties RGLinkFetchedProperties = {
};

@implementation RGLinkID
@end

@implementation _RGLink

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"RGLink" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"RGLink";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"RGLink" inManagedObjectContext:moc_];
}

- (RGLinkID*)objectID {
	return (RGLinkID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic href;






@dynamic rel;






@dynamic title;






@dynamic type;











@end
