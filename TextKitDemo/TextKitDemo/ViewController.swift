//
//  ViewController.swift
//  TextKitDemo
//
//  Created by Kerrey on 12/11/15.
//  Copyright © 2015 Kerrey. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextViewDelegate {

    // MARK: - Properties
    var textView : UITextView!
    var timeIndicatorView : TimeIndicatorView!

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        _setupViews()
        _updateExclusionPaths()
        _highlight()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    deinit {

    }


    // MARK: - Private
    /**
    textView 初始化
    */
    private func _setupViews() {

        // frame
        let frame = self.view.bounds

        // TextStorage , LayoutManager , TextContainer
        let textStorage = NSTextStorage()

        let layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)

        let textContainer = NSTextContainer(size: frame.size)
        layoutManager.addTextContainer(textContainer)

        textView = UITextView(frame: frame, textContainer: textContainer)

        // textView
        self.view.addSubview(textView)
        textView.editable = false
        textView.selectable = false
        let txtString = String.txtString(filename: "lorem", filetype: "txt")

        textView.textStorage.replaceCharactersInRange(NSMakeRange(0, 0), withString: txtString)

        // TimeIndicatorView
        timeIndicatorView = TimeIndicatorView(frame: CGRectMake(100,100,100,100))
        timeIndicatorView.text = "卡卡卡卡卡卡卡卡卡卡"
        textView.addSubview(timeIndicatorView)
    }

    /**
     圆形路径
     */
    private func _updateExclusionPaths() {
        var circleFrame = self.textView.convertRect(timeIndicatorView.bounds, fromView: timeIndicatorView) // 坐标转换
        circleFrame.origin.x = circleFrame.origin.x - textView.textContainerInset.left
        circleFrame.origin.y = circleFrame.origin.y - textView.textContainerInset.top
        let circlePath = UIBezierPath(roundedRect: circleFrame, cornerRadius: timeIndicatorView.radius())
        textView.textContainer.exclusionPaths = [circlePath]
    }

    /**
     语法高亮
     */
    private func _highlight() {
        textView.textStorage.beginEditing()

        // 属性描述字典
        let attributesDict = [NSForegroundColorAttributeName:UIColor.redColor()]

        textView.textStorage.setAttributes(attributesDict, range: NSMakeRange(20, 200))

        textView.textStorage.endEditing()
    }

}

