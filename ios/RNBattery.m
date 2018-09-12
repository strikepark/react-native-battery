
#import "RNBattery.h"

@implementation RNBattery

RCT_EXPORT_MODULE(RNBattery)

- (instancetype)init
{
  if ((self = [super init])) {
    [[UIDevice currentDevice] setBatteryMonitoringEnabled: YES];
  }

  return self;
}

RCT_EXPORT_METHOD(
  updateBatteryLevel: (RCTPromiseBlock)resolve
  rejector: (RCTPromiseRejectBlock)reject
) {
  resolve(@[[self getStatus]]);
}

//manually get battery status by calling following method
-(NSDictionary*)getStatus
{
  UIDevice *myDevice = [UIDevice currentDevice];

  // 0 unknown, 1 unplegged, 2 charging, 3 full
  int state = [myDevice batteryState];

  double level = (float)[myDevice batteryLevel] * 100;

  NSDictionary* batteryInfo = @{ state: state, level: level};

  return batteryInfo;
}

@end
