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
    @State var complateNumber : String = "0"
    @State var recent : String = "0"
    @State var sign : String = ""
    // 실수 계산을 판단 -> 값에 . 이 들어온다면 해당값을 true로 변경하여 실수용을 호출할 수 있도록.
    @State var dicimal : Bool = false
    @State var checkEqual : Bool = false
    
    
    
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
            //equal을 누른 상태에서 바로 부호 없이 다음 숫자가 들어온다면
            if(checkEqual == true){complateNumber = "0"}
            // 0이 존재하는 상태에서 0이 들어왔다면.
            if(recent.prefix(1) == "0" && buttonText == "0"){
                recent.contains(".") ? (recent += buttonText) : (recent = "0")
                return
            }
            // 0만 존재하는 상태에서 버튼이 들어왔다면.
            if(recent.prefix(1) == "0" && recent.count == 1){
                recent = buttonText
                return
            }
            // 모두 아니라면 recent값에 버튼값을 추가.
                recent += buttonText
                return
            
            // AC 초기화 버튼
            case "AC":
                result = 0
                recent = "0"
                complateNumber = "0"
                return
            
            case ".":
            if(recent.contains(".")){
                    return
                }else{
                    recent += buttonText
                }
                return
            
            case "+/-":
            if(recent.contains("-")){
                let i = recent.split(separator: "-")
             
                return
            }
            else{
                recent = "-" + recent
                return
            }
 
                
            
            case "=":
                 // 이퀄 다음에 부호가 오면 다음 연산을 , 숫자가 오면 누적값을 초기화.
                caculator(sign)
                sign = ""
                checkEqual = true
                return
            
            default:
            // 오퍼레이터 입력이 처음이라면
            if(checkEqual == true){checkEqual = false}
                if(complateNumber == "0"){
                    complateNumber = recent
                    recent = "0"
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
     
        // 정수 연산.
        func caculator(_ buttonText : String){
            
           
            
            let left:Int = Int(complateNumber)!
            let Right : Int = Int(recent)!
            
            switch (sign){
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


