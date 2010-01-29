#import "Definition.h"

@interface Definition (Private)
@end

static Definition *myInstance = nil;

@implementation Definition

@synthesize favArray, currentOrg;

- (id)init {			
	if (myInstance != nil) {
		[self release];
		[NSException raise:@"singletonClassError" format:@" Don't init singleton class %@"];
	} else if (self = [super init]) {
		myInstance = self; 
		favArray = [[NSMutableArray alloc] init];
		currentOrg = [[NSMutableString alloc] initWithString:@"全国"];
	}
	return myInstance;
}

+ (Definition *)sharedDefinition {
	@synchronized (self) {
		if (myInstance == nil) {
			[[Definition alloc] init];
		}
	}
	return myInstance;
}


#pragma mark override methods to keep this class instance
- (id)retain {
	return self;
}

- (unsigned)retainCount
{
	return UINT_MAX;  //denotes an object that cannot be released	
}

- (void)release {
	//do nothing
}

- (id)autorelease
{
	return self;
}


@end
