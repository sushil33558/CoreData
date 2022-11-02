//
//  ViewController.swift
//  sushilCoreDataPractise
//
//  Created by Divya Pegwal on 9/26/22.
//

import UIKit
import CoreData
class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    //MARK: - iBoutlet
    //--------------
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var nameTxtFld:UITextField!
    @IBOutlet weak var ageTxtFld:UITextField!
    @IBOutlet weak var roleTxtFld:UITextField!
    @IBOutlet weak var compTxtFld:UITextField!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var saveBtnOut: UIButton!
    @IBOutlet weak var nextBtnOut: UIButton!
    
    @IBOutlet weak var profileBtnOut: UIButton!
    //MARK: - Variables
    //-----------------
    var imagePicker = UIImagePickerController()
    //MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Employee Profile"
        screenData()
    }
    //MARK: - func
    func screenData(){
        profileView.layer.cornerRadius = (profileView.frame.height-8)/2
        profileBtnOut.layer.cornerRadius = (profileBtnOut.frame.height-8)/2
        profileImageView.layer.cornerRadius = (profileImageView.frame.height-8)/2
        profileImageView.clipsToBounds = true
        self.saveBtnOut.layer.cornerRadius = 7
        self.saveBtnOut.layer.borderWidth = 2
        self.saveBtnOut.layer.borderColor = UIColor.white.cgColor
        self.nextBtnOut.layer.cornerRadius = 7
        self.nextBtnOut.layer.borderWidth = 2
        self.nextBtnOut.layer.borderColor = UIColor.white.cgColor
    }
    //MARK: - iBaction
    //----------------
    @IBAction func profileBtn(_ sender: UIButton) {
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func saveBtn(_ sender:UIButton){
        let dict = ["name":nameTxtFld.text ?? "","Age":ageTxtFld.text ?? "","role": roleTxtFld.text ?? "","company":compTxtFld.text ?? "","profile":profileImageView.image ?? ""] as? [String : Any]
        DataBase.shared.saveData(object:(dict)!)
    }
    @IBAction func nextBtn(_ sender:UIButton){
        let storyboard = UIStoryboard(name: "FetchData", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "SecondViewController") as! SecondViewController
        navigationController?.pushViewController(secondVC, animated: true)
    }
    //MARK: - ImagePickerDelegate
    //---------------------------
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else{return}
        profileImageView.image = image
        dismiss(animated: true, completion: nil)
    }
}

