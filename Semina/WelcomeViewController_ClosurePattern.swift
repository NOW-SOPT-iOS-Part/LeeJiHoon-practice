//
//  fsdafsf.swift
//  Semina
//
//  Created by 이지훈 on 4/6/24.
//

import UIKit
import Foundation

protocol DataBindProtocol2:AnyObject {
    func dataBind(id: String?)
    
}

class WelcomeViewController_ClosurePattern: UIViewController {
    
    //MARK: - variable
    var id : String? = ""
    
    var completionHandler: ((String) -> (Void))?

    typealias handler = ((String) -> (Void))
        
    var completionHandler2: handler?
    
    //MARK: - 기본 요소들
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "logo2")
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.text = "???님 \n반가워요!"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        
        return label
    }()
    
    private var goHomeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        
        return button
    }()
    
    private var backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        
        return button
    }()
    
    func bindID() {
        guard let idtext = id else { return }
        self.welcomeLabel.text = "\(idtext)님 \n반가워요!"
    }
    
    
    //MARK: - ViewDidload
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
        bindID()
        
    }
    
    private func setLayout() {
        [logoImageView, welcomeLabel, goHomeButton, backToLoginButton].forEach {
            //      $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    
    @objc
    private func backBtnTapped() {
        
        guard let id else { return }
        completionHandler?(id)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
}
