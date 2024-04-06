//
//  sdfa.swift
//  Semina
//
//  Created by 이지훈 on 4/6/24.
//

import Foundation
import UIKit


final class LoginViewController_delegatePattern: UIViewController {
  
    
    
    
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
    }
    
    
    //MARK: - Actions
    private func presentToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.modalPresentationStyle = .formSheet
        welcomeVC.id = idTextField.text
        self.present(welcomeVC, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeVC = WelcomeViewController_delegatePattern()
        welcomeVC.id = idTextField.text
        welcomeVC.delegate = self
        
        self.navigationController?.pushViewController(welcomeVC, animated: true)
    }
    
    
    //MARK: - @objc
    @objc func loginBtnTapped() {
        
        //   presentToWelcomeVC()
        
        
        pushToWelcomeVC()
        
    }
    
    
    
}

extension LoginViewController_delegatePattern: DataBindProtocol, UITextFieldDelegate {
    func dataBind(id: String?) {
        
        guard let id = id else { return }
         idTextField.text = "\(id)에서 뭐할건데?"

    }
    
   

}
