//
//  JournalView.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import SwiftUI

struct JournalView: View {
    @State private var todayLogMessage = ""
    @State private var selectedEmotion: Log.Emotion?
    @State private var showMonthlyRecap = false
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Today, \(Date.now.formatted(date: .abbreviated, time: .omitted))")
                        .font(.headline)
                    
                    Divider()
                    
                    Group {
                        Text("**Progress**: What did you do today?")
                        Text("**Plans**: What do you plan to do tomorrow?")
                        Text("**Problems**: What went wrong today?")
                    }
                    .font(.subheadline)
                    
                    TextEditor(text: $todayLogMessage)
                        .scrollContentBackground(.hidden)
                        .frame(height: 64)
                        .padding(-4)
                    
                    Divider()
                    
                    Text("How do you feel?")
                        .font(.subheadline)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(Log.Emotion.allCases, id: \.description) { emotion in
                                Button {
                                    withAnimation {
                                        selectedEmotion = emotion
                                    }
                                } label: {
                                    if selectedEmotion == emotion || selectedEmotion == nil {
                                        emotion.image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 48)
                                    } else {
                                        emotion.image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 48)
                                            .opacity(0.2)
                                    }
                                }
                            }
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.thickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
                
                Button {
                    showMonthlyRecap.toggle()
                } label: {
                    HStack(alignment: .center) {
                        VStack(alignment: .leading) {
                            Text("September’s Summary")
                                .font(.headline)
                            
                            Text("Get a summary of your last month!")
                                .padding(.bottom)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }
                }
                .foregroundStyle(.black)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.thickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .foregroundStyle(.black)
                .padding(.horizontal)
                .sheet(isPresented: $showMonthlyRecap) {
                    MonthSummaryView()
                }
                
                VStack(alignment: .leading) {
                    Text("Journal")
                        .font(.headline)
                        .padding(.bottom, 8)
                    
                    VStack(spacing: 4) {
                        HStack(spacing: 8) {
                            ForEach(0..<7) { index in
                                let daysOfWeek = Array("SMTWTFS")
                                
                                Text("\(String(daysOfWeek[index]))")
                                    .font(.system(size: 16))
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                        }
                        
                        ForEach(0..<4) { week in
                            HStack(spacing: 8) {
                                ForEach(0..<7) { weekNumber in
                                    ZStack {
                                        let calendar = Calendar.current
                                        let log = viewModel.logs.first {
                                            calendar.component(.day, from: $0.date) == weekNumber * week
                                        }
                                        
                                        if let log {
                                            RoundedRectangle(cornerRadius: 8)
                                                .fill(log.emotion.color)
                                                .aspectRatio(1, contentMode: .fit)
                                                .opacity(0.5)
                                            log.emotion.image
                                                .resizable()
                                                .scaledToFit()
                                                .padding(4)
                                        } else {
                                            RoundedRectangle(cornerRadius: 8)
                                                .fill(.gray)
                                                .aspectRatio(1, contentMode: .fit)
                                                .opacity(0.1)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.thickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
                
            }
            .navigationTitle("Journal")
        }
    }
}

#Preview {
    JournalView()
}
