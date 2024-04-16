//
//  ScrollViewController.swift
//  Semina
//
//  Created by 이지훈 on 4/6/24.
//

import UIKit
import SnapKit

class ScrollViewController: UIViewController {
    
    
    //MARK: - 변수
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    var greenView = UIView()
    var blueView = UIView()
    var orangeView = UIView()
    var yellowView = UIView()
    var purpleView = UIView()
    var redView = UIView()

    
    //MARK: - VIewdidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.backgroundColor = .white
        setLayout()
        
        //네비게이션 바는 피그마에 없으니 숨겻어요
        self.navigationController?.isNavigationBarHidden = true

    }

    //MARK: - Layout
    private func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [redView, orangeView, yellowView, greenView, blueView, purpleView].forEach {
            contentView.addSubview($0)
            $0.snp.makeConstraints { make in
                make.width.equalTo(contentView.snp.width).multipliedBy(0.5)
                make.height.equalTo(337)
            }
        }
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        redView.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView)
            redView.backgroundColor = .red
        }
        
        orangeView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.leading.equalTo(redView.snp.trailing)
            orangeView.backgroundColor = .orange
        }
        
        yellowView.snp.makeConstraints { make in
            make.top.equalTo(redView.snp.bottom)
            make.leading.equalTo(contentView)
            yellowView.backgroundColor = .yellow
        }
        
        greenView.snp.makeConstraints { make in
            make.top.equalTo(orangeView.snp.bottom)
            make.leading.equalTo(yellowView.snp.trailing)
            greenView.backgroundColor = .green
        }
        
        blueView.snp.makeConstraints { make in
            make.top.equalTo(yellowView.snp.bottom)
            make.leading.equalTo(contentView)
            blueView.backgroundColor = .blue
        }
        
        purpleView.snp.makeConstraints { make in
            make.top.equalTo(greenView.snp.bottom)
            make.leading.equalTo(blueView.snp.trailing)
            make.bottom.equalTo(contentView) // 마지막 뷰이므로 contentView의 bottom이랑 붙이기
            purpleView.backgroundColor = .purple
        }
    }

}

