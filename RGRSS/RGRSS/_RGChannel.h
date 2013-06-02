// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RGChannel.h instead.

#import <CoreData/CoreData.h>


extern const struct RGChannelAttributes {
	__unsafe_unretained NSString *cloud;
	__unsafe_unretained NSString *copyright;
	__unsafe_unretained NSString *docs;
	__unsafe_unretained NSString *feedDescription;
	__unsafe_unretained NSString *generator;
	__unsafe_unretained NSString *language;
	__unsafe_unretained NSString *lastBuildDate;
	__unsafe_unretained NSString *link;
	__unsafe_unretained NSString *managingEditor;
	__unsafe_unretained NSString *pubDate;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *ttl;
	__unsafe_unretained NSString *webMaster;
} RGChannelAttributes;

extern const struct RGChannelRelationships {
	__unsafe_unretained NSString *category;
	__unsafe_unretained NSString *items;
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





@property (nonatomic, strong) NSString* cloud;



//- (BOOL)validateCloud:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* copyright;



//- (BOOL)validateCopyright:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* docs;



//- (BOOL)validateDocs:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* feedDescription;



//- (BOOL)validateFeedDescription:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* generator;



//- (BOOL)validateGenerator:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* language;



//- (BOOL)validateLanguage:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* lastBuildDate;



//- (BOOL)validateLastBuildDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* link;



//- (BOOL)validateLink:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* managingEditor;



//- (BOOL)validateManagingEditor:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* pubDate;



//- (BOOL)validatePubDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* ttl;



@property int32_t ttlValue;
- (int32_t)ttlValue;
- (void)setTtlValue:(int32_t)value_;

//- (BOOL)validateTtl:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* webMaster;



//- (BOOL)validateWebMaster:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) RGCategory *category;

//- (BOOL)validateCategory:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) RGItem *items;

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
