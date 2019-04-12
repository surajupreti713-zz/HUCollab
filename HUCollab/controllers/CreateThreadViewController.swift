//
//  CreateThreadViewController.swift
//  HUCollab
//
//  Created by Suraj Upreti on 4/1/19.
//  Copyright © 2019 Suraj Upreti. All rights reserved.
//

import UIKit
import Firebase

/* View controller for creating threads */
class CreateThreadViewController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var threadName: UITextField!
    @IBOutlet weak var threadDescription: UITextView!
    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var threadImageView: UIImageView!
    
    let databaseRef = Database.database().reference(withPath: "threads")
    var storageRef: StorageReference {
        return Firebase.Storage.storage().reference(withPath: "threadPhoto")
    }
    var userID: String {
        return Auth.auth().currentUser!.uid
    }
    var userName: String {
        if let userName = Auth.auth().currentUser!.displayName {
            return userName
        }
        return "Anonymous"
    }
    
    var currentTimeStamp: String {
        let now = Date()
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = formatter.string(from: now)
        return dateString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        threadDescription.layer.cornerRadius = 5
        threadDescription.layer.borderColor = UIColor.lightGray.cgColor
        threadDescription.layer.borderWidth = 1
    }
    
    @IBAction func tapToUpload(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let myPickerViewController = UIImagePickerController()
            myPickerViewController.delegate = self
            myPickerViewController.sourceType = .photoLibrary
            self.present(myPickerViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func tapToCreateThread(_ sender: UIButton) {
        let thread = Thread(threadHandle: self.threadName.text!, threadDescription: self.threadDescription.text!, created: self.currentTimeStamp, userEmail: self.userName, userID: self.userID, threadID: "1")
        databaseRef.child("\(Int(Date.timeIntervalSinceReferenceDate * 1000))").setValue(thread.toAnyObject())
        print(thread)
    }
    
    //photo explorer and uploads
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.uploadPhotoURL(image: image)
        }
        else {
            print("Something went wrong")
        }
        dismiss(animated: true, completion: nil)
    }
    
    //uploads image to firebase storage
    func uploadPhotoURL(image: UIImage) {
        let imageName = "banana.jpg"
        guard let imageData = image.jpegData(compressionQuality: 1.0) else { return }
        
        let uploadImageRef = storageRef.child("Users").child(userID).child(imageName)
        let uploadTask = uploadImageRef.putData(imageData, metadata: nil) { (metadata, error) in
            print(metadata ?? "NO METADATA")
            print(error ?? "NO ERROR")
        }
        uploadTask.observe(.progress) { (snapshot) in
            print(snapshot.progress ?? "NO MORE PROGRESS")
        }
        uploadTask.resume()
    }
    
    //gets the image url of thread from storage
    func threadPhotoURL() {
        let downloadImageRef = storageRef.child("Users").child(userID).child("banana.jpg")
        let downloadTask = downloadImageRef.getData(maxSize: 1024 * 1024 * 8) { (data, error) in
            if let data = data {
                
                let image = UIImage(data: data)
                self.threadImageView.image = image
            }
            print(error ?? "NO ERROR")
        }
        downloadTask.observe(.progress) { (snapshot) in
            print(snapshot.progress ?? "NO MORE PROGRESS")
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
