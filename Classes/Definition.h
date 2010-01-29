#import <UIKit/UIKit.h>


@interface Definition : NSObject {		
	
	NSMutableArray *favArray;
	NSMutableString *currentOrg;

}

+ (Definition *)sharedDefinition;


@property (nonatomic,readonly) NSMutableArray *favArray;
@property (nonatomic,readonly) NSMutableString *currentOrg;

@end
