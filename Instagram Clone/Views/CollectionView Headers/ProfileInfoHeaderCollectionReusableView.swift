//
//  ProfilrinfoHeaderCollectionReusableView.swift
//  Instagram Clone
//
//  Created by PATHAN'S MAC on 31/03/22.
//

import UIKit
protocol ProfileInfoHeaderCollectionReusableViewDelegate: AnyObject {
    func ProfileHeaderDidTapPostButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func ProfileHeaderDidTapFollowingButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func ProfileHeaderDidTapFollowerButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func ProfileHeaderDidTapEditProfileButton(_ header: ProfileInfoHeaderCollectionReusableView)
}

protocol passedData : AnyObject {
    func passData()
}

class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
        static let identifier = "ProfilrinfoHeaderCollectionReusableView"
    weak var passdataDelegare:passedData?
    weak var delegate:ProfileInfoHeaderCollectionReusableViewDelegate?
    
    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.layer.masksToBounds = true
        return imageView
    }()
    private let postsButton : UIButton = {
        let button = UIButton()
        button.setTitle("Posts", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    private let followingButton : UIButton = {
        let button = UIButton()
        button.setTitle("following", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    private let followersButton : UIButton = {
        let button = UIButton()
        button.setTitle("followers", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    private let editProfileButton : UIButton = {
        let button = UIButton()
        button.setTitle("Edit your Profile", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    private let nameLable : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "Abdl Samad Khan"
        label.numberOfLines = 1
        return label
    }()
    private let bioLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0 //Line Wrap
        label.text = "I am iOS Developer."
        label.font = .systemFont(ofSize: 10.0)
        return label
    }()


    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addButtonsAction()
        backgroundColor = .secondarySystemBackground
        clipsToBounds = true
        
    }
    private func addSubviews() {
        addSubview(profilePhotoImageView)
        addSubview(postsButton)
        addSubview(followingButton)
        addSubview(followersButton)
        addSubview(editProfileButton)
        addSubview(nameLable)
        addSubview(bioLabel)
    }
    private func addButtonsAction(){
        postsButton.addTarget(self, action: #selector(didTapPostButton), for: .touchUpInside)
        followersButton.addTarget(self, action: #selector(didtapFollowingButton), for: .touchUpInside)
        followingButton.addTarget(self, action: #selector(didtapFollowersButton), for: .touchUpInside)
        editProfileButton.addTarget(self, action: #selector(didTapEditProfileButton), for: .touchUpInside)
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let profilePhotoSize = width/4
        profilePhotoImageView.frame = CGRect(
            x: 5,
            y: 5,
            width: profilePhotoSize,
            height: profilePhotoSize
        ).integral
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize/2.0
        let buttonHeight = profilePhotoSize/2
        let countButtonWidth = (width-10-profilePhotoSize)/3
        postsButton.frame = CGRect(
            x: profilePhotoImageView.right,
            y: 5,
            width: countButtonWidth,
            height: buttonHeight
        ).integral
        followersButton.frame = CGRect(
            x: postsButton.right,
            y: 5,
            width: countButtonWidth,
            height: buttonHeight
        ).integral
        followingButton.frame = CGRect(
            x: followersButton.right,
            y: 5,
            width: countButtonWidth,
            height: buttonHeight
        ).integral
        editProfileButton.frame = CGRect(
            x: profilePhotoImageView.right,
            y: 5 + buttonHeight,
            width: (countButtonWidth*3)+2,
            height: buttonHeight
        ).integral
        nameLable.frame = CGRect(
            x: 5,
            y: 5 + profilePhotoImageView.bottom,
            width: width-10,
            height: 50
        ).integral
        let bioLableSize = bioLabel.sizeThatFits(frame.size)
        bioLabel.frame = CGRect(
            x: 5,
            y: 5 + nameLable.bottom,
            width: width-10,
            height: bioLableSize.height
        ).integral
        
    }
    //MARK:- Action
    @objc private func didTapPostButton() {
        delegate?.ProfileHeaderDidTapPostButton(self)
    }
    @objc private func didtapFollowingButton() {
        delegate?.ProfileHeaderDidTapFollowingButton(self)
    }
    @objc private func didtapFollowersButton() {
        delegate?.ProfileHeaderDidTapFollowerButton(self)
    }
    @objc private func didTapEditProfileButton() {
        delegate?.ProfileHeaderDidTapEditProfileButton(self)
        //passdataDelegare?.passData()
    }
}
