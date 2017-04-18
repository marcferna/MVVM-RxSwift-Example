//
//  LoginViewModel.swift
//  MVVM-RxSwift-Example
//
//  Created by Marc Fernandez on 4/16/17.
//  Copyright © 2017 Calibarna. All rights reserved.
//

import RxSwift

struct LoginViewModel {

  var username = Variable<String>("")
  var password = Variable<String>("")


  var isValid: Observable<Bool> {
    return Observable.combineLatest(username.asObservable(), password.asObservable()) {
      $0.characters.count > 0 && $1.characters.count > 0
    }
  }
}
