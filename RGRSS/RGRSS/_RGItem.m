// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RGItem.m instead.

#import "_RGItem.h"

const struct RGItemAttributes RGItemAttributes = {
	.author = @"author",
	.comments = @"comments",
	.enclosure = @"enclosure",
	.guid = @"guid",
	.itemDescription = @"itemDescription",
	.linkXXX = @"linkXXX",
	.pubDate = @"pubDate",
	.source = @"source",
	.title = @"title",
};

const struct RGItemRelationships RGItemRelationships = {
	.category = @"category",
	.channel = @"channel",
};

const struct RGItemFetchedProperties RGItemFetchedProperties = {
};

@implementation RGItemID
@end

@implementation _RGItem

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"RGItem" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"RGItem";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"RGItem" inManagedObjectContext:moc_];
}

- (RGItemID*)objectID {
	return (RGItemID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic author;






@dynamic comments;






@dynamic enclosure;






@dynamic guid;






@dynamic itemDescription;






@dynamic linkXXX;






@dynamic pubDate;






@dynamic source;






@dynamic title;






@dynamic category;

	

@dynamic channel;

	






@end
