import Foundation
import SwiftUI

/// DEBUG-only visual study. All data here is static and it never touches
/// FriendMVPModel, persistence, Family Controls, or live activities.
struct FocumiDesignLab: View {
    @State private var selectedScreen: DesignScreen
    @State private var selectedCompanion: Companion = .milo

    init() {
        _selectedScreen = State(initialValue: Self.launchScreen)
    }

    var body: some View {
        Group {
            if Self.isAnimeDirectionPrototype {
                FocumiAnimeDirectionPrototype(initialVariant: Self.launchAnimeVariant)
            } else {
            if Self.isAccessibilityReview {
                AccessibilityReviewScreen(screen: selectedScreen, companion: selectedCompanion)
                    .safeAreaInset(edge: .top, spacing: 0) {
                        DesignLabHeader(selectedScreen: $selectedScreen, compact: true)
                    }
                    .dynamicTypeSize(.accessibility5)
            } else {
                TabView(selection: $selectedScreen) {
                    CompanionSelectionScreen(selectedCompanion: $selectedCompanion).tag(DesignScreen.selection)
                    RoomScreen(companion: selectedCompanion).tag(DesignScreen.room)
                    FocusScreen(companion: selectedCompanion).tag(DesignScreen.focus)
                    WaitingScreen(companion: selectedCompanion).tag(DesignScreen.waiting)
                    CompletionScreen(companion: selectedCompanion).tag(DesignScreen.completion)
                    HistoryScreen(companion: selectedCompanion).tag(DesignScreen.history)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .safeAreaInset(edge: .top, spacing: 0) {
                    DesignLabHeader(selectedScreen: $selectedScreen, compact: false)
                }
                .safeAreaInset(edge: .bottom, spacing: 0) {
                    DesignLabRail(selectedScreen: $selectedScreen)
                }
                .dynamicTypeSize(.large)
            }
            }
        }
        .background(DesignToken.canvas.ignoresSafeArea())
        .tint(DesignToken.terracotta)
        .preferredColorScheme(.light)
    }

    private static var launchScreen: DesignScreen {
        let argument = ProcessInfo.processInfo.arguments.first { $0.hasPrefix("--focumi-design-screen=") }
        let value = argument?.replacingOccurrences(of: "--focumi-design-screen=", with: "")
        return DesignScreen(launchValue: value) ?? .selection
    }

    private static var isAccessibilityReview: Bool {
        ProcessInfo.processInfo.arguments.contains("--focumi-design-axxxl")
    }

    private static var isAnimeDirectionPrototype: Bool {
        ProcessInfo.processInfo.arguments.contains("--focumi-anime-prototype")
    }

    private static var launchAnimeVariant: AnimeDirectionVariant {
        let argument = ProcessInfo.processInfo.arguments.first { $0.hasPrefix("--focumi-anime-variant=") }
        let value = argument?.replacingOccurrences(of: "--focumi-anime-variant=", with: "")
        return AnimeDirectionVariant(launchValue: value) ?? .healing
    }
}

private enum DesignScreen: String, CaseIterable, Identifiable {
    case selection = "伙伴"
    case room = "房间"
    case focus = "专注"
    case waiting = "休息"
    case completion = "完成"
    case history = "回顾"

    var id: String { rawValue }

    init?(launchValue: String?) {
        switch launchValue {
        case "selection": self = .selection
        case "room": self = .room
        case "focus": self = .focus
        case "waiting": self = .waiting
        case "completion": self = .completion
        case "history": self = .history
        default: return nil
        }
    }
}

private enum Companion: String, CaseIterable, Identifiable {
    case milo = "Milo"
    case max = "Max"

    var id: String { rawValue }
    var idleAsset: String { self == .milo ? "MiloIdle01" : "MaxIdle01" }
    var focusAsset: String { self == .milo ? "MiloFocus01" : "MaxFocus01" }
    var celebrationAsset: String { self == .milo ? "MiloCelebrate01" : "MaxCelebrate01" }
    var tint: Color { self == .milo ? DesignToken.sage : DesignToken.mistBlue }
    var nookDetail: String { self == .milo ? "窗边书与鼠尾草" : "地毯、球与一盏灯" }
}

private enum SceneMood {
    case morning, focused, waiting, completion, archive

    var sky: [Color] {
        switch self {
        case .morning: [DesignToken.dawn, DesignToken.canvas]
        case .focused: [DesignToken.warmShade, DesignToken.canvas]
        case .waiting: [DesignToken.lilacMist, DesignToken.canvas]
        case .completion: [DesignToken.peachLight, DesignToken.canvas]
        case .archive: [DesignToken.paper, DesignToken.canvas]
        }
    }
}

private enum DesignToken {
    static let canvas = Color(red: 0.97, green: 0.94, blue: 0.86)
    static let paper = Color(red: 0.99, green: 0.975, blue: 0.92)
    static let dawn = Color(red: 0.98, green: 0.88, blue: 0.72)
    static let warmShade = Color(red: 0.89, green: 0.79, blue: 0.64)
    static let lilacMist = Color(red: 0.84, green: 0.82, blue: 0.80)
    static let peachLight = Color(red: 0.98, green: 0.82, blue: 0.68)
    static let ink = Color(red: 0.22, green: 0.17, blue: 0.13)
    static let secondaryInk = Color(red: 0.38, green: 0.32, blue: 0.25)
    static let sage = Color(red: 0.38, green: 0.54, blue: 0.42)
    static let mistBlue = Color(red: 0.39, green: 0.54, blue: 0.62)
    static let terracotta = Color(red: 0.70, green: 0.31, blue: 0.23)
    static let wood = Color(red: 0.53, green: 0.34, blue: 0.20)
    static let line = Color(red: 0.30, green: 0.22, blue: 0.15).opacity(0.14)
    static let radius: CGFloat = 24
}

private struct DesignLabHeader: View {
    @Binding var selectedScreen: DesignScreen
    let compact: Bool

    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 1) {
                Text("Focumi")
                    .font(compact ? .body.weight(.semibold) : .headline.weight(.semibold))
                if !compact {
                    Text("空间设计原型")
                        .font(.caption2)
                        .foregroundStyle(DesignToken.secondaryInk)
                }
            }
            Spacer()
            Menu {
                Picker("评审页面", selection: $selectedScreen) {
                    ForEach(DesignScreen.allCases) { screen in
                        Text(screen.rawValue).tag(screen)
                    }
                }
            } label: {
                Image(systemName: "square.grid.2x2")
                    .font(.body.weight(.semibold))
                    .frame(minWidth: 44, minHeight: 44)
            }
            .accessibilityLabel("选择设计原型页面")
        }
        .foregroundStyle(DesignToken.ink)
        .padding(.horizontal, 22)
        .padding(.vertical, compact ? 4 : 8)
        .background(.ultraThinMaterial.opacity(0.72))
        // The debug review header is navigation chrome, not primary content.
        // Keep it compact while the page itself honors AXXXL.
        .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
    }
}

/// Review-only navigation: intentionally quiet, always within the safe area.
private struct DesignLabRail: View {
    @Binding var selectedScreen: DesignScreen

    var body: some View {
        HStack(spacing: 2) {
            ForEach(DesignScreen.allCases) { screen in
                Button {
                    selectedScreen = screen
                } label: {
                    Text(screen.rawValue)
                        .font(.caption2.weight(screen == selectedScreen ? .bold : .regular))
                        .lineLimit(1)
                        .minimumScaleFactor(0.75)
                        .frame(maxWidth: .infinity, minHeight: 44)
                        .foregroundStyle(screen == selectedScreen ? DesignToken.ink : DesignToken.secondaryInk.opacity(0.72))
                        .background(screen == selectedScreen ? DesignToken.paper.opacity(0.84) : .clear, in: Capsule())
                }
                .accessibilityLabel("查看\(screen.rawValue)页面")
                .accessibilityAddTraits(screen == selectedScreen ? .isSelected : [])
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 5)
        .background(.ultraThinMaterial.opacity(0.82))
        .overlay(alignment: .top) { Rectangle().fill(DesignToken.line).frame(height: 1) }
    }
}

private struct ScenePage<Content: View>: View {
    let mood: SceneMood
    @ViewBuilder let content: Content

    var body: some View {
        ScrollView {
            content
                .padding(.horizontal, 22)
                .padding(.vertical, 22)
                .frame(maxWidth: 680, alignment: .leading)
        }
        .scrollIndicators(.hidden)
        .background(RoomBackdrop(mood: mood))
    }
}

/// AXXXL review uses the same content hierarchy but reserves a persistent action
/// dock. Decorative context becomes supporting content instead of competing with
/// the primary control at large Dynamic Type sizes.
private struct AccessibilityReviewScreen: View {
    let screen: DesignScreen
    let companion: Companion

    private var title: String {
        switch screen {
        case .selection: "选择今天的伙伴"
        case .room: "今天，先把这一件事放在桌上"
        case .focus: "和 \(companion.rawValue) 一起专注"
        case .waiting: "灯还亮着，\(companion.rawValue) 在等"
        case .completion: "这一小段，已经完成"
        case .history: "回来的日子，被夹进这一周"
        }
    }

    private var detail: String {
        switch screen {
        case .selection: "Milo 靠窗读书，Max 在地毯边等你。"
        case .room: "整理产品评审稿，25 分钟。"
        case .focus: "剩余 18 分 42 秒。"
        case .waiting: "喝口水，再回到这一页。"
        case .completion: "Milo 留下一枚小小的足迹。"
        case .history: "本周已经留下 3 次陪伴。"
        }
    }

    private var actionTitle: String {
        switch screen {
        case .selection: "选择 \(companion.rawValue)"
        case .room: "开始一起专注"
        case .focus: "暂停并休息"
        case .waiting: "回去一起专注"
        case .completion: "回到房间"
        case .history: "查看今天的房间"
        }
    }

    var body: some View {
        ZStack {
            RoomBackdrop(mood: mood)
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text(screen.rawValue)
                        .font(.headline.weight(.semibold))
                        .foregroundStyle(DesignToken.terracotta)
                    Text(title)
                        .font(.title2.weight(.bold))
                        .fixedSize(horizontal: false, vertical: true)
                    Text(detail)
                        .font(.body)
                        .foregroundStyle(DesignToken.secondaryInk)
                        .fixedSize(horizontal: false, vertical: true)

                    ZStack(alignment: .bottom) {
                        RoundedRectangle(cornerRadius: DesignToken.radius)
                            .fill(DesignToken.paper.opacity(0.82))
                        WindowLight(mood: mood)
                            .frame(width: 150, height: 108)
                            .opacity(0.50)
                        CompanionImage(asset: screen == .completion ? companion.celebrationAsset : companion.idleAsset, size: 184)
                        Capsule().fill(DesignToken.wood.opacity(0.28)).frame(width: 138, height: 12).offset(y: 7)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 220)

                    Text("环境仍保留窗光、木地板与植物；在更大文字下，它们退到内容之后。")
                        .font(.footnote)
                        .foregroundStyle(DesignToken.secondaryInk)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(22)
                .padding(.bottom, 88)
            }
            .scrollIndicators(.hidden)
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            PrimaryButton(title: actionTitle, symbol: "play.fill") { }
                .padding(.horizontal, 22)
                .padding(.vertical, 8)
                .background(.ultraThinMaterial.opacity(0.86))
        }
        .accessibilityElement(children: .contain)
    }

    private var mood: SceneMood {
        switch screen {
        case .room, .selection: .morning
        case .focus: .focused
        case .waiting: .waiting
        case .completion: .completion
        case .history: .archive
        }
    }
}

private struct RoomBackdrop: View {
    let mood: SceneMood

    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom) {
                LinearGradient(colors: mood.sky, startPoint: .top, endPoint: .bottom)

                PaperGrain()
                    .opacity(0.65)

                WindowLight(mood: mood)
                    .frame(width: min(proxy.size.width * 0.54, 230), height: 170)
                    .position(x: proxy.size.width * 0.75, y: 150)
                    .opacity(0.56)

                Curtain(side: .leading)
                    .frame(width: 84, height: 280)
                    .position(x: 28, y: 170)
                    .opacity(0.55)

                Curtain(side: .trailing)
                    .frame(width: 66, height: 245)
                    .position(x: proxy.size.width - 20, y: 160)
                    .opacity(0.38)

                HStack(alignment: .bottom) {
                    PlantCorner()
                    Spacer()
                    LampGlow(mood: mood)
                }
                .padding(.horizontal, 22)
                .padding(.bottom, 88)

                WoodFloor()
                    .frame(height: 112)
            }
        }
        .ignoresSafeArea()
        .accessibilityHidden(true)
    }
}

private struct WindowLight: View {
    let mood: SceneMood

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(LinearGradient(colors: mood.sky, startPoint: .top, endPoint: .bottom))
            .overlay {
                Circle()
                    .fill(.yellow.opacity(mood == .focused ? 0.32 : 0.56))
                    .frame(width: 42, height: 42)
                    .blur(radius: 5)
                    .offset(x: 32, y: -25)
            }
            .overlay {
                Path { path in
                    path.move(to: CGPoint(x: 0.5, y: 0))
                    path.addLine(to: CGPoint(x: 0.5, y: 1))
                    path.move(to: CGPoint(x: 0, y: 0.47))
                    path.addLine(to: CGPoint(x: 1, y: 0.47))
                }
                .stroke(DesignToken.wood.opacity(0.32), lineWidth: 3)
            }
            .overlay { RoundedRectangle(cornerRadius: 8).stroke(DesignToken.wood.opacity(0.34), lineWidth: 5) }
    }
}

private enum CurtainSide { case leading, trailing }

private struct Curtain: View {
    let side: CurtainSide

    var body: some View {
        UnevenRoundedRectangle(
            topLeadingRadius: side == .leading ? 12 : 44,
            bottomLeadingRadius: 18,
            bottomTrailingRadius: 18,
            topTrailingRadius: side == .trailing ? 12 : 44
        )
        .fill(LinearGradient(colors: [DesignToken.terracotta.opacity(0.46), DesignToken.terracotta.opacity(0.12)], startPoint: .top, endPoint: .bottom))
    }
}

private struct WoodFloor: View {
    var body: some View {
        Rectangle()
            .fill(LinearGradient(colors: [DesignToken.wood.opacity(0.72), DesignToken.wood.opacity(0.94)], startPoint: .top, endPoint: .bottom))
            .overlay(alignment: .top) {
                Rectangle().fill(.white.opacity(0.18)).frame(height: 2)
            }
            .overlay {
                VStack(spacing: 20) {
                    Rectangle().fill(.black.opacity(0.10)).frame(height: 1)
                    Rectangle().fill(.black.opacity(0.08)).frame(height: 1)
                }
            }
    }
}

private struct PlantCorner: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            RoundedRectangle(cornerRadius: 8).fill(DesignToken.terracotta.opacity(0.72)).frame(width: 30, height: 34)
            HStack(spacing: -7) {
                Leaf(rotation: -35)
                Leaf(rotation: 5)
                Leaf(rotation: 35)
            }
            .offset(y: -22)
        }
    }
}

private struct Leaf: View {
    let rotation: Double

    var body: some View {
        Ellipse()
            .fill(DesignToken.sage.opacity(0.82))
            .frame(width: 16, height: 34)
            .rotationEffect(.degrees(rotation))
    }
}

private struct LampGlow: View {
    let mood: SceneMood

    var body: some View {
        ZStack(alignment: .bottom) {
            Circle().fill(.yellow.opacity(mood == .waiting ? 0.18 : 0.34)).frame(width: 74).blur(radius: 12)
            Capsule().fill(DesignToken.terracotta.opacity(0.7)).frame(width: 6, height: 36)
            Trapezoid().fill(DesignToken.paper.opacity(0.86)).frame(width: 42, height: 28).offset(y: -26)
        }
    }
}

private struct Trapezoid: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX + rect.width * 0.2, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + rect.width * 0.8, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
            path.closeSubpath()
        }
    }
}

private struct PaperGrain: View {
    var body: some View {
        Canvas { context, size in
            for column in stride(from: 12, through: Int(size.width), by: 24) {
                for row in stride(from: 14, through: Int(size.height), by: 27) {
                    let rect = CGRect(x: CGFloat(column), y: CGFloat(row), width: 1.2, height: 1.2)
                    context.fill(Path(ellipseIn: rect), with: .color(DesignToken.ink.opacity(0.045)))
                }
            }
        }
    }
}

private struct CompanionSelectionScreen: View {
    @Binding var selectedCompanion: Companion

    var body: some View {
        ScenePage(mood: .morning) {
            VStack(alignment: .leading, spacing: 18) {
                PageTitle(eyebrow: "推开门", title: "选一位住在这里的伙伴", detail: "它们各有一个小角落；从今天起，也会为你留一盏灯。")

                HStack(alignment: .top, spacing: 12) {
                    ForEach(Companion.allCases) { companion in
                        NookChoice(companion: companion, isSelected: selectedCompanion == companion) {
                            selectedCompanion = companion
                        }
                    }
                }

                PrimaryButton(title: "走进 \(selectedCompanion.rawValue) 的房间", symbol: "door.left.hand.open") { }
                    .accessibilityHint("设计原型中的示例操作，不会创建真实伙伴")
            }
        }
    }
}

private struct NookChoice: View {
    let companion: Companion
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 9) {
                ZStack(alignment: .bottom) {
                    RoundedRectangle(cornerRadius: 18)
                        .fill(LinearGradient(colors: [companion.tint.opacity(0.34), DesignToken.paper.opacity(0.9)], startPoint: .top, endPoint: .bottom))
                    MiniWindow().padding(.top, 13).offset(y: -20)
                    CompanionImage(asset: companion.idleAsset, size: 128)
                    Capsule().fill(DesignToken.wood.opacity(0.20)).frame(width: 96, height: 10).offset(y: 5)
                }
                .frame(height: 174)
                Text(companion.rawValue).font(.headline)
                Text(companion.nookDetail).font(.caption).foregroundStyle(DesignToken.secondaryInk)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(10)
            .background(DesignToken.paper.opacity(0.72), in: RoundedRectangle(cornerRadius: 20))
            .overlay { RoundedRectangle(cornerRadius: 20).stroke(isSelected ? companion.tint : DesignToken.line, lineWidth: isSelected ? 3 : 1) }
        }
        .buttonStyle(.plain)
        .accessibilityLabel("\(companion.rawValue) 的小角落，\(companion.nookDetail)")
        .accessibilityValue(isSelected ? "已选择" : "未选择")
        .accessibilityAddTraits(isSelected ? .isSelected : [])
    }
}

private struct MiniWindow: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 6)
            .fill(DesignToken.dawn.opacity(0.70))
            .frame(width: 72, height: 78)
            .overlay { Rectangle().fill(DesignToken.wood.opacity(0.22)).frame(width: 2) }
            .overlay { Rectangle().fill(DesignToken.wood.opacity(0.22)).frame(height: 2) }
    }
}

private struct RoomScreen: View {
    let companion: Companion

    var body: some View {
        ScenePage(mood: .morning) {
            VStack(alignment: .leading, spacing: 18) {
                PageTitle(eyebrow: "晨光房间", title: "今天，先把这一件事放在桌上", detail: "\(companion.rawValue) 已经在窗边为你让出位置。")
                RoomAnchorScene(companion: companion, mood: .morning)
                TaskSheet(goal: "整理产品评审稿", duration: "25 分钟")
                PrimaryButton(title: "开始一起专注", symbol: "play.fill") { }
            }
        }
    }
}

private struct FocusScreen: View {
    let companion: Companion

    var body: some View {
        ScenePage(mood: .focused) {
            VStack(spacing: 18) {
                Text("窗帘拉上了一点，房间安静下来。")
                    .font(.caption.weight(.medium))
                    .foregroundStyle(DesignToken.secondaryInk)
                    .frame(maxWidth: .infinity, alignment: .leading)
                RoomAnchorScene(companion: companion, mood: .focused, asset: companion.focusAsset)
                VStack(spacing: 5) {
                    Text("整理产品评审稿").font(.title3.weight(.semibold))
                    Text("18:42").font(.system(.largeTitle, design: .rounded).weight(.medium)).monospacedDigit()
                    Text("专注正在进行").font(.subheadline).foregroundStyle(DesignToken.secondaryInk)
                }
                .accessibilityElement(children: .combine)
                .accessibilityLabel("整理产品评审稿，剩余 18 分 42 秒，专注正在进行")
                QuietButton(title: "结束本次专注") { }
            }
        }
    }
}

private struct WaitingScreen: View {
    let companion: Companion

    var body: some View {
        ScenePage(mood: .waiting) {
            VStack(alignment: .leading, spacing: 18) {
                PageTitle(eyebrow: "短暂离席", title: "灯还亮着，\(companion.rawValue) 在等", detail: "不是中断，也不是失败。喝口水，再回来继续这一页。")
                RoomAnchorScene(companion: companion, mood: .waiting)
                HStack(spacing: 12) {
                    Image(systemName: "cup.and.saucer.fill").foregroundStyle(DesignToken.terracotta)
                    VStack(alignment: .leading, spacing: 2) {
                        Text("整理产品评审稿").font(.headline)
                        Text("剩余 18 分 42 秒").font(.subheadline).foregroundStyle(DesignToken.secondaryInk)
                    }
                }
                .padding(14)
                .background(DesignToken.paper.opacity(0.70), in: RoundedRectangle(cornerRadius: 18))
                PrimaryButton(title: "回去一起专注", symbol: "arrow.uturn.backward") { }
            }
        }
    }
}

private struct CompletionScreen: View {
    let companion: Companion

    var body: some View {
        ScenePage(mood: .completion) {
            VStack(spacing: 18) {
                PageTitle(eyebrow: "收好这一页", title: "这段时间完成了", detail: "桌上的纸被轻轻压好，明天也可以从这里继续。")
                RoomAnchorScene(companion: companion, mood: .completion, asset: companion.celebrationAsset)
                CompletionNote(goal: "整理产品评审稿", companion: companion)
                PrimaryButton(title: "再开始一件事", symbol: "plus") { }
                QuietButton(title: "看看这周") { }
            }
        }
    }
}

private struct HistoryScreen: View {
    let companion: Companion

    var body: some View {
        ScenePage(mood: .archive) {
            VStack(alignment: .leading, spacing: 18) {
                PageTitle(eyebrow: "时间痕迹", title: "回来的日子，被夹进这一周", detail: "不比较，不排名；只是留住你们一起坐下来的几个傍晚。")
                CalendarPaperTrail()
                FootprintEntry(day: "今天", title: "整理产品评审稿", detail: "25 分钟")
                FootprintEntry(day: "昨天", title: "阅读研究笔记", detail: "40 分钟")
                HStack(spacing: 10) {
                    Image(systemName: "heart.fill").foregroundStyle(companion.tint)
                    Text("\(companion.rawValue) 已陪你坐下 3 次")
                        .font(.subheadline.weight(.medium))
                        .foregroundStyle(DesignToken.secondaryInk)
                }
                .padding(.top, 4)
            }
        }
    }
}

private struct RoomAnchorScene: View {
    let companion: Companion
    let mood: SceneMood
    var asset: String?

    var body: some View {
        ZStack(alignment: .bottom) {
            RoundedRectangle(cornerRadius: DesignToken.radius)
                .fill(LinearGradient(colors: mood.sky, startPoint: .topLeading, endPoint: .bottomTrailing))
            WindowLight(mood: mood)
                .frame(width: 140, height: 122)
                .offset(x: 62, y: -66)
            Curtain(side: .leading)
                .frame(width: 58, height: 158)
                .frame(maxWidth: .infinity, alignment: .leading)
                .offset(y: -40)
            PlantCorner()
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 18)
                .offset(y: -36)
            Rectangle().fill(DesignToken.wood.opacity(0.84)).frame(height: 50)
            RoundedRectangle(cornerRadius: 16).fill(DesignToken.paper.opacity(0.86)).frame(width: 145, height: 38).offset(x: 55, y: -27)
            CompanionImage(asset: asset ?? companion.idleAsset, size: 220)
                .offset(x: -25, y: -14)
            Capsule().fill(.black.opacity(0.12)).frame(width: 155, height: 12).offset(x: -25, y: -2)
        }
        .frame(height: 276)
        .clipShape(RoundedRectangle(cornerRadius: DesignToken.radius))
        .overlay { RoundedRectangle(cornerRadius: DesignToken.radius).stroke(DesignToken.wood.opacity(0.18), lineWidth: 1) }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(companion.rawValue) 在有窗光、木桌和植物的房间里")
    }
}

private struct TaskSheet: View {
    let goal: String
    let duration: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("写在桌上的这一件事").font(.caption.weight(.bold)).foregroundStyle(DesignToken.terracotta)
            Text(goal).font(.title3.weight(.semibold))
            HStack {
                Label(duration, systemImage: "timer")
                Spacer()
                Text("可调整").foregroundStyle(DesignToken.secondaryInk)
            }
            .font(.subheadline)
        }
        .padding(17)
        .background(DesignToken.paper.opacity(0.90), in: RoundedRectangle(cornerRadius: 18))
        .overlay(alignment: .bottomLeading) {
            Path { path in
                path.move(to: CGPoint(x: 18, y: 0))
                path.addCurve(to: CGPoint(x: 80, y: 0), control1: CGPoint(x: 35, y: 6), control2: CGPoint(x: 60, y: -5))
            }
            .stroke(DesignToken.terracotta.opacity(0.46), style: StrokeStyle(lineWidth: 2, lineCap: .round))
            .offset(y: 8)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("本次目标：\(goal)，时长 \(duration)，可调整")
    }
}

private struct CompletionNote: View {
    let goal: String
    let companion: Companion

    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: "checkmark").font(.headline.weight(.bold)).foregroundStyle(DesignToken.terracotta)
            Text(goal).font(.headline)
            Text("25 分钟 · 和 \(companion.rawValue) 一起").font(.subheadline).foregroundStyle(DesignToken.secondaryInk)
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .background(DesignToken.paper.opacity(0.88), in: RoundedRectangle(cornerRadius: 18))
        .rotationEffect(.degrees(-0.7))
        .accessibilityElement(children: .combine)
    }
}

private struct CalendarPaperTrail: View {
    private let days = [
        DayMark(label: "一", complete: false), DayMark(label: "二", complete: true), DayMark(label: "三", complete: false),
        DayMark(label: "四", complete: true), DayMark(label: "五", complete: true), DayMark(label: "六", complete: false), DayMark(label: "日", complete: false),
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("八月的这一页").font(.headline)
            HStack(spacing: 7) {
                ForEach(days) { day in
                    VStack(spacing: 7) {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(day.complete ? DesignToken.sage.opacity(0.82) : DesignToken.canvas)
                            .frame(height: 34)
                            .overlay {
                                if day.complete { Image(systemName: "pawprint.fill").font(.caption2).foregroundStyle(.white).accessibilityHidden(true) }
                            }
                        Text(day.label).font(.caption2).foregroundStyle(DesignToken.secondaryInk)
                    }
                    .frame(maxWidth: .infinity)
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel("星期\(day.label)，\(day.complete ? "留下专注足迹" : "无记录")")
                }
            }
        }
        .padding(17)
        .background(DesignToken.paper.opacity(0.90), in: RoundedRectangle(cornerRadius: 20))
        .overlay(alignment: .topTrailing) {
            Image(systemName: "paperclip").foregroundStyle(DesignToken.wood.opacity(0.6)).rotationEffect(.degrees(25)).padding(10).accessibilityHidden(true)
        }
        .accessibilityElement(children: .contain)
        .accessibilityLabel("本周日历纸")
    }
}

private struct DayMark: Identifiable {
    let label: String
    let complete: Bool
    var id: String { label }
}

private struct FootprintEntry: View {
    let day: String
    let title: String
    let detail: String

    var body: some View {
        HStack(alignment: .top, spacing: 13) {
            VStack(spacing: 3) {
                Image(systemName: "pawprint.fill").foregroundStyle(DesignToken.sage).font(.subheadline)
                Rectangle().fill(DesignToken.sage.opacity(0.30)).frame(width: 1, height: 32)
            }
            VStack(alignment: .leading, spacing: 3) {
                Text(day).font(.caption.weight(.bold)).foregroundStyle(DesignToken.terracotta)
                Text(title).font(.headline)
                Text(detail).font(.subheadline).foregroundStyle(DesignToken.secondaryInk)
            }
        }
        .padding(.leading, 10)
        .accessibilityElement(children: .combine)
    }
}

private struct PageTitle: View {
    let eyebrow: String
    let title: String
    let detail: String

    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            Text(eyebrow)
                .font(.caption.weight(.bold))
                .foregroundStyle(DesignToken.terracotta)
            Text(title)
                .font(.title2.weight(.semibold))
                .foregroundStyle(DesignToken.ink)
                .fixedSize(horizontal: false, vertical: true)
            Text(detail)
                .font(.body)
                .foregroundStyle(DesignToken.secondaryInk)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

private struct CompanionImage: View {
    let asset: String
    let size: CGFloat

    var body: some View {
        Image(asset)
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            .accessibilityHidden(true)
    }
}

private struct PrimaryButton: View {
    let title: String
    let symbol: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Label(title, systemImage: symbol)
                .font(.body.weight(.semibold))
                .frame(maxWidth: .infinity, minHeight: 52)
        }
        .foregroundStyle(.white)
        .background(DesignToken.terracotta, in: Capsule())
    }
}

private struct QuietButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(title, action: action)
            .font(.body.weight(.semibold))
            .frame(maxWidth: .infinity, minHeight: 52)
            .foregroundStyle(DesignToken.ink)
            .background(DesignToken.paper.opacity(0.78), in: Capsule())
            .overlay { Capsule().stroke(DesignToken.wood.opacity(0.22), lineWidth: 1) }
    }
}

// MARK: - THROWAWAY: Anime direction prototype
//
// Question: which anime language should Focumi's Home / Room use?
// Three variants, selected by --focumi-anime-variant=A|B|C or the review dock.
// This is static DEBUG-only visual exploration; it must not be promoted as UI.

private enum AnimeDirectionVariant: String, CaseIterable, Identifiable {
    case healing = "A"
    case shojo = "B"
    case game = "C"

    var id: String { rawValue }

    var name: String {
        switch self {
        case .healing: "日系治愈番"
        case .shojo: "少女漫画编辑感"
        case .game: "动漫游戏主界面"
        }
    }

    var direction: String {
        switch self {
        case .healing: "生活空间先说话，角色住在光里。"
        case .shojo: "把一天拆成情绪分镜，再把专注变成这一话。"
        case .game: "让陪伴像一张可进入的主视觉，而不是一张卡片。"
        }
    }

    init?(launchValue: String?) {
        switch launchValue?.uppercased() {
        case "A": self = .healing
        case "B": self = .shojo
        case "C": self = .game
        default: return nil
        }
    }

    func next() -> Self {
        let variants = Self.allCases
        let index = variants.firstIndex(of: self) ?? 0
        return variants[(index + 1) % variants.count]
    }

    func previous() -> Self {
        let variants = Self.allCases
        let index = variants.firstIndex(of: self) ?? 0
        return variants[(index + variants.count - 1) % variants.count]
    }
}

private struct FocumiAnimeDirectionPrototype: View {
    @State private var variant: AnimeDirectionVariant

    init(initialVariant: AnimeDirectionVariant) {
        _variant = State(initialValue: initialVariant)
    }

    var body: some View {
        ZStack {
            switch variant {
            case .healing:
                AnimeHealingRoom()
            case .shojo:
                AnimeShojoRoom()
            case .game:
                AnimeGameRoom()
            }
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            AnimePrototypeSwitcher(variant: $variant)
        }
        .preferredColorScheme(variant == .game ? .dark : .light)
        .accessibilityElement(children: .contain)
    }
}

private struct AnimePrototypeSwitcher: View {
    @Binding var variant: AnimeDirectionVariant

    var body: some View {
        VStack(spacing: 7) {
            Text("THROWAWAY · Home / Room visual direction only")
                .font(.caption2.weight(.bold))
                .tracking(0.9)
                .foregroundStyle(.secondary)

            HStack(spacing: 8) {
                Button {
                    variant = variant.previous()
                } label: {
                    Image(systemName: "chevron.left")
                        .frame(width: 44, height: 44)
                }
                .accessibilityLabel("上一个动漫方向")

                ForEach(AnimeDirectionVariant.allCases) { option in
                    Button {
                        variant = option
                    } label: {
                        Text("\(option.rawValue)  \(option.name)")
                            .font(.caption.weight(option == variant ? .bold : .medium))
                            .lineLimit(1)
                            .minimumScaleFactor(0.78)
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .padding(.horizontal, 5)
                            .foregroundStyle(option == variant ? .white : .primary)
                            .background(option == variant ? Color.black.opacity(0.78) : Color.white.opacity(0.66), in: Capsule())
                    }
                    .accessibilityLabel("方向 \(option.rawValue)：\(option.name)")
                    .accessibilityAddTraits(option == variant ? .isSelected : [])
                }

                Button {
                    variant = variant.next()
                } label: {
                    Image(systemName: "chevron.right")
                        .frame(width: 44, height: 44)
                }
                .accessibilityLabel("下一个动漫方向")
            }
        }
        .padding(.horizontal, 12)
        .padding(.top, 8)
        .padding(.bottom, 6)
        .background(.regularMaterial)
        .overlay(alignment: .top) { Rectangle().fill(.black.opacity(0.12)).frame(height: 1) }
    }
}

private struct AnimePrototypeCaption: View {
    let variant: AnimeDirectionVariant
    let dark: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text("方向 \(variant.rawValue) · \(variant.name)")
                .font(.caption.weight(.bold))
                .tracking(0.5)
            Text(variant.direction)
                .font(.caption2)
                .fixedSize(horizontal: false, vertical: true)
        }
        .foregroundStyle(dark ? .white.opacity(0.82) : .black.opacity(0.65))
        .padding(.horizontal, 14)
        .padding(.vertical, 9)
        .background(dark ? .white.opacity(0.10) : .white.opacity(0.62), in: RoundedRectangle(cornerRadius: 13))
    }
}

private struct AnimeAssetWarning: View {
    let dark: Bool

    var body: some View {
        Label("角色为现有 3D 临时占位；未重绘为 2D 前，不能宣称动漫感已成立。", systemImage: "exclamationmark.triangle.fill")
            .font(.caption2.weight(.medium))
            .fixedSize(horizontal: false, vertical: true)
            .foregroundStyle(dark ? Color.white.opacity(0.86) : Color.black.opacity(0.68))
            .padding(.horizontal, 11)
            .padding(.vertical, 8)
            .background(dark ? Color.black.opacity(0.35) : Color.white.opacity(0.68), in: RoundedRectangle(cornerRadius: 12))
            .accessibilityLabel("资产限制：角色仍是三维临时占位，尚未完成二维动漫角色资产")
    }
}

// A — an ordinary room rendered as a single quiet shot. Information is deliberately
// subordinate to atmosphere; the primary action lives in the window-seat scene.
private struct AnimeHealingRoom: View {
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .top) {
                LinearGradient(
                    colors: [Color(red: 0.99, green: 0.91, blue: 0.75), Color(red: 0.86, green: 0.91, blue: 0.87), Color(red: 0.97, green: 0.82, blue: 0.67)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                HealingRoomIllustration()
                    .frame(width: proxy.size.width, height: proxy.size.height * 0.72)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .offset(y: -210)
                    .accessibilityHidden(true)

                ScrollView {
                    VStack(alignment: .leading, spacing: 13) {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 2) {
                                Text("FOCUMI")
                                    .font(.caption.weight(.bold))
                                    .tracking(2.8)
                                Text("早安，Milo")
                                    .font(.title2.weight(.bold))
                            }
                            Spacer()
                            Text("周三 · 08:42")
                                .font(.caption.weight(.semibold))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 7)
                                .background(.white.opacity(0.54), in: Capsule())
                        }
                        .foregroundStyle(Color(red: 0.19, green: 0.20, blue: 0.19))

                        AnimePrototypeCaption(variant: .healing, dark: false)
                            .frame(maxWidth: 270)

                        Spacer(minLength: proxy.size.height * 0.31)

                        VStack(alignment: .leading, spacing: 8) {
                            Text("窗边的 25 分钟")
                                .font(.title3.weight(.bold))
                            Text("把产品评审稿收成一个小段落。Milo 已经把书翻到这一页。")
                                .font(.subheadline)
                                .foregroundStyle(.black.opacity(0.64))
                                .fixedSize(horizontal: false, vertical: true)
                            Button { } label: {
                                Label("和 Milo 一起开始", systemImage: "play.fill")
                                    .font(.body.weight(.bold))
                                    .frame(maxWidth: .infinity, minHeight: 54)
                            }
                            .foregroundStyle(.white)
                            .background(Color(red: 0.24, green: 0.36, blue: 0.30), in: Capsule())
                            .accessibilityHint("原型操作，不会启动真实专注")
                        }
                        .padding(17)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 24))

                        AnimeAssetWarning(dark: false)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 16)
                    .padding(.bottom, 128)
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

private struct HealingRoomIllustration: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            // Hand-drawn room proportions, sunlit floor, and a character integrated
            // with the environment rather than isolated as a product mascot.
            RoundedRectangle(cornerRadius: 46)
                .fill(Color(red: 0.90, green: 0.73, blue: 0.52).opacity(0.42))
                .frame(width: 390, height: 180)
                .offset(y: 55)

            Rectangle()
                .fill(Color(red: 0.63, green: 0.42, blue: 0.26).opacity(0.62))
                .frame(height: 106)
                .overlay {
                    VStack(spacing: 21) {
                        Rectangle().fill(.white.opacity(0.16)).frame(height: 1)
                        Rectangle().fill(.black.opacity(0.10)).frame(height: 1)
                    }
                }

            RoundedRectangle(cornerRadius: 7)
                .fill(LinearGradient(colors: [.white.opacity(0.88), Color(red: 0.77, green: 0.90, blue: 0.95)], startPoint: .top, endPoint: .bottom))
                .frame(width: 188, height: 156)
                .overlay {
                    HealingWindowPanes().stroke(Color(red: 0.45, green: 0.32, blue: 0.23).opacity(0.56), lineWidth: 5)
                }
                .overlay(alignment: .bottomTrailing) {
                    Circle().fill(Color.yellow.opacity(0.58)).frame(width: 34, height: 34).blur(radius: 3).offset(x: -20, y: -39)
                }
                .offset(x: 70, y: -70)

            Capsule()
                .fill(Color(red: 0.20, green: 0.31, blue: 0.24).opacity(0.86))
                .frame(width: 176, height: 12)
                .offset(x: -35, y: -54)

            CompanionImage(asset: "MiloIdle01", size: 238)
                .offset(x: -36, y: -78)

            HStack(spacing: -8) {
                HealingLeaf(angle: -26)
                HealingLeaf(angle: 3)
                HealingLeaf(angle: 29)
            }
            .offset(x: -142, y: -82)

            RoundedRectangle(cornerRadius: 7)
                .fill(Color(red: 0.61, green: 0.25, blue: 0.17))
                .frame(width: 36, height: 33)
                .offset(x: -142, y: -47)
        }
    }
}

private struct HealingWindowPanes: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.move(to: CGPoint(x: rect.minX, y: rect.height * 0.44))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.height * 0.44))
        }
    }
}

private struct HealingLeaf: View {
    let angle: Double

    var body: some View {
        Ellipse()
            .fill(Color(red: 0.20, green: 0.40, blue: 0.25))
            .frame(width: 24, height: 56)
            .rotationEffect(.degrees(angle))
    }
}

// B — not a room in perspective. The day becomes an editorial page with decisive
// panels, paper texture, big hand-written-ish hierarchy, and an episode affordance.
private struct AnimeShojoRoom: View {
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color(red: 1.0, green: 0.97, blue: 0.91).ignoresSafeArea()
                ShojoHalftone().opacity(0.72).ignoresSafeArea().accessibilityHidden(true)

                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text("FOCUMI DIARY")
                                .font(.caption.weight(.black))
                                .tracking(1.7)
                            Spacer()
                            Text("第 24 话")
                                .font(.caption.weight(.bold))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 6)
                                .overlay { Capsule().stroke(.black.opacity(0.72), lineWidth: 1.4) }
                        }
                        .foregroundStyle(.black.opacity(0.80))

                        AnimePrototypeCaption(variant: .shojo, dark: false)

                        Text("今天也要\n和 Milo 在一起")
                            .font(.system(size: 35, weight: .black, design: .serif))
                            .italic()
                            .lineSpacing(-3)
                            .foregroundStyle(Color(red: 0.22, green: 0.12, blue: 0.19))
                            .overlay(alignment: .topTrailing) {
                                Text("…好吗？")
                                    .font(.caption.weight(.bold))
                                    .rotationEffect(.degrees(8))
                                    .offset(x: -4, y: -5)
                            }

                        HStack(alignment: .bottom, spacing: 10) {
                            ZStack(alignment: .bottom) {
                                Color(red: 0.86, green: 0.76, blue: 0.79)
                                ShojoBurst().stroke(Color(red: 0.38, green: 0.22, blue: 0.30).opacity(0.38), lineWidth: 1)
                                CompanionImage(asset: "MiloIdle01", size: 196)
                                    .offset(y: 9)
                                Text("Milo")
                                    .font(.caption.weight(.black))
                                    .padding(.horizontal, 9)
                                    .padding(.vertical, 6)
                                    .background(.white.opacity(0.88), in: Capsule())
                                    .offset(y: -10)
                            }
                            .frame(height: 256)
                            .clipShape(ShojoPanelShape(cut: 22))
                            .overlay { ShojoPanelShape(cut: 22).stroke(.black.opacity(0.78), lineWidth: 2) }

                            VStack(spacing: 10) {
                                ShojoMoment(title: "08:42", detail: "稿子还空着")
                                ShojoMoment(title: "25 min", detail: "一页就好")
                                Text("START\nTHE SCENE")
                                    .font(.caption2.weight(.black))
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .background(Color(red: 0.31, green: 0.16, blue: 0.27))
                                    .foregroundStyle(.white)
                            }
                            .frame(width: 117, height: 256)
                        }

                        HStack(alignment: .top, spacing: 8) {
                            Text("“先写一句吧。”")
                                .font(.title3.weight(.bold))
                                .fontDesign(.serif)
                                .padding(13)
                                .background(.white, in: ShojoSpeechBubble())
                            Spacer()
                            Text("♡")
                                .font(.system(size: 52, weight: .thin, design: .serif))
                                .foregroundStyle(Color(red: 0.61, green: 0.31, blue: 0.42))
                        }

                        Button { } label: {
                            Text("翻到这一话的下一格")
                                .font(.body.weight(.bold))
                                .frame(maxWidth: .infinity, minHeight: 54)
                        }
                        .foregroundStyle(.white)
                        .background(Color(red: 0.31, green: 0.16, blue: 0.27), in: Rectangle())
                        .accessibilityHint("原型操作，不会启动真实专注")

                        AnimeAssetWarning(dark: false)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 17)
                    .padding(.bottom, 130)
                    .frame(minHeight: proxy.size.height)
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

private struct ShojoHalftone: View {
    var body: some View {
        Canvas { context, size in
            for x in stride(from: 8, through: size.width, by: 12) {
                for y in stride(from: 9, through: size.height, by: 12) {
                    let distance = hypot(x - size.width * 0.82, y - size.height * 0.20)
                    if distance < 190 {
                        let radius = max(0.7, 3.0 - distance / 86)
                        let dot = CGRect(x: x, y: y, width: radius, height: radius)
                        context.fill(Path(ellipseIn: dot), with: .color(Color(red: 0.48, green: 0.22, blue: 0.37).opacity(0.16)))
                    }
                }
            }
        }
    }
}

private struct ShojoBurst: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            for index in 0..<22 {
                let angle = Double(index) * .pi * 2 / 22
                let end = CGPoint(x: center.x + cos(angle) * rect.width, y: center.y + sin(angle) * rect.height)
                path.move(to: center)
                path.addLine(to: end)
            }
        }
    }
}

private struct ShojoPanelShape: Shape {
    let cut: CGFloat

    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX + cut, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cut))
            path.addLine(to: CGPoint(x: rect.maxX - cut, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + cut))
            path.closeSubpath()
        }
    }
}

private struct ShojoMoment: View {
    let title: String
    let detail: String

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(title).font(.subheadline.weight(.black))
            Text(detail).font(.caption2.weight(.medium))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .padding(10)
        .background(.white.opacity(0.68), in: ShojoPanelShape(cut: 12))
        .overlay { ShojoPanelShape(cut: 12).stroke(.black.opacity(0.65), lineWidth: 1) }
    }
}

private struct ShojoSpeechBubble: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.addRoundedRect(in: CGRect(x: rect.minX, y: rect.minY, width: rect.width, height: rect.height - 8), cornerSize: CGSize(width: 15, height: 15))
            path.move(to: CGPoint(x: rect.width * 0.68, y: rect.maxY - 8))
            path.addLine(to: CGPoint(x: rect.width * 0.78, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.width * 0.76, y: rect.maxY - 8))
        }
    }
}

// C — the room becomes an immersive title screen. The interaction hierarchy is HUD
// first, and Milo is a character portrait, deliberately a very different bet from A/B.
private struct AnimeGameRoom: View {
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .top) {
                LinearGradient(
                    colors: [Color(red: 0.07, green: 0.08, blue: 0.18), Color(red: 0.16, green: 0.14, blue: 0.33), Color(red: 0.27, green: 0.17, blue: 0.37)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                AnimeGameSky().ignoresSafeArea().accessibilityHidden(true)

                CompanionImage(asset: "MiloIdle01", size: 344)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .offset(x: 70, y: 92)
                    .accessibilityHidden(true)

                LinearGradient(colors: [.clear, Color.black.opacity(0.64)], startPoint: .center, endPoint: .bottom)
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 14) {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 2) {
                                Text("FOCUMI")
                                    .font(.caption.weight(.black))
                                    .tracking(3)
                                Text("MILO'S ROOM")
                                    .font(.caption2.weight(.bold))
                                    .tracking(1.8)
                                    .foregroundStyle(Color(red: 0.86, green: 0.78, blue: 1.0))
                            }
                            Spacer()
                            VStack(alignment: .trailing, spacing: 2) {
                                Text("Lv. 08")
                                    .font(.caption.weight(.bold))
                                Text("WED · 08:42")
                                    .font(.caption2.monospaced())
                            }
                            .padding(.horizontal, 11)
                            .padding(.vertical, 8)
                            .background(.white.opacity(0.11), in: RoundedRectangle(cornerRadius: 10))
                        }
                        .foregroundStyle(.white)

                        AnimePrototypeCaption(variant: .game, dark: true)
                            .frame(maxWidth: 286)

                        Spacer(minLength: proxy.size.height * 0.29)

                        VStack(alignment: .leading, spacing: 4) {
                            Text("TODAY'S QUEST")
                                .font(.caption.weight(.bold))
                                .tracking(1.5)
                                .foregroundStyle(Color(red: 0.80, green: 0.72, blue: 1.0))
                            Text("整理产品评审稿")
                                .font(.title2.weight(.black))
                                .foregroundStyle(.white)
                            Text("一个番茄钟 · 25:00")
                                .font(.subheadline.monospaced().weight(.semibold))
                                .foregroundStyle(.white.opacity(0.72))
                        }
                        .padding(16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.black.opacity(0.27), in: RoundedRectangle(cornerRadius: 18))
                        .overlay { RoundedRectangle(cornerRadius: 18).stroke(.white.opacity(0.22), lineWidth: 1) }

                        HStack(spacing: 9) {
                            AnimeHUDStat(symbol: "flame.fill", value: "03", label: "连击")
                            AnimeHUDStat(symbol: "sparkles", value: "72", label: "陪伴")
                            AnimeHUDStat(symbol: "moon.stars.fill", value: "18", label: "安静")
                        }

                        Button { } label: {
                            HStack {
                                Image(systemName: "play.fill")
                                Text("进入专注")
                                    .font(.body.weight(.black))
                                Spacer()
                                Text("25:00")
                                    .font(.caption.monospaced().weight(.bold))
                            }
                            .padding(.horizontal, 20)
                            .frame(maxWidth: .infinity, minHeight: 58)
                        }
                        .foregroundStyle(Color(red: 0.11, green: 0.08, blue: 0.22))
                        .background(LinearGradient(colors: [Color(red: 0.94, green: 0.79, blue: 1.0), Color(red: 0.66, green: 0.75, blue: 1.0)], startPoint: .leading, endPoint: .trailing), in: RoundedRectangle(cornerRadius: 15))
                        .accessibilityHint("原型操作，不会启动真实专注")

                        AnimeAssetWarning(dark: true)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 17)
                    .padding(.bottom, 132)
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

private struct AnimeGameSky: View {
    var body: some View {
        ZStack {
            ForEach(0..<42, id: \.self) { index in
                Circle()
                    .fill(.white.opacity(index.isMultiple(of: 3) ? 0.66 : 0.30))
                    .frame(width: index.isMultiple(of: 4) ? 3 : 1.4, height: index.isMultiple(of: 4) ? 3 : 1.4)
                    .position(
                        x: CGFloat((index * 47) % 390),
                        y: CGFloat((index * 79) % 520)
                    )
            }
            Circle()
                .fill(Color(red: 0.67, green: 0.45, blue: 0.95).opacity(0.22))
                .frame(width: 310)
                .blur(radius: 22)
                .offset(x: 90, y: 10)
            RoundedRectangle(cornerRadius: 160)
                .stroke(Color(red: 0.75, green: 0.68, blue: 1.0).opacity(0.22), lineWidth: 1)
                .frame(width: 480, height: 270)
                .rotationEffect(.degrees(-20))
                .offset(x: 100, y: 110)
        }
    }
}

private struct AnimeHUDStat: View {
    let symbol: String
    let value: String
    let label: String

    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: symbol)
                .font(.caption)
                .foregroundStyle(Color(red: 0.84, green: 0.76, blue: 1.0))
            VStack(alignment: .leading, spacing: 0) {
                Text(value).font(.subheadline.monospaced().weight(.bold))
                Text(label).font(.caption2)
            }
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 9)
        .padding(.vertical, 9)
        .background(.white.opacity(0.09), in: RoundedRectangle(cornerRadius: 11))
        .overlay { RoundedRectangle(cornerRadius: 11).stroke(.white.opacity(0.16), lineWidth: 1) }
    }
}

#Preview("Focumi Spatial Design Lab") {
    FocumiDesignLab()
}

#Preview("Focumi Spatial Design Lab · AXXXL") {
    FocumiDesignLab()
        .environment(\.dynamicTypeSize, .accessibility5)
}
