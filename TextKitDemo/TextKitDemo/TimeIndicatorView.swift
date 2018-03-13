//
//  TimeIndicatorView.swift
//  TextKitDemo
//
//  Created by Kerrey on 12/14/15.
//  Copyright © 2015 Kerrey. All rights reserved.
//

import UIKit

class TimeIndicatorView: UIView {

    // MARK: - Properties
    private var label = UILabel()
    var text : String? {
        didSet {
            label.text = text
            _updateViews()
            setNeedsDisplay()
            layoutIfNeeded()
        }
    }

    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        _setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        _setupViews()
    }

    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetShouldAntialias(context, true)
        let path = UIBezierPath(arcCenter: label.center, radius: radius(), startAngle: -180, endAngle: 180, clockwise: true)
        UIColor.blueColor().setFill()
        path.fill()
    }

    // MARK: - Radius
    func radius() -> CGFloat {
        let width = label.frame.size.width
        let hegith = label.frame.size.height
        let r = sqrt(width * width + hegith * hegith) / 2
        return r
    }

    // MARK: - Private
    private func _setupViews() {
        self.backgroundColor = UIColor.clearColor() // 去掉黑色背景
        self.addSubview(label)
        label.numberOfLines = 0
        label.textColor = UIColor.whiteColor()
    }

    private func _updateViews() {
        label.bounds = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        label.sizeToFit()  // 自动缩小以适应label内容
        label.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2)
    }


}
