//
//  SelfSizingCollectionCell.swift
//  OneBusAway
//
//  Created by Aaron Brethorst on 5/23/18.
//  Copyright © 2018 OneBusAway. All rights reserved.
//

import UIKit

/*

 abxoxo TODO: replumb this with `systemLayoutSizeFitting` :(

 https://gist.github.com/dhavalcue/4b081e65ded5c261d301beddbd2ddfcb

 */

class SelfSizingCollectionCell: UICollectionViewCell {

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var newFrame = layoutAttributes.frame
        // note: don't change the width
        newFrame.size.height = ceil(size.height)
        layoutAttributes.frame = newFrame
        return layoutAttributes
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = OBATheme.mapTableBackgroundColor

        clipsToBounds = true

        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.clipsToBounds = true
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

//    public static let insets = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15)
    public static let insets = UIEdgeInsets.zero

    public static let leftRightInsets = UIEdgeInsetsMake(0, OBATheme.defaultPadding, 0, OBATheme.defaultPadding)
}
