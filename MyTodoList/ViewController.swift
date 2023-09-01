//
//  ViewController.swift
//  MyTodoList
//
//  Created by 하호형 on 2023/08/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // UIImageView 인스턴스 생성
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false // 오토레이아웃을 위해 필수

        // contentMode 설정
        imageView.contentMode = .scaleAspectFit

        // 뷰에 이미지 뷰 추가
        view.addSubview(imageView)
    
        
        // 이미지 URL 설정
        if let imageUrl = URL(string: "https://spartacodingclub.kr/css/images/scc-og.jpg") {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: imageUrl) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            imageView.image = image
                            imageView.contentMode = .scaleAspectFit
                            
                            // 이미지 오토레이아웃 설정
                            NSLayoutConstraint.activate([
                                imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                imageView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -150),
                                imageView.widthAnchor.constraint(equalToConstant: 200),
                                imageView.heightAnchor.constraint(equalToConstant: 200)
                            ])
                        }
                    }
                }
            }
        }
    
        //버튼 UI 생성
        let button1 = UIButton(type: .system)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.setTitle("할일 확인하기", for: .normal)
        button1.addTarget(self, action: #selector(pushButton1), for: .touchUpInside)
        view.addSubview(button1)

        //버튼 UI 생성
        let button2 = UIButton(type: .system)
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.setTitle("완료한일 보기", for: .normal)
        button2.addTarget(self, action: #selector(pushButton2), for: .touchUpInside)
        view.addSubview(button2)
        
        
        //버튼 오토 레이아웃 설정
        NSLayoutConstraint.activate([
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
    
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 30),
            
        ])
    }
    
    @objc func pushButton1() {
            let todoListView = TodoListViewController() // TodoListViewController의 인스턴스 생성
            navigationController?.pushViewController(todoListView, animated: true) // 네비게이션 컨트롤러로 화면 전환
        }
    @objc func pushButton2() {
        let completedListView = CompletedListViewController() // CompletedListViewController의 인스턴스 생성
        navigationController?.pushViewController(completedListView, animated: true) // 네비게이션 컨트롤러로 화면 전환
    }
}









