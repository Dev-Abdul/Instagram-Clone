//
//  FormTableViewCell.swift
//  Instagram Clone
//
//  Created by PATAHN'S MAC on 29/03/22.
//

import UIKit
protocol FormTableViewCellDelegate: AnyObject{
    func fromTableViewCell (_ cell: FormTableViewCell, didUpdateField  value: String?)
}

class FormTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    public weak var delegate: FormTableViewCellDelegate?
    
    static let identifier = "FormTableViewCell"
    
    private let formLabel: UILabel = {
       let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
       return label
    }()
    private let textField: UITextField = {
       let textField = UITextField()
        textField.returnKeyType = .done
       return textField
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        contentView.addSubview(formLabel)
        contentView.addSubview(textField)
        textField.delegate = self
        selectionStyle = .none
 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: EditProfileFormModel) {
        formLabel.text = model.label
        textField.placeholder = model.Placeholder
        textField.text = model.value
    }
    override func prepareForReuse(){
        formLabel.text = nil
        textField.placeholder = nil
        textField.text = nil
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        //Asign Frames
        formLabel.frame = CGRect(x: 5,
                                 y: 0,
                                 width: contentView.width/3,
                                 height: contentView.height)
        textField.frame = CGRect(x: formLabel.right + 5,
                                 y: 0,
                                 width: contentView.width-10-formLabel.width,
                                 height: contentView.height)
    }
    
    //MARK:- Field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        delegate?.fromTableViewCell(self, didUpdateField: textField.text)
        textField.resignFirstResponder()
        return true
        
    }
    
}
