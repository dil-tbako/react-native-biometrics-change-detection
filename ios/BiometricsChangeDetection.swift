import LocalAuthentication


extension LAContext {
    @objc static var savedBiometricsPolicyState: Data? {
        get {
            UserDefaults.standard.data(forKey: "BiometricsPolicyState")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "BiometricsPolicyState")
        }
    }
}

@objc(BiometricsChangeDetection)
class BiometricsChangeDetection: NSObject {

  @objc
  func biometricsChanged(_ callback: RCTResponseSenderBlock) {
      let context = LAContext()
      var error: NSError?
      context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
      
      // If there is no saved policy state yet, save it
      if error == nil && LAContext.savedBiometricsPolicyState == nil {
          LAContext.savedBiometricsPolicyState = context.evaluatedPolicyDomainState
           callback([false])
           return
      }
      
      if let domainState = context.evaluatedPolicyDomainState, domainState != LAContext.savedBiometricsPolicyState {
          callback([true])
          return
      }
      
       callback([false])
       return
  }

  @objc
  func saveBiometricState() {
      let context = LAContext()
      var error: NSError?
      context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)

      if error == nil {
        LAContext.savedBiometricsPolicyState = context.evaluatedPolicyDomainState
      }
  }

  @objc
  func resetBiometricState() {
      let context = LAContext()
      var error: NSError?
      context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)

      if error == nil {
        LAContext.savedBiometricsPolicyState = nil;
      }
  }
}
