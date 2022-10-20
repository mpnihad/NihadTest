//
//  ViewController.swift
//  NihadTest
//
//  Created by Nihad-Mac on 20/10/22.
//

import UIKit

class ViewController: UIViewController {

    
    private let imageview: UIImageView = {
        let imageView=UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let colors: [UIColor] = [
        .systemRed,
        .systemBlue,
        .systemMint,
        .systemBrown,
        .systemGreen,
        .systemOrange,
        .systemYellow
    
    ]
    
    private let button:UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        
        button.setTitle("Random Image", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        view.addSubview(imageview)
        
        imageview.frame = CGRect(

            x: 0,y: 0,width: 300,height: 300
            
        )
        
        imageview.center  = view.center
        view.addSubview(button)
        button.addTarget(self, action: #selector(onTapRandomButtom), for: .touchUpInside)
//        button.addTarget(self, action: #selector(onTapRandomButtom), for: .touchUpInside)
        randomImage()
        // Do any additional setup after loading the view.
    }

    @objc func onTapRandomButtom() {
        randomImage()
        view.backgroundColor=colors.randomElement()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(

            x: 20,y: view.frame.size.height-50-view.safeAreaInsets.bottom,width: view.frame.size.width - 40 ,height: 50
            
        )
    }
    func randomImage(){
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf : url) else {
            return
        }
        imageview.image = UIImage(data: data)
    }


}

