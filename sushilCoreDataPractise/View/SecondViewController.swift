//
//  SecondViewController.swift
//  sushilCoreDataPractise
//
//  Created by Divya Pegwal on 9/26/22.
//

import UIKit

class SecondViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout {
    //MARK: - IBOutlet
    //----------------
    @IBOutlet weak var listCV: UICollectionView!
    //MARK: - variables
    //------------------
    var employeeData = [Employee]()
    //MARK: - lifeCycles
    //------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        naviagtionBar()
        employeeData = DataBase.shared.fetchData()
        listCV.register(UINib(nibName:"ListCVC", bundle: nil), forCellWithReuseIdentifier: "ListCVC")
        listCV.dataSource = self
        listCV.delegate = self
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
    //MARK: - CollectionviewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = listCV.dequeueReusableCell(withReuseIdentifier: "ListCVC", for: indexPath) as! ListCVC
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "FetchData", bundle: nil)
        let employeeDetail = storyboard.instantiateViewController(identifier: "EmployeeDetailViewController") as! EmployeeDetailViewController
        self.navigationController?.pushViewController(employeeDetail, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (listCV.frame.height)/5
        let width = (listCV.frame.width)
        return CGSize(width:width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
