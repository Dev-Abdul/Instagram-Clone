//
//  IGfeedPostTableViewCell.swift
//  Instagram Clone
//
//  Created by PATAHN'S MAC on 24/03/22.
//

import UIKit

final class IGfeedPostTableViewCell: UITableViewCell {
    static let identifire = "IGfeedPostTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
