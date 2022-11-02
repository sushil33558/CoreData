//
//  EmployeeDetailViewController.swift
//  sushilCoreDataPractise
//
//  Created by Divya Pegwal on 9/28/22.
//

import UIKit
class EmployeeDetailViewController: UIViewController {
    //MARK: - IBoutlet
    //-----------------
    
    //MARK: - Variables
    //-----------------
    
    //MARK: - LifeCycles
    //-----------------
    override func viewDidLoad() {
        super.viewDidLoad()
        naviagtionBar()
    }
    //MARK: - func()
    //-----------------
    func naviagtionBar(){
        navigationItem.title = "Data OF Professional"
        let button = UIButton(frame: CGRect(x: 10, y: 20, width: 35, height: 35))
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = .white
        button.contentMode = .scaleToFill
        button.addTarget(self, action: #selector(didTapBack(_sender:)), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    }
    //MARK: - Objc Func
    @objc func didTapBack(_sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }

}
