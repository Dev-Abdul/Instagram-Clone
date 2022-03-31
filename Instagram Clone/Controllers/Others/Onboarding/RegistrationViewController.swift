//
//  RegistrationViewController.swift
//  Instagram Clone
//
//  Created by PATAHN'S MAC on 21/03/22.
//
import SafariServices
import UIKit

class RegistrationViewController: UIViewController {
    struct constants {
        static let cornarradious : CGFloat = 8.0
    }

    private let userNameField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer .masksToBounds = true
        field.layer.cornerRadius = constants.cornarradious
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        field.backgroundColor = .secondarySystemBackground
        return field
    }() //this declearation is called Closer declearation
    
    private let userEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer .masksToBounds = true
        field.layer.cornerRadius = constants.cornarradious
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        field.backgroundColor = .secondarySystemBackground
        return field
    }()
    
    private let userPasswordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password..."
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer .masksToBounds = true
        field.layer.cornerRadius = constants.cornarradious
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        field.backgroundColor = .secondarySystemBackground
        return field
    }()
    private let userCPasswordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Confirm Password..."
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer .masksToBounds = true
        field.layer.cornerRadius = constants.cornarradious
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        field.backgroundColor = .secondarySystemBackground
        return field
    }()
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = constants.cornarradious
        button.backgroundColor = .systemBlue
        return button
    }()
    private let alreadyLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Already have an Account? LogIn hear", for: .normal)
        //button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms and Condition", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundImageView = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backgroundImageView)
        return header
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        // Do any additional setup after loading the view.
        signUpButton.addTarget(
            self,
            action: #selector(didTapSignUpButton),
            for: .touchUpInside
        )
        alreadyLoginButton.addTarget(
            self,
            action: #selector(didTapLoginAccountButton),
            for: .touchUpInside
        )
        termsButton.addTarget(
            self,
            action: #selector(didTapTermsButton),
            for: .touchUpInside
        )
        privacyButton.addTarget(
            self,
            action: #selector(didTapPrivacyButton),
            for: .touchUpInside
        )
        
        userNameField.delegate = self
        userEmailField.delegate = self
        userPasswordField.delegate = self
        
        addSubViews()
        
        view.backgroundColor = .systemBackground

        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // assign frame
        headerView.frame = CGRect(
            x: 0,
            y: 0 ,
            width: view.width,
            height: view.height/3.0
        )
        userNameField.frame = CGRect(
            x: 25,
            y: headerView.bottom + 30 ,
            width: view.width - 50,
            height: 52.0
        )
        userEmailField.frame = CGRect(
            x: 25,
            y: userNameField.bottom + 10 ,
            width: view.width - 50,
            height: 52.0
        )
        userPasswordField.frame = CGRect(
            x: 25,
            y: userEmailField.bottom + 10 ,
            width: view.width - 50,
            height: 52.0
        )
        userCPasswordField.frame = CGRect(
            x: 25,
            y: userPasswordField.bottom + 10 ,
            width: view.width - 50,
            height: 52.0
        )
        signUpButton.frame = CGRect(
            x: 25,
            y: userCPasswordField.bottom + 10 ,
            width: view.width - 50,
            height: 52.0
        )
        alreadyLoginButton.frame = CGRect(
            x: 25,
            y: signUpButton.bottom + 10 ,
            width: view.width - 50,
            height: 52.0
        )
        termsButton.frame = CGRect(
            x: 10,
            y: view.height - view.safeAreaInsets.bottom - 70,
            width: view.width - 20,
            height: 50
        )
        privacyButton.frame = CGRect(
            x: 10,
            y: view.height - view.safeAreaInsets.bottom - 40,
            width: view.width - 20,
            height: 50
        )
        
        
        configureHeaderView()
    }
    private func configureHeaderView() {
        guard headerView.subviews.count == 1 else {
            return
        }
        guard let backgroundView = headerView.subviews.first else {
            return
        }
        backgroundView.frame = headerView.bounds
        
        //Add Instagram  Logo
        
        let imageView = UIImageView(image: UIImage(named: "logo"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width/4.0,
                                 y: view.safeAreaInsets.top,
                                 width: headerView.width/2.0,
                                 height: headerView.height - view.safeAreaInsets.top)
    }
    
    private func addSubViews() {
        view.addSubview(userNameField)
        view.addSubview(userEmailField)
        view.addSubview(userPasswordField)
        view.addSubview(userCPasswordField)
        view.addSubview(signUpButton)
        view.addSubview(alreadyLoginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(headerView)
    }
    @objc private func didTapSignUpButton(){
        userPasswordField.resignFirstResponder()
        userCPasswordField.resignFirstResponder()
        userNameField.resignFirstResponder()
        userEmailField.resignFirstResponder()
        guard let userName = userNameField.text , !userName.isEmpty,
              let userEmail = userEmailField.text , !userEmail.isEmpty,
              let userPassword = userPasswordField.text , !userPassword.isEmpty, userPassword.count >= 8,
              let userCPassword = userCPasswordField.text, !userCPassword.isEmpty, userCPassword.count >= 8, userCPassword == userPassword else {
                  return
              }
        // SignUp funcnality
        AuthManager.shared.registerNewUser(username: userName, email: userEmail, password: userPassword) { registerd in
            DispatchQueue.main.async {
                if registerd {
                    // user register
                    self.dismiss(animated: true, completion: nil)
                } else {
                    //error ouccrred
                    let alert = UIAlertController(
                        title: "Sign Up Error",
                        message: "We were unable to you Sign Up",
                        preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
    @objc private func didTapTermsButton(){
        guard let url = URL(string: "https://www.instagram.com/about/legal/terms/before-january-19-2013/") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc private func didTapPrivacyButton(){
        guard let url = URL(string: "https://help.instagram.com/196883487377501/?helpref=hc_fnav") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc private func didTapLoginAccountButton(){
        dismiss(animated: true, completion: nil)
//        let vc = LoginViewController()
//        present(vc, animated: true)
    }
}
extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn (_ textField: UITextField) -> Bool {
        if textField == userNameField {
            userEmailField.becomeFirstResponder()
        } else if textField == userEmailField {
            userPasswordField.becomeFirstResponder()
        } else {
            didTapSignUpButton()
        }
        return true
    }
}
