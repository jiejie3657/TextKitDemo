//
//  StringExtension.swift
//  TextKitDemo
//
//  Created by Kerrey on 12/14/15.
//  Copyright © 2015 Kerrey. All rights reserved.
//

import UIKit

extension String {
    static func txtString(filename aFileName: String ,filetype aFileType: String) -> String {
        var text = ""
        let path = NSBundle.mainBundle().pathForResource(aFileName, ofType: aFileType)
        do {
            text = try NSString.init(contentsOfFile: path!, encoding:NSUTF8StringEncoding) as String
        }
        catch {
            print("\(aFileName).\(aFileType) 文件读取出错")
        }
        return text
    }
}
