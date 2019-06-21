//
//  RepoCell.swift
//  CashUTask
//
//  Created by Sherif  Wagih on 6/20/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit

class RepoCell: UICollectionViewCell {
    
    let repoNameLabel = UILabel(text: "Repositry Name", font: .boldSystemFont(ofSize: 20), numberOfLines: 1)
    
    let repoDescriptionLabel = UILabel(text: "Repo desc", font: .systemFont(ofSize: 15), numberOfLines: -1)
    
    let dotLabel = UILabel(text: "•", font: .systemFont(ofSize: 35))// "•"
    
    let programmingLanguageLabel = UILabel(text: "Javascript", font: .systemFont(ofSize: 15), numberOfLines: 1)
    
    let starsImage = UIImageView(image: #imageLiteral(resourceName: "star").withRenderingMode(.alwaysTemplate))
    
    let numberOfStarsLabel = UILabel(text: "8", font: .systemFont(ofSize: 15))
    
    let isArchivedButton = UIButton(title: "Archived")
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
    }
    
    
    
    fileprivate func setupViews()
    {
        let fullRepoStack = UIStackView(arrangedSubViews: [
            UIStackView(arrangedSubViews: [repoNameLabel,isArchivedButton,UIView()],axis: .horizontal,spacing: 8),
            
            repoDescriptionLabel,
            
            UIStackView(arrangedSubViews: [dotLabel,programmingLanguageLabel,UIView()],axis: .horizontal,spacing: 2,alignment: .center),
            
            UIStackView(arrangedSubViews: [starsImage,numberOfStarsLabel], axis: .horizontal, spacing: 2,alignment: .top)
            
            ], axis: .vertical, spacing: 12)
        
        addSubview(fullRepoStack)
        fullRepoStack.fillSuperView(padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        
        
        //MARK:- design repo name
        repoNameLabel.textColor = UIColor(red: 3/255, green: 102/255, blue: 214/255, alpha: 1)
        
        
        
        setArchiveButton()
        
        setStarsImage()
        
        setDotLabelLayout()
    }
    fileprivate func setArchiveButton()
    {
        isArchivedButton.layer.borderWidth = 3
        isArchivedButton.layer.borderColor = UIColor(white: 0.97, alpha: 1).cgColor
        isArchivedButton.titleEdgeInsets = .init(top: 10, left: 10, bottom: 10, right: 10)
        isArchivedButton.setTitleColor( UIColor(red: 88/255, green: 96/255, blue: 121/255, alpha: 1), for: .normal)
        isArchivedButton.anchorToView(size:.init(width: 90, height: 40))
    }
    fileprivate func setStarsImage()
    {
        starsImage.tintColor = .darkGray
        starsImage.anchorToView(size:.init(width: 15, height: 15))
    }
    fileprivate func setDotLabelLayout()
    {
        dotLabel.anchorToView(size:.init(width: 15, height: 0))
        dotLabel.textColor = .darkGray
    }
    func setCellData(repo:Repo)
    {
        self.repoNameLabel.text = repo.name
        self.isArchivedButton.isHidden = repo.archived
        self.repoDescriptionLabel.text = repo.description
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
