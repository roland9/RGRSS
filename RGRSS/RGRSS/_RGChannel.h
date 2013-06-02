// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RGChannel.h instead.

#import <CoreData/CoreData.h>


extern const struct RGChannelAttributes {
	 NSString *cloud;
	 NSString *copyright;
	 NSString *docs;
	 NSString *feedDescription;
	 NSString *generator;
	 NSString *language;
	 NSString *lastBuildDate;
	 NSString *link;
	 NSString *managingEditor;
	 NSString *pubDate;
	 NSString *title;
	 NSString *ttl;
	 NSString *webMaster;
} RGChannelAttributes;

extern const struct RGChannelRelationships {
	 NSString *category;
	 NSString *items;
} RGChannelRelationships;

extern const struct RGChannelFetchedProperties {
} RGChannelFetchedProperties;

@class RGCategory;
@class RGItem;















@interface RGChannelID : NSManagedObjectID {}
@end

@interface _RGChannel : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (RGChannelID*)objectID;





@property (nonatomic, retain) NSString* cloud;



//- (BOOL)validateCloud:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSString* copyright;



//- (BOOL)validateCopyright:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSString* docs;



//- (BOOL)validateDocs:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSString* feedDescription;



//- (BOOL)validateFeedDescription:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSString* generator;



//- (BOOL)validateGenerator:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSString* language;



//- (BOOL)validateLanguage:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSDate* lastBuildDate;



//- (BOOL)validateLastBuildDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSString* link;



//- (BOOL)validateLink:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSString* managingEditor;



//- (BOOL)validateManagingEditor:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSDate* pubDate;



//- (BOOL)validatePubDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSNumber* ttl;



@property int32_t ttlValue;
- (int32_t)ttlValue;
- (void)setTtlValue:(int32_t)value_;

//- (BOOL)validateTtl:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSString* webMaster;



//- (BOOL)validateWebMaster:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) RGCategory *category;

//- (BOOL)validateCategory:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) RGItem *items;

//- (BOOL)validateItems:(id*)value_ error:(NSError**)error_;





@end

@interface _RGChannel (CoreDataGeneratedAccessors)

@end

@interface _RGChannel (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveCloud;
- (void)setPrimitiveCloud:(NSString*)value;




- (NSString*)primitiveCopyright;
- (void)setPrimitiveCopyright:(NSString*)value;




- (NSString*)primitiveDocs;
- (void)setPrimitiveDocs:(NSString*)value;




- (NSString*)primitiveFeedDescription;
- (void)setPrimitiveFeedDescription:(NSString*)value;




- (NSString*)primitiveGenerator;
- (void)setPrimitiveGenerator:(NSString*)value;




- (NSString*)primitiveLanguage;
- (void)setPrimitiveLanguage:(NSString*)value;




- (NSDate*)primitiveLastBuildDate;
- (void)setPrimitiveLastBuildDate:(NSDate*)value;




- (NSString*)primitiveLink;
- (void)setPrimitiveLink:(NSString*)value;




- (NSString*)primitiveManagingEditor;
- (void)setPrimitiveManagingEditor:(NSString*)value;




- (NSDate*)primitivePubDate;
- (void)setPrimitivePubDate:(NSDate*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




- (NSNumber*)primitiveTtl;
- (void)setPrimitiveTtl:(NSNumber*)value;

- (int32_t)primitiveTtlValue;
- (void)setPrimitiveTtlValue:(int32_t)value_;




- (NSString*)primitiveWebMaster;
- (void)setPrimitiveWebMaster:(NSString*)value;





- (RGCategory*)primitiveCategory;
- (void)setPrimitiveCategory:(RGCategory*)value;



- (RGItem*)primitiveItems;
- (void)setPrimitiveItems:(RGItem*)value;


@end
