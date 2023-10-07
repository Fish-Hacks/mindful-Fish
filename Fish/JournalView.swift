//
//  JournalView.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import SwiftUI

struct JournalView: View {
    @State private var todayLogMessage = ""
    @State private var showMonthlyRecap = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Today, \(Date.now.formatted(date: .abbreviated, time: .omitted))")
                        .font(.headline)
                    
                    Text("What did you do today?")
                        .font(.subheadline)
                    
                    TextEditor(text: $todayLogMessage)
                        .scrollContentBackground(.hidden)
                        .frame(height: 64)
                        .padding(-4)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            Text("🤣")
                            Text("😀")
                            Text("😐")
                            Text("🙁")
                            Text("😭")
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.thickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("Weekly Recap")
                        .font(.headline)
                    
                    Text("Last week, you [LLM summary with advice].")
                        .padding(.bottom)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.thickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("Monthly Summary")
                        .font(.headline)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            Button {
                                
                            } label: {
                                ZStack {
                                    Circle()
                                        .fill(.blue.opacity(0.2))
                                    Text("Feb")
                                        .bold()
                                        .foregroundStyle(.blue)
                                }
                                .frame(width: 48, height: 48)
                            }
                            
                            Button {
                                showMonthlyRecap.toggle()
                            } label: {
                                ZStack {
                                    Circle()
                                        .fill(.blue.opacity(0.2))
                                    Text("Jan")
                                        .bold() 
                                        .foregroundStyle(.blue)
                                }
                                .frame(width: 48, height: 48)
                            }
                        }
                    }
                }
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
                    Text("Logs")
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
                        
                        ForEach(0..<4) { _ in
                            HStack(spacing: 8) {
                                ForEach(0..<7) { weekNumber in
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(.blue)
                                            .aspectRatio(1, contentMode: .fit)
                                            .opacity(0.5)
                                        Text("😭")
                                            .font(.system(size: 16))
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
            .navigationTitle("Logs")
        }
    }
}

#Preview {
    JournalView()
}
