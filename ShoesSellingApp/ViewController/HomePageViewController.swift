//
//  HomePageViewController.swift
//  ShoesSellingApp
//
//  Created by TDK on 5/27/22.
//  Copyright © 2022 Nhom4. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var kidButton: UIButton!
    @IBOutlet weak var menButton: UIButton!
    @IBOutlet weak var womenButton: UIButton!
    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    var imgArr = [  UIImage(named:"Kid Shoes 1"),
                    UIImage(named:"Kid Shoes 5") ,
                    UIImage(named:"Kid Shoes 3") ,
                    UIImage(named:"Men Shoes 3") ,
                    UIImage(named:"Mens Shoes 5") ,
                    UIImage(named:"Men Shoes 1") ,
                    UIImage(named:"Woman Shoes 5") ,
                    UIImage(named:"Woman Shoes 1") ,
                    UIImage(named:"Kid Shoes 2") ,
                    UIImage(named:"Image") ]
    var timer = Timer()
    var counter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        kidButton.layer.cornerRadius = 10
        kidButton.layer.borderWidth = 1
        kidButton.layer.borderColor = UIColor.black.cgColor
        menButton.layer.cornerRadius = 10
        menButton.layer.borderWidth = 1
        menButton.layer.borderColor = UIColor.black.cgColor
        womenButton.layer.cornerRadius = 10
        womenButton.layer.borderWidth = 1
        womenButton.layer.borderColor = UIColor.black.cgColor
        pageView.numberOfPages = imgArr.count
        pageView.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(), style: .plain, target: self, action: nil)
    }
    @IBAction func btnLogoutTapped(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "email")
        let vc = storyboard?.instantiateViewController(withIdentifier: "Login")
        let navVC = UINavigationController(rootViewController: vc!)
        let share = UIApplication.shared.delegate as? AppDelegate
        share?.window?.rootViewController = navVC
        share?.window?.makeKeyAndVisible()
    }
    
    @IBAction func btnKidShoes(_ sender: UIButton) {
         performSegue(withIdentifier: "fromKid", sender: self)
    }
    
    @IBAction func btnMenShoes(_ sender: UIButton) {
        performSegue(withIdentifier: "fromMen", sender: self)
    }
    
    @IBAction func btnWomanShoes(_ sender: UIButton) {
        performSegue(withIdentifier: "fromWoman", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func changeImage() {
        
        if counter < imgArr.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageView.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pageView.currentPage = counter
            counter = 1
        }
        
    }
}
extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let vc = cell.viewWithTag(111) as? UIImageView {
            vc.image = imgArr[indexPath.row]
        }
        return cell
    }
}
extension HomePageViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = sliderCollectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

