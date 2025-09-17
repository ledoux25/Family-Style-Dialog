import SwiftUI

struct ContentView: View {
    
    @State private var active = false
    @State private var showDone = false
    @Namespace private var animation
    let primaryColor = Color.black
    
    

    
    var body: some View {
        VStack {
            Spacer()
            Text("Family Style Dialog")
                .foregroundStyle(.white)
                .font(.largeTitle.bold())
            Spacer()
            if (active) {
                VStack(alignment: .leading, spacing: 16) {
                    if showDone{
                        HStack{
                            Image(systemName: "checkmark.circle.fill")
                            Text("Received")
                                .fontWeight(.semibold)
                                
                        }
                        .frame(maxWidth: .infinity)
                        .matchedGeometryEffect(id: showDone ? "buttom" : "", in: animation)
                        
                        
                    }else{
                        HStack(){
                            Image(systemName: "questionmark.circle")
                            Text("Confirm")
                            Spacer()
                            Button{
                                withAnimation(.bouncy(duration: 0.25, extraBounce: 0.1)){
                                    active.toggle()
                                    
                                }
                            } label : {
                                Image(systemName: "xmark")
                            }
                        }
                        .font(.title2)
    //                    .padding([.top,.leading,.trailing])
    //                    .padding(.top, 5)
                        
                        Text("Are you sure you want to receice a load of money ?")
                            
                        
                        HStack(){
                            Button("Cancel"){
                                withAnimation(.bouncy(duration: 0.25)){
                                    active.toggle()
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.white)
                            )
                            
                            Button("Receive"){
                                withAnimation(.bouncy(duration: 0.25)){
                                    showDone = true
                                    
                                    Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false){ timer in
                                        withAnimation(.bouncy(duration: 0.25)){
                                            showDone = false
                                            active = false
                                        }
                                        
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .foregroundStyle(primaryColor)
                            .background(.white)
                            .clipShape(.rect(cornerRadius: 20))
                            .matchedGeometryEffect(id: "buttom", in: animation)
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(red: 0.2, green: 0.2, blue: 0.2).opacity(0.5))
                .foregroundStyle(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(.white)
                )
                .clipShape(.rect(cornerRadius: 30),)
                .transition(.asymmetric(
                    insertion: .push(from: .bottom),
                    removal: .opacity
                ))
                .padding()
                .offset(y: showDone ? -40 : 0)
                
                
            }
            
            
            if(!active) {
                Button("Receive"){
                    withAnimation(.bouncy(duration: 0.3)){
                        active.toggle()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .foregroundStyle(.black)
                .background(.white)
                .clipShape(.rect(cornerRadius: 20))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.black)
                )
                .padding(.horizontal)
                .matchedGeometryEffect(id: "buttom", in: animation)
            }
            
        }
        .background(.black)
    }
}

#Preview {
    ContentView()
}
