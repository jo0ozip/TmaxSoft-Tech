# TmaxSoft-Tech

📌 **오픈일**: 2025-09-02  

license upload 주의!

---

## 📂 프로젝트 구조
각 도메인별로 폴더를 나누어 관리합니다.  
도메인별 작업은 해당 폴더 안에서만 진행하며, 표준 정의된 사항은 `Standard` 폴더에 반영합니다.

```
TmaxSoft-Tech/
 ├─ Standard/     # 표준화 도메인
 ├─ Coporation/   # 기업 도메인
 ├─ Finance/      # 금융 도메인
 ├─ Public/       # 공공 도메인
 └─ Wide/         # 광역 도메인
```

---

## 🚀 사용 방법

1. **저장소 클론**
   ```bash
   git clone https://github.com/jo0ozip/TmaxSoft-Tech.git
   cd TmaxSoft-Tech
   ```

2. **도메인별 작업**
   ```bash
   cd Public
   # 코드 작성 및 수정
   ```

3. **변경 사항 스테이징 및 커밋**
   ```bash
   git add .
   git commit -m "내용 추가"
   ```

4. **원격 저장소로 푸시**
   ```bash
   git push origin main
   ```

---

## 📖 협업 가이드
- **폴더 단위 분리 원칙**  
  Coporation, Finance, Public, Standard, Wide 각 폴더 내에서만 작업합니다.  

- **표준 사항 관리**  
  협의된 표준 내용은 `Standard` 폴더에서 관리합니다.  

- **커밋 메시지 규칙**  
  - `Add`: 새로운 기능 추가  
  - `Fix`: 버그 수정  
  - `Update`: 기존 기능 개선  

  예시:
  ```
  Add: Public encyrption SHELL 추가
  Fix: Public encryption SHELL 오탈자 수정
  Update: Public 보안 취약사항 보완
  ```

- **브랜치 전략(선택)**  
  - `main`: 안정된 최종 코드  
  - `feature/<도메인>`: 도메인별 개발 브랜치  

---

## ✅ 참고 사항
- 도메인별 폴더 작업으로 충돌을 최소화합니다.  
- 100MB 이상 대용량 파일은 Git LFS를 사용합니다.  
