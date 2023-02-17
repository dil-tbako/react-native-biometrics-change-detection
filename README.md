# react-native-biometrics-change-detection

(IOS only for now)
This package helps to determine if biometric data has been added or removed.

## Installation

```sh
npm install react-native-biometrics-change-detection
```

## Usage

```js
import { biometricsChanged } from 'react-native-biometrics-change-detection';

// ...

biometricsChanged((isNewDataAdded) => {
  if (isNewDataAdded) {
    if (isNewDataAllowedToBeAdded) {
      //This function adds the new data to the library state
      saveBiometricState();
    } else {
      //This function resets the state of the library
      resetBiometricState();
    }
  }
});
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
