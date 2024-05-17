//
//  SwipeAction.swift
//  Expense Tracker
//
//  Created by David Londono on 15/05/24.
//

import SwiftUI
import WidgetKit

struct SwipeAction<Content: View>: View {
    var cornerRadius: CGFloat = 0
    var direction: SwipeDirection = .trailing
    @ViewBuilder var content: Content
    @ActionBuilder var actions: [Action]
    
    @Environment(\.colorScheme) private var scheme
    
    let viewID = "CONTENTVIEW"
    @State private var isEnabled: Bool = true
    @State private var scrollOffSet: CGFloat = .zero
    var body: some View {
        ScrollViewReader { scrollProxy in
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    content
                        .rotationEffect(.init(degrees: direction == .leading ? -180 : 0))
                        .containerRelativeFrame(.horizontal)
                        .background(scheme == .dark ? .black : .white)
                        .background {
                            if let firstAction = filteredActions.first {
                                Rectangle()
                                    .fill(firstAction.tint)
                                    .opacity(scrollOffSet == .zero ? 0 : 1)
                            }
                        }
                        .id(viewID)
                        .transition(.identity)
                        .overlay {
                            GeometryReader {
                                let minX = $0.frame(in: .scrollView(axis: .horizontal)).minX
                                
                                Color.clear
                                    .preference(key: OffsetKey.self, value: minX)
                                    .onPreferenceChange(OffsetKey.self) {
                                        scrollOffSet = $0
                                    }
                            }
                        }
                    ActionButtons {
                        withAnimation(.snappy) {
                            scrollProxy.scrollTo(viewID, anchor: direction == .trailing ? .topLeading : .topTrailing)
                        }
                    }.opacity(scrollOffSet == .zero ? 0 : 1)
                }
                .scrollTargetLayout()
                .visualEffect { content, geometryProxy in
                    content
                        .offset(x: scrollOffSet(geometryProxy))
                }
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
            .background {
                if let lastAction = filteredActions.last {
                    Rectangle()
                        .fill(lastAction.tint)
                        .opacity(scrollOffSet == .zero ? 0 : 1)
                }
            }
            .clipShape(.rect(cornerRadius: cornerRadius))
            .rotationEffect(.init(degrees: direction == .leading ? 180 : 0))
        }
        .allowsHitTesting(isEnabled)
        .transition(CustomTransition())
    }
    
    @ViewBuilder
    func ActionButtons(resetPosition: @escaping () -> ()) -> some View {
        Rectangle()
            .fill(.clear)
            .frame(width: CGFloat(filteredActions.count) * 100)
            .overlay(alignment: direction.alignment) {
                HStack(spacing: 0) {
                    ForEach(filteredActions) { button in
                        Button {
                            Task {
                                isEnabled = false
                                resetPosition()
                                try? await Task.sleep(for: .seconds(0.25))
                                button.action()
                                WidgetCenter.shared.reloadAllTimelines()
                                try? await Task.sleep(for: .seconds(0.1))
                                isEnabled = true
                            }
                        } label: {
                            Image(systemName: button.icon)
                                .font(button.iconFont)
                                .foregroundStyle(button.iconTint)
                                .frame(width: 100)
                                .frame(maxHeight: .infinity)
                                .contentShape(.rect)
                        }.buttonStyle(.plain)
                        .background(button.tint)
                        .rotationEffect(.init(degrees: direction == .leading ? -180 : 0))
                    }
                }
            }
    }
    
    func scrollOffSet(_ proxy: GeometryProxy) -> CGFloat {
        let minX = proxy.frame(in: .scrollView(axis: .horizontal)).minX
        
        return (minX > 0 ? -minX : 0)
    }
    
    var filteredActions: [Action] {
        return actions.filter({ $0.isEnabled })
    }
}

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct CustomTransition: Transition {
    func body(content: Content, phase: TransitionPhase) -> some View {
        content
            .mask {
                GeometryReader {
                    let size = $0.size
                    Rectangle()
                        .offset(y: phase == .identity ? 0 : -size.height)
                }
            }.containerRelativeFrame(.horizontal)
    }
}


enum SwipeDirection {
    case leading
    case trailing
    
    var alignment: Alignment {
        switch self {
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        }
    }
}

struct Action: Identifiable {
    private(set) var id: UUID = .init()
    var tint: Color
    var icon: String
    var iconFont: Font = .title
    var iconTint: Color = .white
    var isEnabled: Bool = true
    var action: () -> ()
}

@resultBuilder
struct ActionBuilder {
    static func buildBlock(_ components: Action...) -> [Action] {
        return components
    }
}
