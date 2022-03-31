//
//  ViewController.swift
//  Instagram Clone
//
//  Created by PATAHN'S MAC on 21/03/22.
//
import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {
    private let tableView:UITableView = {
        let tableView = UITableView()
        tableView.register(IGfeedPostTableViewCell.self , forCellReuseIdentifier: IGfeedPostTableViewCell.identifire)
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    override func viewDidAppear(_ animation : Bool){
        super.viewDidAppear(animation)
        handelNotAuthenticated()
    }
    private func handelNotAuthenticated(){
        //Check aurth ststus
        if Auth.auth().currentUser == nil{
            // Show login
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }
}
extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IGfeedPostTableViewCell.identifire,for: indexPath) as! IGfeedPostTableViewCell
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //Handel cell Selection
        
    }
}
