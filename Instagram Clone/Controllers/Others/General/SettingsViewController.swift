//
//  SettingsViewController.swift
//  Instagram Clone
//
//  Created by PATAHN'S MAC on 21/03/22.
//
import FirebaseAuth
import UIKit
import SafariServices
struct SettingCellModel {
    let title : String
    let handeler : (() -> Void)
}
/// View Controller to show user setting
final class SettingsViewController: UIViewController {
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero,
                                    style: .grouped)
        tableView.register(UITableViewCell.self,forCellReuseIdentifier: "cell")
        return tableView
    }()
    private var data = [[SettingCellModel]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
   
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }
    private func configureModels() {
        
        data.append([
            SettingCellModel(title: "Edit Profile", handeler: { [weak self] in
                self?.didTapEditProfile()
            }),
            SettingCellModel(title: "Invite Friends", handeler: { [weak self] in
                self?.didTapInviteFriends()
            }),
            SettingCellModel(title: "Save Orignal Post", handeler: { [weak self] in
                self?.didTapSave()
            })
        ])
        data.append([
            SettingCellModel(title: "Terms of Service", handeler: { [weak self] in
                self?.openURL(type: .terms)
            }),
            SettingCellModel(title: "Privacy Policy", handeler: { [weak self] in
                self?.openURL(type: .privacy)
            }),
            SettingCellModel(title: "Help / Feedback", handeler: { [weak self] in
                self?.openURL(type: .help)
            })
        ])
        
        data.append([
            SettingCellModel(title: "Log Out", handeler: { [weak self] in
                self?.didTapLogOut()
            })
        ])
    }
    enum StringsURLType{
        case terms,privacy,help
    }
    private func openURL(type: StringsURLType) {
            let urlString: String
        switch type {
        case .terms:
            urlString = "https://www.instagram.com/about/legal/terms/before-january-19-2013/"
        case .privacy:
            urlString = "https://help.instagram.com/196883487377501/?helpref=hc_fnav"
        case .help:
            urlString = "https://help.instagram.com/"
        }
        guard let url = URL(string: urlString) else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        
    }
    private func didTapEditProfile() {
        let vc = EditProfileViewController()
        vc.title = "Edit Profile"
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
    }
    private func didTapInviteFriends() {
        //Show share sheet to invite freiends
        
    }
    private func didTapSave() {
        
    }
    private func didTapLogOut(){
        AuthManager.shared.logOut { success in
            DispatchQueue.main.async {
                if success{
                    //present log in
                    let loginVC = LoginViewController()
                    loginVC.modalPresentationStyle = .fullScreen
                    self.present(loginVC, animated: true) {
                        self.navigationController?.popToRootViewController(animated: false)
                        self.tabBarController?.selectedIndex = 0
                    }
                } else {
                    //error occorred
                    
                }
            }
        }
    }

}
extension SettingsViewController: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //Handel cell Selection
        data[indexPath.section][indexPath.row].handeler()
    }
   
}

