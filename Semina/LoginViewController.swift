//
//  LoginViewController.swift
//  seminar
//
//  Created by 이지훈 on 3/30/24.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    //MARK: - 기본 UI
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 161, width: 236, height: 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        return label
        
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        textField.placeholder = "아이디를 입력해주세요"
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 422, width: 332, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        
        return button
    }()
    
    
    //MARK: - ViewDidload
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
    }
    
    
    //MARK: - Layout
    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            self.view.addSubview($0)
        }
        //
        //        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        //        idTextField.translatesAutoresizingMaskIntoConstraints = false
        //        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        //        loginButton.translatesAutoresizingMaskIntoConstraints = false
        //
        //        NSLayoutConstraint.activate([titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        //                                     titleLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 161)])
        //
        //        NSLayoutConstraint.activate([loginButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 217),
        //                                     loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        //                                     loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        //                                     loginButton.heightAnchor.constraint(equalToConstant: 58)])
        //
        //        NSLayoutConstraint.activate([idTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
        //                                     idTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        //                                     idTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        //                                     idTextField.heightAnchor.constraint(equalToConstant: 52)])
        //
        //        NSLayoutConstraint.activate([passwordTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 13),
        //                                     passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        //                                     passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        //                                     passwordTextField.heightAnchor.constraint(equalToConstant: 52)])
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(161)
            make.width.equalTo(236)
            make.height.equalTo(44)
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(71)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(7)
            make.left.right.equalTo(idTextField)
            make.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(35)
            make.left.right.equalTo(idTextField)
            make.height.equalTo(58)
        }
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        
        
    }
    
    
    //MARK: - Actions
    private func presentToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.modalPresentationStyle = .formSheet
        welcomeVC.id = idTextField.text
        self.present(welcomeVC, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.id = idTextField.text
        
        
        self.navigationController?.pushViewController(welcomeVC, animated: true)
    }
    
    
    //MARK: - @objc
    @objc func loginBtnTapped() {
        //   presentToWelcomeVC()
        pushToWelcomeVC()
    }
    
    
    
}
