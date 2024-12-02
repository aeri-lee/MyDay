# 하루 일정 관리 "My Day" 프로젝트
- 프로젝트 기간 : 2024.11.25 ~ 2024.12.01
- 참여 인원 : 1인(혼자 진행)
<br />

## 프로젝트 소개
- 사용자가 자신의 할 일 목록을 관리할 수 있는 웹 애플리케이션입니다.
- 사용자는 할 일을 추가하고, 수정하고, 완료 여부를 체크하는 등 기본적인 할 일 관리 기능을 제공합니다.
- 깔끔한 코드 작성, 데이터베이스 관리, 사용자 인터페이스 설계에 중점을 두고 개발되었습니다.
<br />

## 개발 환경
- 백엔드 : java, Spring Framework, eGovFramework, MyBatis, JSP, JSTL
- 프론트엔드 : HTML, CSS, JavaScript, jQuery
- DB : Oracle, DBeaver
- IDE : Eclipse
<br />

## 프로젝트 구조
- 프로젝트는 간결함을 위해 기타 설정 파일을 제외한 주요 소스파일(java, jsp, css, xml)만 포함되어 있습니다.

```shell
└─TODO
    ├─bin
    │  ├─src
    │  │  └─main
    │  │      ├─java
    │  │      │  └─egovframework
    │  │      │      └─TODO
    │  │      │          ├─service
    │  │      │          │  └─impl
    │  │      │          └─web
    │  │      ├─resources
    │  │      │  └─egovframework
    │  │      │      └─sqlmap
    │  │      │          └─example
    │  │      │              └─mappers
    │  │      └─webapp
    │  │          ├─css
    │  │          │  └─egovframework
    │  │          └─WEB-INF
    │  │              ├─config
    │  │              │  └─egovframework
    │  │              │      └─springmvc
    │  │              └─jsp
    │  │                  └─egovframework
    │  │                      └─example
    │  │                          └─TODO
    │  ├─target
    │  │  ├─classes
    │  │  │  └─egovframework
    │  │  │      ├─example
    │  │  │      │  ├─cmmn
    │  │  │      │  │  └─web
    │  │  │      │  └─sample
    │  │  │      │      ├─service
    │  │  │      │      │  └─impl
    │  │  │      │      └─web
    │  │  │      ├─sqlmap
    │  │  │      │  └─example
    │  │  │      │      └─mappers
    │  │  │      └─TODO
    │  │  │          ├─service
    │  │  │          │  └─impl
    │  │  │          └─web
    │  │  ├─generated-sources
    │  │  │  └─annotations
    │  │  └─m2e-wtp
    │  │      └─web-resources
    │  │          └─META-INF
    │  │              └─maven
    │  │                  └─TODO
    │  │                      └─TODO

  ```
<br>

## 프로세스 흐름도
<img height=500px width=300 src="https://github.com/user-attachments/assets/073a2038-ffb9-4c7d-896a-fb01a8686044">

<br>

## 테이블 설계
### 엔티티 관계도
 <img height=200px width=300 src="https://github.com/user-attachments/assets/b27c745e-f713-49c5-a2b9-e896888020e3">

### 테이블 정의서
 
- TB_BOARD 테이블
<table border="1" >
  <thead>
    <tr>
      <th>컬럼 이름</th>
      <th>데이터 타입</th>
      <th>제약 조건</th>
      <th>설명</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>BOARD_ID</td>
      <td>VARCHAR2(36)</td>
      <td>PRIMARY KEY</td>
      <td>고유 ID</td>
    </tr>
    <tr>
      <td>TITLE</td>
      <td>VARCHAR2(200)</td>
      <td>NOT NULL</td>
      <td>할 일 내용</td>
    </tr>
    <tr>
      <td>CNST</td>
      <td>VARCHAR2(2000)</td>
      <td></td>
      <td>할 일 상세 내용</td>
    </tr>
    <tr>
      <td>COMPLETE_YN</td>
      <td>VARCHAR2(1)</td>
      <td>DEFAULT 'N'</td>
      <td>완료 여부</td>
    </tr>
    <tr>
      <td>ID</td>
      <td>VARCHAR2(10)</td>
      <td>NOT NULL</td>
      <td>사용자 ID</td>
    </tr>
    <tr>
      <td>CREATE_DT</td>
      <td>DATE</td>
      <td></td>
      <td>생성일자</td>
    </tr>
    <tr>
      <td>UPDATE_DT</td>
      <td>DATE</td>
      <td></td>
      <td>수정 일자</td>
    </tr>
    <tr>
      <td>TODO_DATE</td>
      <td>DATE</td>
      <td>NOT NULL</td>
      <td>완료 일자</td>
    </tr>
  </tbody>
</table>

- TB_MEMBER 테이블
<table border="1" >
  <thead>
    <tr>
      <th>컬럼 이름</th>
      <th>데이터 타입</th>
      <th>제약 조건</th>
      <th>설명</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>ID</td>
      <td>VARCHAR2(10)</td>
      <td>PRIMARY KEY</td>
      <td>사용자 ID</td>
    </tr>
    <tr>
      <td>PASS</td>
      <td>VARCHAR2(100)</td>
      <td>NOT NULL</td>
      <td>사용자 비밀번호</td>
    </tr>
    <tr>
      <td>NAME</td>
      <td>VARCHAR2(50)</td>
      <td>NOT NULL</td>
      <td>이름</td>
    </tr>
    <tr>
      <td>EMAIL</td>
      <td>VARCHAR2(100)</td>
      <td>NOT NULL</td>
      <td>이메일</td>
    </tr>
    <tr>
      <td>CREATE_DT</td>
      <td>DATE</td>
      <td></td>
      <td>생성일자</td>
    </tr>
  </tbody>
</table>


<br />

## 페이지별 기능 
### 초기화면
- 로그인페이지가 나오며 계정이 없을 시 회원가입을 클릭합니다.
<img height=450px width=550 src="https://github.com/user-attachments/assets/16e0153c-9a1b-490e-8d26-fee353afe44a">

### 회원가입 페이지
- 이름, ID, 이메일, 비밀번호 작성을 통해 회원가입을 합니다.
- ID는 중복이 불가능하며 비밀번호는 영문, 숫자, 특수문자를 혼합하여 6~20로 제한합니다.
- 모든 항목을 필수로 입력 후 '가입하기'버튼 클릭 시 로그인 페이지로 돌아갑니다.
<img height=450px width=550 src="https://github.com/user-attachments/assets/0e60b3d8-1289-49b1-b28d-29577333e9e4">

### TODO-LIST 페이지(오늘의 TODO 등록 전)
- 회원가입 한 ID와 패스워드로 로그인 합니다.
- 현재 일자, 사용자ID와 비교하여 저장된 데이터가 없다면(등록된 현재 일자의 할 일이 없다면) 'TODO-LIST 등록' 버튼이 보입니다.
- 'TODO-LIST 등록' 버튼 클릭 시 등록 페이지로 넘어갑니다.
<img height=450px width=550 src="https://github.com/user-attachments/assets/f2ac2cec-0ab8-44b8-b8ac-aa820b26948e">

### TODO-LIST 등록 페이지
- 할 일과 할 일의 상세 내용이 있다면 작성합니다.
- 최소 1개 이상의 할 일을 작성해야 합니다.
- 'ADD'버튼 클릭 시 작성한 할 일이 표 형식으로 보이며 완료여부,제목,내용,게시글id 등의 항목과 값을 동적으로 생성합니다.
- '삭제'버튼 클릭 시 해당 행이 삭제되며 게시글id를 순서대로 다시 매깁니다.
- '저장' 버튼 클릭 시 다시 TODO-LIST 페이지로 돌아갑니다.
<img height=450px width=750 src="https://github.com/user-attachments/assets/ff3074ca-3110-4315-a413-4bc99c6556c5">

### TODO-LIST 페이지(오늘의 TODO 등록 후)
- 현재 날짜에 해당하는 등록한 TODO-LIST가 표출되며 'TODO-LIST 수정' 버튼이 보여집니다.
- 자정이 지나게 되면 다시 'TODO-LIST 등록' 버튼이 보여집니다.
- TODO-LIST 페이지에서는 할일과 상세내용,완료여부 수정이 가능합니다.
<img height=450px width=550 src="https://github.com/user-attachments/assets/2dd9ae4e-a42f-4225-b345-b70e2db826a7">


## 개선 목표
- 오늘의 TODO 등록 후 TODO-LIST 페이지에서도 할 일 추가나 삭제 가능하도록 추가 구현 예정
- 할 일의 우선순위 설정 기능 추가 예정
- 과거 TODO-LIST 표출 추가 예정
