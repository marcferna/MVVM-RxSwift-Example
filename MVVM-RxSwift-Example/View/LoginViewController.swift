//
//  LoginViewController.swift
//  MVVM-RxSwift-Example
//
//  Created by Marc Fernandez on 4/16/17.
//  Copyright © 2017 Calibarna. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {

  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var loginButton: UIButton!

  private let viewModel = LoginViewModel()
  private let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()

    // MARK: UI to ViewModel
    usernameTextField.rx.text
      .map { $0 ?? "" }
      .bindTo(viewModel.username)
      .addDisposableTo(disposeBag)

    passwordTextField.rx.text
      .map { $0 ?? "" }
      .bindTo(viewModel.password)
      .addDisposableTo(disposeBag)

    // MARK: ViewModel to UI
    viewModel.isValid
      .bindTo(loginButton.rx.isEnabled)
      .addDisposableTo(disposeBag)
  }
}
