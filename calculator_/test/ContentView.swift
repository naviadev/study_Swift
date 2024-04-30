//
//  ContentView.swift
//  test
//
//  Created by 배성빈 on 4/29/24.
//

import SwiftUI

// 메인뷰
struct ContentView : View{
    
    // * MacOs에서 기본제공 되는 계산기는 값이 들어오고 연산기호가 눌리면 새 값을 받는 형태. 그 상태에서 기호가 새로 들어온다면
    // * 입력된 값들이 계산되는 형태.
    // * result : 결과 값을 가지고 있다. -> Eqaul을 사용하였을 때 값을 계산하기 위함. Int형 변수. 결과값을 저장.
    
    @State var result : Int = 0
    @State var complateNumber : String = ""
    @State var recent : String = ""
    @State var sign : String = ""
    
    // complateNumber에 값이 존재한다면 firstInput을 false로 바꿈으로써 계산기의 기본적인 로직을 처리.
    
    @State var firstInput = true;
    
    // 동적으로 버튼을 생성하기 위해 배열을 Vstack을 내부에서 ForEach 사용
    // ForEach -> 뷰를 대상으로 작동하는 구조체
    
    var buttons = [
        ["AC", "+/-", "%", "/"],
        ["7","8","9","X"],
        ["4","5","6","-"],
        ["1","2","3","+"],
        [".","0",".","="]
    ]
    
    var count = 0;
    var body: some View{
        VStack(spacing: 20){
            Text(complateNumber)
            Text(recent)
                .font(.largeTitle)
            ForEach(buttons, id : \.self){
                ele in HStack{
                    
                    ForEach(ele, id : \.self){
                        
                        subEle in Button(action: {SelectKeyPad(subEle)}, label: {
                            
                            Text("\(subEle)")
                                .frame(
                                    width: 25,
                                    height: 15,
                                    alignment: .center
                                )
                                .background()
                                .padding(30)
                        })
                    }
                }
                    
            }
                
        }
                
            
    }
    
    
func SelectKeyPad(_ buttonText : String){
    
    switch buttonText {
        case "0"..."9":
        if(recent.prefix(1) == "0"){
            if(buttonText != "0"){
                recent = ""
                recent += buttonText
            }
            break
        }
            recent += buttonText
            return
        
        case "AC":
            result = 0
            recent = "0"
            complateNumber = "0"
            firstInput = true
            return
        case ".":
            if(recent.contains(".")){
                return
            }else{
                recent += buttonText
            }
            return
        case "+/-":
            return
        case "+", "-", "%", "X", "/":
            if(firstInput == true){
                complateNumber = recent
                recent = "0"
                firstInput = false
            }
            else{
                if(recent.contains(".") || complateNumber.contains(".")){
                 floatCaculator(buttonText)
                }
                caculator(buttonText);
            }
            return
        
        case "=":
             
            return
        
        default:
            return
    }
        
}
 
    // 정수 연산.
    func caculator(_ buttonText : String){
//        switch (sign)
        let left:Int = Int(complateNumber)!
        let Right : Int = Int(recent)!
        result = left + Right
        complateNumber = String(result)
        recent = "0"
    }
    
    // 실수 연산
    func floatCaculator(_ buttonText : String){
        
        let left:Int = Int(complateNumber)!
        let Right : Int = Int(recent)!
        result = left + Right
        complateNumber = String(result)
        recent = "0"
    }
    
}


#Preview {
    ContentView()
}


