//
//  ContentView.swift
//  test
//
//  Created by 배성빈 on 4/29/24.
//

import SwiftUI

struct ContentView : View{
    @State var result : Int = 0
    @State var subText : String = ""
    @State var recent : String = ""
    @State var sign : String = ""
    @State var resultArr : Array = []
    var exeCalculator = false;
    @State var firstInput = true;
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


