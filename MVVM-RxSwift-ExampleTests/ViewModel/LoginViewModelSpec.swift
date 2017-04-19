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
import Quick

@testable import MVVM_RxSwift_Example

class LoginViewModelSpec: QuickSpec {

  var disposeBag: DisposeBag!

  override func spec() {

    beforeSuite {
      self.disposeBag = DisposeBag()
    }

    afterSuite {
      self.disposeBag = nil
    }

    describe(".isValid") {

      context("when username is empty") {
        let username = ""

        context("when password is empty") {
          let loginViewModel = LoginViewModel(username: Variable<String>(username), password: Variable<String>(""))

          it("is not valid") {
            loginViewModel.isValid.subscribe {
              expect($0.element).to(beFalse())
            }.addDisposableTo(self.disposeBag)
          }
        }

        context("when password is not empty") {
          let loginViewModel = LoginViewModel(username: Variable<String>(username), password: Variable<String>("password"))

          it("is not valid") {
            loginViewModel.isValid.subscribe {
              expect($0.element).to(beFalse())
            }.addDisposableTo(self.disposeBag)
          }
        }
      }

      context("when username is not empty") {
        let username = "username"

        context("when password is empty") {
          let loginViewModel = LoginViewModel(username: Variable<String>(username), password: Variable<String>(""))

          it("is not valid") {
            loginViewModel.isValid.subscribe {
              expect($0.element).to(beFalse())
            }.addDisposableTo(self.disposeBag)
          }
        }

        context("when password is not empty") {
          let loginViewModel = LoginViewModel(username: Variable<String>(username), password: Variable<String>("password"))

          it("is valid") {
            loginViewModel.isValid.subscribe {
              expect($0.element).to(beTrue())
            }.addDisposableTo(self.disposeBag)
          }
        }
      }
    }
  }
}
