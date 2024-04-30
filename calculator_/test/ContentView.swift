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
    @State var resultFloat : Float = 0
    @State var complateNumber : String = ""
    @State var recent : String = ""
    @State var sign : String = ""
    // 실수 계산을 판단 -> 값에 . 이 들어온다면 해당값을 true로 변경하여 실수용을 호출할 수 있도록.
    @State var dicimal : Bool = false
    @State var checkEqual : Bool = false
    
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
                            
//                            if(subEle == "0"..."9")
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
        
        case "=":
            checkEqual = true // 이퀄 다음에 부호가 오면 다음 연산을 , 숫자가 오면 누적값을 초기화.
            caculator(buttonText)
            return
        
        default:
        
        
            if(firstInput == true){
                complateNumber = recent
                recent = "0"
                firstInput = false
                sign = "\(buttonText)"
            }
            else{
                if(recent.contains(".") || complateNumber.contains(".")){
                 floatCaculator(buttonText)
                }
                caculator(buttonText);
            }
            return
    }
        
}
 
    // 정수 연산.
    func caculator(_ buttonText : String){
        
        let left:Int = Int(complateNumber)!
        let Right : Int = Int(recent)!
        
        switch (sign){
        case "=":
            return
        case "+" :
            result = left + Right
            complateNumber = String(result)
            recent = "0"
            break
        case "-":
            result = left - Right
            complateNumber = String(result)
            recent = "0"
            return
        case "X":
            result = left * Right
            complateNumber = String(result)
            recent = "0"
        case "/":
            result = left / Right
            complateNumber = String(result)
            recent = "0"
        case "%":
            result = left / Right
            complateNumber = String(result)
            recent = "0"
        
        default:
            return
        }
      sign = buttonText
    }
    
    // 실수 연산
    func floatCaculator(_ buttonText : String){
        let left:Float = Float(complateNumber)!
        let Right : Float = Float(recent)!
        resultFloat = left + Right
        complateNumber = String(result)
        recent = "0"
    }
    
 
    
}


#Preview {
    ContentView()
}


