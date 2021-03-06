//
//  LiginViewController.swift
//  Instagram Clone
//
//  Created by PATAHN'S MAC on 21/03/22.
//
import SafariServices
import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    struct constants {
        static let cornarradious : CGFloat = 8.0
    }
    private let usernameEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username or Email..."
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
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = constants.cornarradious
        button.backgroundColor = .systemBlue
        return button
    }()
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("New user? Create an Account", for: .normal)
        button.setTitleColor(.label, for: .normal)
//        button.layer.masksToBounds = true
//        button.layer.cornerRadius = constants.cornarradious
//        button.backgroundColor = .red
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
        loginButton.addTarget(
            self,
            action: #selector(didTapLoginButton),
            for: .touchUpInside
        )
        createAccountButton.addTarget(
            self,
            action: #selector(didTapNewAccountButton),
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
        
        usernameEmailField.delegate = self
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
        usernameEmailField.frame = CGRect(
            x: 25,
            y: headerView.bottom + 30 ,
            width: view.width - 50,
            height: 52.0
        )
        userPasswordField.frame = CGRect(
            x: 25,
            y: usernameEmailField.bottom + 10 ,
            width: view.width - 50,
            height: 52.0
        )
        loginButton.frame = CGRect(
            x: 25,
            y: userPasswordField.bottom + 10 ,
            width: view.width - 50,
            height: 52.0
        )
        createAccountButton.frame = CGRect(
            x: 25,
            y: loginButton.bottom + 10 ,
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
        view.addSubview(usernameEmailField)
        view.addSubview(userPasswordField)
        view.addSubview(loginButton)
        view.addSubview(createAccountButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(headerView)
    }
    @objc private func didTapLoginButton(){
        userPasswordField.resignFirstResponder()
        usernameEmailField.resignFirstResponder()
        guard let usernameEmail = usernameEmailField.text , !usernameEmail.isEmpty,
              let userPassword = userPasswordField.text , !usernameEmail.isEmpty, userPassword.count >= 8 else {
                  return
              }
        // Login funcnality
        var username:String?
        var email:String?
        
        if usernameEmail.contains("@"),usernameEmail.contains("."){
            //email
            email = usernameEmail
        }else{
            //username
            username = usernameEmail
        }
        
        
        AuthManager.shared.loginUser(username: username,email: email, password: userPassword) { success in
            DispatchQueue.main.async {
                if success {
                    // user login
                    self.dismiss(animated: true, completion: nil)
                } else {
                    //error ouccrred
                    let alert = UIAlertController(
                        title: "Log In Error",
                        message: "We were unable to Log you In",
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
    
    @objc private func didTapNewAccountButton(){
        let vc = RegistrationViewController()
        present(vc, animated: true)
    }
}
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn (_ textField: UITextField) -> Bool {
        if textField == usernameEmailField {
            userPasswordField.becomeFirstResponder()
        } else if textField == userPasswordField {
            didTapLoginButton()
        }
        return true
    }
}
