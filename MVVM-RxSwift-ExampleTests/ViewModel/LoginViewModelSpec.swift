//
//  LoginViewModelSpec.swift
//  MVVM-RxSwift-Example
//
//  Created by Marc Fernandez on 4/18/17.
//  Copyright © 2017 Calibarna. All rights reserved.
//

import XCTest
import RxSwift
import Nimble

@testable import MVVM_RxSwift_Example

class LoginViewModelSpec: XCTestCase {

  var loginViewModel: LoginViewModel!
  var disposeBag: DisposeBag!

  override func setUp() {
    super.setUp()
    disposeBag = DisposeBag()
  }

  override func tearDown() {
    super.tearDown()
    disposeBag = nil
  }

  func testIsValid_usernameAndPasswordEmpty() {
    loginViewModel = LoginViewModel(username: Variable<String>(""), password: Variable<String>(""))

    loginViewModel.isValid.subscribe {
      expect($0.element).to(beFalse())
    }.addDisposableTo(disposeBag)
  }

  func testIsValid_usernameFilledAndPasswordEmpty() {
    loginViewModel = LoginViewModel(username: Variable<String>("my_username"), password: Variable<String>(""))

    loginViewModel.isValid.subscribe {
      expect($0.element).to(beFalse())
      }.addDisposableTo(disposeBag)
  }

  func testIsValid_usernameEmptyAndPasswordFilled() {
    loginViewModel = LoginViewModel(username: Variable<String>(""), password: Variable<String>("password"))

    loginViewModel.isValid.subscribe {
      expect($0.element).to(beFalse())
      }.addDisposableTo(disposeBag)
  }

  func testIsValid_usernameFilledAndPasswordFilled() {
    loginViewModel = LoginViewModel(username: Variable<String>("my_username"), password: Variable<String>("password"))

    loginViewModel.isValid.subscribe {
      expect($0.element).to(beTrue())
      }.addDisposableTo(disposeBag)
  }
}
