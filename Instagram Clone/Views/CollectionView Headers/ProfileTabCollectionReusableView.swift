//
//  ProfileTabCollectionReusableView.swift
//  Instagram Clone
//
//  Created by PATHAN'S MAC on 31/03/22.
//

import UIKit

class ProfileTabCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileTabCollectionReusableView"
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
