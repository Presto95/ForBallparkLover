//
//  AreaPosition.swift
//  ForBallparkLover
//
//  Created by Presto on 2018. 2. 15..
//  Copyright © 2018년 Presto. All rights reserved.
//

enum AreaPosition: String{
    case gwangju = "광주" //KIA 1구장
    case jamsil = "잠실"  //두산, LG 1구장
    case masan = "마산"   //NC 1구장      
    case suwon = "수원"   //KT 1구장
    case sajik = "사직"   //롯데 1구장
    case daejeon = "대전" //한화 1구장
    case daegu = "대구"   //삼성 1구장
    case gochuk = "고척"  //넥센 1구장
    case moonhak = "문학" //SK 1구장
    case etc = "기타"     //나머지들
}

struct AreaCoordinates {
    let gwangju = (59, 74)
    let jamsil = (62, 125)
    let masan = (89, 77)
    let suwon = (61, 121)
    let sajik = (98, 76)
    let daejeon = (68, 100)
    let daegu = (89, 90)
    let gochuk = (58, 125)
    let moonhak = (55, 124)
}
