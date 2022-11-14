//
//  CustomTableViewCell1.swift
//  UnitTestCasesRepository
//
//  Created by user227716 on 11/3/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    lazy var imagVW:UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor(red: 45/255, green: 60/255, blue: 48/255, alpha: 1)
        image.heightAnchor.constraint(equalToConstant: 40).isActive = true
        image.widthAnchor.constraint(equalToConstant: 40).isActive = true
        return image
    }()
    
    lazy var title:UILabel = {
       let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.heightAnchor.constraint(equalToConstant: 20).isActive = true
        title.widthAnchor.constraint(equalToConstant: 200).isActive = true
        title.numberOfLines = 1
        return title
    }()
    
    lazy var subTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.heightAnchor.constraint(equalToConstant: 100).isActive = true
        //label.widthAnchor.constraint(equalToConstant: 400).isActive = true
        label.lineBreakMode = .byWordWrapping
        label.contentCompressionResistancePriority(for: .horizontal)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var hideAndUnHideButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.backgroundColor = .systemBlue
       // button.titleLabel?.numberOfLines = 0
        button.setTitle("Hide", for: .normal)
        button.isHidden = true
        return button
    }()
    
//    lazy var mainStackView: UIStackView = {
//       let stackView = UIStackView(arrangedSubviews: [imagVW, innerStackView])
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.alignment = UIStackView.Alignment.center
//        stackView.distribution = UIStackView.Distribution.fill
//        stackView.axis = NSLayoutConstraint.Axis.horizontal
//        stackView.spacing = 5
//        return stackView
//    }()
    
//    lazy var innerStackView: UIStackView = {
//       // let stackView = UIStackView(arrangedSubviews: [title, subTitle, hideAndUnHideButton])
//        let stackView = UIStackView(arrangedSubviews: [title, subTitle])
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.alignment = UIStackView.Alignment.fill
//        stackView.distribution = UIStackView.Distribution.fillEqually
//        stackView.axis = NSLayoutConstraint.Axis.vertical
//        return stackView
//    }()
    
    
    
    private var buttonState: hideAndUnHideButtonState = .hidden
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setUpNewUI()
        setUpTitleAndSubtitleWithImage()
        //let gesture = UITapGestureRecognizer(target: self, action: #selector(buttonTap))
       // addGestureRecognizer(gesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addViews() {
        //addSubview(mainStackView)
        addSubview(hideAndUnHideButton)
    }
    
    func setUpNewUI() {
//        mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
//        mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
//        mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        //mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        
        hideButton()
    }
    
    func setUpTitleAndSubtitleWithImage() {
        addSubview(imagVW)
        addSubview(title)
        addSubview(subTitle)
        
        
        NSLayoutConstraint.activate([
            imagVW.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            imagVW.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            
            title.leadingAnchor.constraint(equalTo: imagVW.trailingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            title.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            
            subTitle.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            subTitle.trailingAnchor.constraint(equalTo: title.trailingAnchor),
            subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            //subTitle.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10)
        ])
        
        
    }
    
    func unhideButton() {
        hideAndUnHideButton.isHidden = false
      //  innerStackView.setCustomSpacing(40, after: subTitle)
        hideAndUnHideButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        hideAndUnHideButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20).isActive = true
        //buttonState = .unhidden
    }
    
    func hideButton() {
        hideAndUnHideButton.isHidden = true
       // innerStackView.setCustomSpacing(0, after: subTitle)
        hideAndUnHideButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = false
        hideAndUnHideButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20).isActive = false
        //buttonState = .hidden
    }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//      //MARK: - If dont write below line also this function will behave we are expecting
//        super.setSelected(selected, animated: animated)
//
//        if hideAndUnHideButton.isHidden, selected {
//            unhideButton()
//        } else {
//            hideButton()
//        }
//    }
}

enum hideAndUnHideButtonState {
    case hidden
    case unhidden
}

