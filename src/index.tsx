import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-biometrics-change-detection' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

const BiometricsChangeDetection = NativeModules.BiometricsChangeDetection
  ? NativeModules.BiometricsChangeDetection
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export function multiply(a: number, b: number): Promise<number> {
  return BiometricsChangeDetection.multiply(a, b);
}
