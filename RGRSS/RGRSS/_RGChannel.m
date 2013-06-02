// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RGChannel.m instead.

#import "_RGChannel.h"

const struct RGChannelAttributes RGChannelAttributes = {
	.cloud = @"cloud",
	.copyright = @"copyright",
	.docs = @"docs",
	.feedDescription = @"feedDescription",
	.generator = @"generator",
	.language = @"language",
	.lastBuildDate = @"lastBuildDate",
	.link = @"link",
	.managingEditor = @"managingEditor",
	.pubDate = @"pubDate",
	.title = @"title",
	.ttl = @"ttl",
	.webMaster = @"webMaster",
};

const struct RGChannelRelationships RGChannelRelationships = {
	.category = @"category",
	.items = @"items",
};

const struct RGChannelFetchedProperties RGChannelFetchedProperties = {
};

@implementation RGChannelID
@end

@implementation _RGChannel

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"RGChannel" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"RGChannel";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"RGChannel" inManagedObjectContext:moc_];
}

- (RGChannelID*)objectID {
	return (RGChannelID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"ttlValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"ttl"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic cloud;






@dynamic copyright;






@dynamic docs;






@dynamic feedDescription;






@dynamic generator;






@dynamic language;






@dynamic lastBuildDate;






@dynamic link;






@dynamic managingEditor;






@dynamic pubDate;






@dynamic title;






@dynamic ttl;



- (int32_t)ttlValue {
	NSNumber *result = [self ttl];
	return [result intValue];
}

- (void)setTtlValue:(int32_t)value_ {
	[self setTtl:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveTtlValue {
	NSNumber *result = [self primitiveTtl];
	return [result intValue];
}

- (void)setPrimitiveTtlValue:(int32_t)value_ {
	[self setPrimitiveTtl:[NSNumber numberWithInt:value_]];
}





@dynamic webMaster;






@dynamic category;

	

@dynamic items;

	






@end
