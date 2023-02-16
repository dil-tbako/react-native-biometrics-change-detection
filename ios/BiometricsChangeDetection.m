#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(BiometricsChangeDetection, NSObject)

  RCT_EXTERN_METHOD(biometricsChanged:(RCTResponseSenderBlock) callback)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
