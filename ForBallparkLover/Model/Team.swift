//
//  Team.swift
//  ForBallparkLover
//
//  Created by Presto on 2018. 2. 15..
//  Copyright © 2018년 Presto. All rights reserved.
//

import UIKit

enum Team: String{
    case kia = "KIA 타이거즈"
    case doosan = "두산 베어스"
    case lotte = "롯데 자이언츠"
    case nc = "NC 다이노스"
    case sk = "SK 와이번스"
    case lg = "LG 트윈스"
    case nexen = "넥센 히어로즈"
    case hanwha = "한화 이글스"
    case samsung = "삼성 라이온즈"
    case kt = "KT 위즈"
    case none = "없음"
}


func getTeamColor(_ name: Team) -> UIColor {
    switch(name){
    case .kia:
        return UIColor(red: 178/255, green: 20/255, blue: 40/255, alpha: 1)//.cgColor
    case .doosan:
        return UIColor(red: 19/255, green: 19/255, blue: 47/255, alpha: 1)//.cgColor
    case .lotte:
        return UIColor(red: 241/255, green: 111/255, blue: 48/255, alpha: 1)//.cgColor
    case .nc:
        return UIColor(red: 28/255, green: 72/255, blue: 121/255, alpha: 1)//.cgColor
    case .sk:
        return UIColor(red: 229/255, green: 25/255, blue: 56/255, alpha: 1)//.cgColor
    case .lg:
        return UIColor(red: 188/255, green: 15/255, blue: 58/255, alpha: 1)//.cgColor
    case .nexen:
        return UIColor(red: 108/255, green: 18/255, blue: 32/255, alpha: 1)//.cgColor
    case .hanwha:
        return UIColor(red: 241/255, green: 115/255, blue: 48/255, alpha: 1)//.cgColor
    case .samsung:
        return UIColor(red: 14/255, green: 102/255, blue: 176/255, alpha: 1)//.cgColor
    case .kt:
        return UIColor(red: 35/255, green: 31/255, blue: 32/255, alpha: 1)//.cgColor
    case .none:
        return .white
    }
}

func getComplementaryForColor(color: UIColor) -> UIColor {
    
    let ciColor = CIColor(color: color)
    
    // get the current values and make the difference from white:
    let compRed: CGFloat = 1.0 - ciColor.red
    let compGreen: CGFloat = 1.0 - ciColor.green
    let compBlue: CGFloat = 1.0 - ciColor.blue
    
    return UIColor(red: compRed, green: compGreen, blue: compBlue, alpha: 1.0)
}
