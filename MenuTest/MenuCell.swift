//
//  MenuCell.swift
//  MenuTest
//
//  Created by 宗桓 李 on 2016/10/3.
//  Copyright © 2016年 squall. All rights reserved.
//

import UIKit

class menu
{
    var menuTitle:String?
    var menuTag:String?
}

class MenuCell:UICollectionViewCell
{
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var Menu : menu? {
        didSet{
            let cellView = UIView()
            titleView.text = Menu?.menuTitle
            
            cellView.addSubview(menuIcon)
            cellView.addSubview(titleView)
            cellView.addSubview(speratorLine)
            addSubview(cellView)
            
            cellView.addConstraintsWithFormat("H:|-8-[v0(25)]-8-[v1]|", views: menuIcon,titleView)
            
            cellView.addConstraintsWithFormat("V:|[v0(25)]", views: menuIcon)
            
            cellView.addConstraintsWithFormat("H:|-8-[v0]-8-|", views: speratorLine)
            cellView.addConstraintsWithFormat("V:|[v0][v1(1)]|", views: titleView,speratorLine)
            
            addConstraintsWithFormat("H:|[v0]|", views: cellView)
            addConstraintsWithFormat("V:|[v0]|", views: cellView)
            
            addConstraint(NSLayoutConstraint(item: menuIcon, attribute: .centerY, relatedBy: .equal, toItem: titleView, attribute: .centerY, multiplier: 1, constant: 0))
            
            cellView.setNeedsLayout()
            cellView.layoutIfNeeded()
            
        }
    }
    
    let titleView:UILabel = {
        let tv = UILabel()
        tv.textAlignment = .left
        tv.font = UIFont.systemFont(ofSize: 13)
        return tv
    }()
    
    let menuIcon:UIImageView = {
        let iconView = UIImageView()
        iconView.image = UIImage(named: "settings")
        iconView.contentMode = .scaleAspectFill
        
        return iconView
    }()
    
    let speratorLine : UIView = {
        let sperator = UIView()
        sperator.backgroundColor = UIColor(white: 0.8, alpha: 1)
        return sperator
    }()
    
    
}
