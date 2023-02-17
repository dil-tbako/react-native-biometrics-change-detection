import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-biometrics-changed' doesn't seem to be linked. Make sure: \n\n` +
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

export function biometricsChanged(cb: any) {
  return BiometricsChangeDetection.biometricsChanged(cb);
}

export function saveBiometricState() {
  BiometricsChangeDetection.saveBiometricState();
}

export function resetBiometricState() {
  BiometricsChangeDetection.resetBiometricState();
}
