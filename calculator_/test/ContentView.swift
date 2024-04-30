//
//  ContentView.swift
//  test
//
//  Created by 배성빈 on 4/29/24.
//

import SwiftUI

// 메인뷰
struct ContentView : View{
    // * result : 결과 값을 가지고 있다. equal 입력 시 해당 변수에 값을 넣는 형태. 마지막에 해당값을 통해 recent :String으로 변환 후 출력 
    @State var result : Int = 0
    // * 현재 입력값 위에 보이는 작은 텍스트 -> 지금까지 입력한 값과 기호를 출력해준다.
    @State var subText : String = ""
    // * 현재 입력중인 값
    @State var recent : String = ""
    // * 부호
    @State var sign : String = ""
    // * 튜플로 변경해야할까? 
    @State var resultArr : Array = []
    var exeCalculator = false;
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
            Text(subText)
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
            subText = "0"
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
        case "%":
            sign = "%"
            return
        case "/":
            sign = "/"
            return
        case "X":
            sign = "X"
            return
        case "-":
            sign = "-"
            return
        case "+":
            sign = "+"
            return
        case "=":
            sign = ""
            return
        default:
            return
    }
        
}
 
    func caculator(){
        
    }
    
}


#Preview {
    ContentView()
}


