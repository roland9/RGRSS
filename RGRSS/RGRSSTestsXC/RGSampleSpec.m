#import "Kiwi.h"
#import "RGFeedManager.h"
#import "RGObject.h"


SPEC_BEGIN(SpreadsheetTests)

describe(@"Loading Spreadsheet", ^{
    
    beforeAll(^{
        NSString *urlString = @"http://spreadsheets.google.com/feeds/list/0Apmsn6hlyPHudDBHbWJ6NkI4SFNwTEkzQVBXS3VGY0E/od6/public/values?alt=json";
        NSURL *url = [NSURL URLWithString:urlString];
        [[RGFeedManager sharedRGFeedManager] loadDataURL:url];
    });
    
    it(@"data loaded", ^{
        [[expectFutureValue([[RGFeedManager sharedRGFeedManager] responseEntries]) shouldEventuallyBeforeTimingOutAfter(5)] haveCountOf:53];

        RGObject *obj1 = [[RGObject alloc] init];
        obj1.itemId = @"1";
        obj1.parentId = @"0";
        obj1.itemDescription = @"Asia";
        obj1.nextLevel = @"Country";
        obj1.imageFull = @"";
        obj1.imageThumbnail = @"";
        obj1.detailHTML = @"";
        
        RGObject *obj2 = [[RGObject alloc] init];
        obj2.itemId = @"10";
        obj2.parentId = @"1";
        obj2.itemDescription = @"Indonesia";
        obj2.nextLevel = @"City";
        obj2.imageFull = @"";
        obj2.imageThumbnail = @"";
        obj2.detailHTML = @"";

        RGObject *obj3 = [[RGObject alloc] init];
        obj3.itemId = @"41";
        obj3.parentId = @"6";
        obj3.itemDescription = @"Kenya";
        obj3.nextLevel = @"City";
        obj3.imageFull = @"";
        obj3.imageThumbnail = @"";
        obj3.detailHTML = @"";

        RGObject *obj4 = [[RGObject alloc] init];
        obj4.itemId = @"47";
        obj4.parentId = @"12";
        obj4.itemDescription = @"Frankfurt am Main";
        obj4.nextLevel = @"";
        obj4.imageFull = @"";
        obj4.imageThumbnail = @"";
        obj4.detailHTML = @"Frankfurt detail HTML";

        RGObject *obj5 = [[RGObject alloc] init];
        obj5.itemId = @"7";
        obj5.parentId = @"1";
        obj5.itemDescription = @"China";
        obj5.nextLevel = @"City";
        obj5.imageFull = @"http://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Flag_of_the_People%27s_Republic_of_China.svg/1000px-Flag_of_the_People%27s_Republic_of_China.svg.png";
        obj5.imageThumbnail = @"http://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Flag_of_the_People%27s_Republic_of_China.svg/200px-Flag_of_the_People%27s_Republic_of_China.svg.png";
        obj5.detailHTML = @"";
        
        [[expectFutureValue([[RGFeedManager sharedRGFeedManager] responseEntries]) shouldEventuallyBeforeTimingOutAfter(5)]
         containObjectsInArray:@[obj1, obj2, obj3, obj4, obj5]];
        
    });
});

SPEC_END
