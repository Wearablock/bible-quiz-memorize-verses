# Quiz App Boilerplate

다국어 퀴즈 앱을 빠르게 만들 수 있는 Flutter 보일러플레이트입니다.

## 주요 기능

- 15개 언어 지원 (한국어, 영어, 일본어, 중국어 등)
- AdMob 광고 통합 (배너, 전면, 보상형)
- 인앱 결제 (광고 제거)
- 다크 모드 지원
- GitHub를 통한 원격 퀴즈 데이터 동기화
- 로컬 데이터베이스 (Drift)

---

## 변경 항목 구분

### AppConfig로 자동화되는 항목
`lib/core/config/app_config.dart` 수정 시 아래 파일들이 자동 반영됩니다:

| 항목 | 자동 반영 파일 |
|------|---------------|
| 앱 타이틀 | `main.dart` |
| 테마 색상 | `app_colors.dart` |
| 카테고리 목록/색상 | `app_colors.dart`, `remote_config.dart` |
| 광고 Unit ID | `ad_config.dart` |
| IAP 상품 ID | `iap_service.dart` |
| 원격 데이터 URL | `remote_config.dart` |
| 문서 URL | `app_urls.dart` |

### 수동 변경 필수 항목
아래 항목들은 네이티브 설정이므로 직접 수정해야 합니다:

| 파일 | 변경 항목 |
|------|----------|
| `pubspec.yaml` | name, description |
| `android/app/build.gradle.kts` | applicationId, namespace |
| `android/app/src/main/AndroidManifest.xml` | android:label, AdMob App ID |
| `ios/Runner/Info.plist` | CFBundleDisplayName, CFBundleName, GADApplicationIdentifier |
| Xcode | Bundle Identifier |
| `assets/icon/` | 앱 아이콘 이미지 |
| `assets/splash/` | 스플래시 이미지 |
| `assets/data/` | 퀴즈 데이터 |

---

## 새 앱 만들기 체크리스트

### Step 1: 프로젝트 복제

```bash
git clone https://github.com/YourOrg/quiz-app-boilerplate.git my_quiz_app
cd my_quiz_app
rm -rf .git
git init
```

---

### Step 2: AppConfig 수정

**파일:** `lib/core/config/app_config.dart`

```dart
// ===== 앱 기본 정보 =====
static const String appName = 'Movie Quiz';                        // TODO: 변경
static const String appDisplayName = 'Movie Quiz - Cinema Master'; // TODO: 변경

// ===== 테마 색상 =====
static const Color primaryColor = Color(0xFFE50914);      // TODO: 변경
static const Color secondaryColor = Color(0xFF221F1F);    // TODO: 변경

// ===== 카테고리 =====
static const List<String> categories = [                  // TODO: 변경
  'action', 'comedy', 'drama', 'horror', 'romance', 'scifi'
];

// ===== 광고 ID (AdMob 콘솔에서 발급) =====
static const String bannerAdIdAndroid = 'ca-app-pub-xxx/xxx';       // TODO: 변경
static const String bannerAdIdIos = 'ca-app-pub-xxx/xxx';           // TODO: 변경
static const String interstitialAdIdAndroid = 'ca-app-pub-xxx/xxx'; // TODO: 변경
static const String interstitialAdIdIos = 'ca-app-pub-xxx/xxx';     // TODO: 변경
static const String rewardedAdIdAndroid = 'ca-app-pub-xxx/xxx';     // TODO: 변경
static const String rewardedAdIdIos = 'ca-app-pub-xxx/xxx';         // TODO: 변경

// ===== IAP 상품 ID =====
static const String removeAdsProductId = 'movie_quiz_remove_ads';   // TODO: 변경

// ===== 원격 데이터 URL =====
static const String remoteDataBaseUrl = 'https://raw.githubusercontent.com/YourOrg/movie-quiz/main/github-data'; // TODO: 변경
static const String docsBaseUrl = 'https://yourorg.github.io/movie-quiz'; // TODO: 변경
```

- [ ] appName 변경
- [ ] appDisplayName 변경
- [ ] primaryColor 변경
- [ ] secondaryColor 변경
- [ ] categories 변경
- [ ] categoryColors 변경
- [ ] 광고 ID 6개 변경 (Android/iOS x 배너/전면/보상형)
- [ ] removeAdsProductId 변경
- [ ] remoteDataBaseUrl 변경
- [ ] docsBaseUrl 변경

---

### Step 3: pubspec.yaml 수정

**파일:** `pubspec.yaml`

```yaml
name: movie_quiz                    # TODO: 패키지 이름 (snake_case)
description: "Movie Quiz App"       # TODO: 앱 설명
```

- [ ] name 변경
- [ ] description 변경

---

### Step 4: Android 설정

#### 4-1. build.gradle.kts

**파일:** `android/app/build.gradle.kts`

```kotlin
android {
    namespace = "com.yourcompany.movie_quiz"  // TODO: 변경

    defaultConfig {
        applicationId = "com.yourcompany.movie_quiz"  // TODO: 변경 (Play Store 고유 ID)
    }
}
```

- [ ] namespace 변경
- [ ] applicationId 변경

#### 4-2. AndroidManifest.xml

**파일:** `android/app/src/main/AndroidManifest.xml`

```xml
<application
    android:label="Movie Quiz - Cinema Master"  <!-- TODO: 홈 화면 표시 이름 -->
    ...>

    <!-- AdMob App ID (광고 Unit ID와 다름!) -->
    <meta-data
        android:name="com.google.android.gms.ads.APPLICATION_ID"
        android:value="ca-app-pub-XXXXXXXXXXXXXXXX~XXXXXXXXXX"/>  <!-- TODO: AdMob 앱 ID -->
</application>
```

- [ ] android:label 변경
- [ ] AdMob APPLICATION_ID 변경

---

### Step 5: iOS 설정

#### 5-1. Info.plist

**파일:** `ios/Runner/Info.plist`

```xml
<!-- 앱 표시 이름 (홈 화면) -->
<key>CFBundleDisplayName</key>
<string>Movie Quiz</string>  <!-- TODO: 변경 -->

<!-- 앱 번들 이름 -->
<key>CFBundleName</key>
<string>movie_quiz</string>  <!-- TODO: 변경 -->

<!-- AdMob App ID -->
<key>GADApplicationIdentifier</key>
<string>ca-app-pub-XXXXXXXXXXXXXXXX~XXXXXXXXXX</string>  <!-- TODO: AdMob 앱 ID -->
```

- [ ] CFBundleDisplayName 변경
- [ ] CFBundleName 변경
- [ ] GADApplicationIdentifier 변경

#### 5-2. Xcode Bundle Identifier

1. Xcode에서 `ios/Runner.xcworkspace` 열기
2. Runner > Signing & Capabilities
3. Bundle Identifier 변경: `com.yourcompany.movieQuiz`

- [ ] Bundle Identifier 변경

---

### Step 6: 에셋 교체

#### 6-1. 앱 아이콘

**파일:** `assets/icon/app_icon.png`
- 크기: 1024 x 1024 px
- 형식: PNG

```bash
# 아이콘 생성
flutter pub run flutter_launcher_icons
```

- [ ] app_icon.png 교체
- [ ] flutter_launcher_icons 실행

#### 6-2. 스플래시 화면

**폴더:** `assets/splash/`

| 파일 | 용도 | 권장 크기 |
|------|------|----------|
| `splash_logo.png` | 메인 로고 | 288 x 288 px |
| `splash_logo_android12.png` | Android 12+ 로고 | 288 x 288 px |
| `splash_branding.png` | 하단 브랜딩 | 200 x 50 px |

```bash
# 스플래시 생성
flutter pub run flutter_native_splash:create
```

- [ ] splash_logo.png 교체
- [ ] splash_logo_android12.png 교체
- [ ] splash_branding.png 교체
- [ ] flutter_native_splash:create 실행

---

### Step 7: 퀴즈 데이터 준비

#### 7-1. categories.json

**파일:** `assets/data/categories.json`

```json
{
  "version": "1.0.0",
  "categories": [
    {
      "id": "action",
      "order": 1,
      "name": {
        "en": "Action",
        "ko": "액션",
        "ja": "アクション"
      },
      "color": "#FF5722",
      "icon": "movie"
    }
  ]
}
```

- [ ] categories.json 작성

#### 7-2. 문제 메타데이터

**폴더:** `assets/data/questions/meta/`

각 카테고리별 파일 생성 (예: `action.json`)

```json
{
  "version": "1.0.0",
  "questions": [
    { "id": "act_001", "categoryId": "action", "difficulty": 1 },
    { "id": "act_002", "categoryId": "action", "difficulty": 2 }
  ]
}
```

- [ ] 각 카테고리 메타데이터 파일 생성

#### 7-3. 문제 콘텐츠 (15개 언어)

**폴더:** `assets/data/questions/{locale}/`

```
questions/
├── en/action.json
├── ko/action.json
├── ja/action.json
├── zh/action.json
├── zh-Hant/action.json
├── es/action.json
├── fr/action.json
├── de/action.json
├── pt/action.json
├── it/action.json
├── ru/action.json
├── ar/action.json
├── th/action.json
├── vi/action.json
└── id/action.json
```

```json
{
  "version": "1.0.0",
  "questions": [
    {
      "id": "act_001",
      "question": "영화 '다이하드'의 주연 배우는?",
      "correctAnswer": "브루스 윌리스",
      "wrongAnswers": ["실베스터 스탤론", "아놀드 슈왈제네거", "멜 깁슨"],
      "hint": "80년대 액션 스타입니다.",
      "explanation": "브루스 윌리스는 1988년 다이하드로 액션 스타가 되었습니다."
    }
  ]
}
```

- [ ] 15개 언어별 문제 콘텐츠 작성

---

### Step 8: 스토어 설정

#### AdMob
1. [AdMob 콘솔](https://admob.google.com) 접속
2. 새 앱 등록 (Android/iOS 각각)
3. 광고 단위 생성 (배너, 전면, 보상형)
4. App ID와 Unit ID를 각각 올바른 위치에 입력

- [ ] AdMob Android 앱 등록
- [ ] AdMob iOS 앱 등록
- [ ] 광고 단위 6개 생성

#### IAP (인앱 결제)
- Google Play Console: 인앱 상품 > 관리되는 상품
- App Store Connect: 앱 내 구입 > 비소모성

- [ ] Google Play IAP 상품 등록
- [ ] App Store IAP 상품 등록

#### GitHub (원격 데이터)
- 퀴즈 데이터용 GitHub 저장소 생성
- GitHub Pages로 약관/개인정보처리방침 호스팅

- [ ] GitHub 저장소 생성
- [ ] GitHub Pages 설정

---

### Step 9: 빌드 및 테스트

```bash
flutter clean
flutter pub get
flutter run
```

- [ ] flutter clean && flutter pub get
- [ ] Android 빌드 테스트
- [ ] iOS 빌드 테스트
- [ ] 광고 표시 확인
- [ ] IAP 테스트

---

## 전체 체크리스트 요약

```
[ ] Step 2: AppConfig 수정 (lib/core/config/app_config.dart)
[ ] Step 3: pubspec.yaml 수정 (name, description)
[ ] Step 4-1: build.gradle.kts (applicationId, namespace)
[ ] Step 4-2: AndroidManifest.xml (android:label, AdMob App ID)
[ ] Step 5-1: Info.plist (CFBundleDisplayName, CFBundleName, GADApplicationIdentifier)
[ ] Step 5-2: Xcode Bundle Identifier
[ ] Step 6-1: 앱 아이콘 교체 + flutter_launcher_icons
[ ] Step 6-2: 스플래시 이미지 교체 + flutter_native_splash:create
[ ] Step 7: 퀴즈 데이터 준비 (categories.json, questions/)
[ ] Step 8: 스토어 설정 (AdMob, IAP, GitHub)
[ ] Step 9: 빌드 테스트
```

---

## 프로젝트 구조

```
lib/
├── core/
│   ├── config/
│   │   ├── app_config.dart    # [핵심] 앱 전역 설정
│   │   └── ad_config.dart     # 광고 설정 (AppConfig 참조)
│   ├── constants/
│   │   ├── app_urls.dart      # URL 상수 (AppConfig 참조)
│   │   └── remote_config.dart # 원격 설정 (AppConfig 참조)
│   ├── services/
│   │   ├── ad_service.dart    # 광고 서비스
│   │   └── iap_service.dart   # 인앱 결제 서비스
│   └── theme/
│       ├── app_colors.dart    # 색상 (AppConfig 참조)
│       └── app_theme.dart     # 테마 정의
├── data/
│   ├── database/              # Drift 로컬 DB
│   ├── models/                # 데이터 모델
│   └── repositories/          # 저장소 패턴
├── features/                  # 기능별 UI
├── l10n/                      # 다국어 번역 (ARB 파일)
├── providers/                 # Riverpod 상태 관리
└── main.dart                  # 앱 진입점
```

---

## 지원 언어

| 코드 | 언어 | 코드 | 언어 |
|------|------|------|------|
| en | English | ru | Русский |
| ko | 한국어 | ar | العربية |
| ja | 日本語 | th | ไทย |
| zh | 简体中文 | vi | Tiếng Việt |
| zh-Hant | 繁體中文 | id | Bahasa Indonesia |
| es | Español | de | Deutsch |
| fr | Français | pt | Português |
| it | Italiano | | |

---

## 유용한 명령어

```bash
# 의존성 설치
flutter pub get

# 코드 생성 (Drift, Riverpod)
dart run build_runner build --delete-conflicting-outputs

# 로컬라이제이션 생성
flutter gen-l10n

# 앱 아이콘 생성
flutter pub run flutter_launcher_icons

# 스플래시 화면 생성
flutter pub run flutter_native_splash:create

# 코드 분석
flutter analyze

# 릴리즈 빌드
flutter build apk --release
flutter build ios --release
```

---

## 라이선스

MIT License
