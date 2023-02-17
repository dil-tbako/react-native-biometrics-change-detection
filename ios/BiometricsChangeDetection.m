#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(BiometricsChangeDetection, NSObject)

  RCT_EXTERN_METHOD(biometricsChanged:(RCTResponseSenderBlock) callback)
  RCT_EXTERN_METHOD(saveBiometricState)
  RCT_EXTERN_METHOD(resetBiometricState)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
