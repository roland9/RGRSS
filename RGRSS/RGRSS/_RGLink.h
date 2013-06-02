// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RGLink.h instead.

#import <CoreData/CoreData.h>


extern const struct RGLinkAttributes {
	__unsafe_unretained NSString *href;
	__unsafe_unretained NSString *rel;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *type;
} RGLinkAttributes;

extern const struct RGLinkRelationships {
} RGLinkRelationships;

extern const struct RGLinkFetchedProperties {
} RGLinkFetchedProperties;







@interface RGLinkID : NSManagedObjectID {}
@end

@interface _RGLink : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (RGLinkID*)objectID;





@property (nonatomic, strong) NSString* href;



//- (BOOL)validateHref:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* rel;



//- (BOOL)validateRel:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* type;



//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;






@end

@interface _RGLink (CoreDataGeneratedAccessors)

@end

@interface _RGLink (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveHref;
- (void)setPrimitiveHref:(NSString*)value;




- (NSString*)primitiveRel;
- (void)setPrimitiveRel:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




- (NSString*)primitiveType;
- (void)setPrimitiveType:(NSString*)value;




@end
