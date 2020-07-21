//
//  TableCell.swift
//  URLSection
//
//  Created by Huy on 7/21/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title:"
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    let titleContentLabel = CustomContentLabel()
    let tagsLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tags:"
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    let tagsContentLabel = CustomContentLabel()
    let answerCountLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Anwers Count:"
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    let answerCountContentLabel = CustomContentLabel()
    let scoreLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Score:"
        
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    let scoreContentLabel = CustomContentLabel()
    let linkLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Link:"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    let linkContentLabel : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.sizeToFit()
        textView.isScrollEnabled = false
        return textView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUpComponent()
        setupLayout()
        setupLink()
        // Configure the view for the selected state
    }
    func setUpComponent(){
        self.addSubview(titleLabel)
        self.addSubview(titleContentLabel)
        self.addSubview(tagsLabel)
        self.addSubview(tagsContentLabel)
        self.addSubview(answerCountLabel)
        self.addSubview(answerCountContentLabel)
        self.addSubview(scoreLabel)
        self.addSubview(scoreContentLabel)
        self.addSubview(linkLabel)
        self.addSubview(linkContentLabel)
    }
    func setupLayout(){
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        titleLabel.sizeToFit()
        
        titleContentLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
        titleContentLabel.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 10).isActive = true
        titleContentLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        titleContentLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        
        tagsLabel.topAnchor.constraint(equalTo: titleContentLabel.bottomAnchor, constant: 10).isActive = true
        tagsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        tagsLabel.sizeToFit()
        
        tagsContentLabel.topAnchor.constraint(equalTo: tagsLabel.topAnchor).isActive = true
        tagsContentLabel.leftAnchor.constraint(equalTo: tagsLabel.rightAnchor, constant: 10).isActive = true
        tagsContentLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        tagsContentLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        
        answerCountLabel.topAnchor.constraint(equalTo: tagsContentLabel.bottomAnchor, constant: 10).isActive = true
        answerCountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        answerCountLabel.sizeToFit()
        
        answerCountContentLabel.topAnchor.constraint(equalTo: answerCountLabel.topAnchor).isActive = true
        answerCountContentLabel.leftAnchor.constraint(equalTo: answerCountLabel.rightAnchor, constant: 10).isActive = true
        answerCountContentLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        answerCountContentLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        
        scoreLabel.topAnchor.constraint(equalTo: answerCountContentLabel.bottomAnchor, constant: 10).isActive = true
        scoreLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        scoreLabel.sizeToFit()
        
        scoreContentLabel.topAnchor.constraint(equalTo: scoreLabel.topAnchor).isActive = true
        scoreContentLabel.leftAnchor.constraint(equalTo: scoreLabel.rightAnchor, constant: 10).isActive = true
        scoreContentLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        scoreContentLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        
        linkLabel.topAnchor.constraint(equalTo: scoreContentLabel.bottomAnchor, constant: 10).isActive = true
        linkLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        linkLabel.sizeToFit()
        
        linkContentLabel.topAnchor.constraint(equalTo: linkLabel.topAnchor).isActive = true
        linkContentLabel.leftAnchor.constraint(equalTo: linkLabel.rightAnchor, constant: 20).isActive = true
        linkContentLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        linkContentLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        
    }
    func setupLink(){
        let attributedString = NSMutableAttributedString.init(string: linkContentLabel.text ?? "")
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemBlue,
                                      range: NSRange.init(location: 0, length: attributedString.length))
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1,
                                      range: NSRange.init(location: 0, length: attributedString.length))
        attributedString.addAttribute(NSAttributedString.Key.link, value: self.linkContentLabel.text ?? "",
                                      range: NSRange.init(location: 0, length: attributedString.length))
        linkContentLabel.attributedText = attributedString
        linkContentLabel.font = .systemFont(ofSize: 14)
    }
}
