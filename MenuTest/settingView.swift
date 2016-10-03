//
//  settingView.swift
//  MenuTest
//
//  Created by 宗桓 李 on 2016/10/3.
//  Copyright © 2016年 squall. All rights reserved.
//

import UIKit
class settingView:NSObject,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    let cellId = "cellId"
    
    let menuList = ["出勤記錄","外出記錄","設定","登出"]
    

    override init() {
        super.init()
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var backGroundView : UIView = {
        let bv = UIView()
        bv.backgroundColor = UIColor(white: 0, alpha: 0.3)
        
        return bv
    }()
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame:.zero,collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = UIColor.white
        cv.contentInset = UIEdgeInsetsMake(40, 0, 0, 0)
        layout.itemSize = CGSize(width: cv.frame.width, height: 20.0)
        return cv
    }()
    
    func showSettings() {
        //show menu
        
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(backGroundView)
            
            window.addSubview(collectionView)
            
            collectionView.frame = CGRect(x: 0, y: 0, width: 0, height: window.frame.height)
            
             backGroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            backGroundView.frame = window.frame
            backGroundView.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.backGroundView.alpha = 1
                
                self.collectionView.frame = CGRect(x: 0, y: 0, width: 200, height: self.collectionView.frame.height)
                
                }, completion: nil)
 
        }
    }
    
    func handleDismiss() {
        UIView.animate(withDuration: 0.5, animations: {
            self.backGroundView.alpha = 0
            
            self.collectionView.frame = CGRect(x: 0, y: 0, width: 0, height: self.collectionView.frame.height)
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        
        let Menu = menu()
        Menu.menuTag = menuList[indexPath.item]
        Menu.menuTitle = menuList[indexPath.item]
        
        cell.Menu = Menu
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return menuList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 30.0)
    }
}
