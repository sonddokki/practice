test

warking dir --> 워킹디렉토리(감시공간)
stage area --> 임시공간

명령어
cd 체인지디렉토리
dir 폴더안에 파일 보기
cd.. 파일 바로 위로 나오기
cd\ 파일 나오기
cd\파일이름 -- 파일들어오기

git init --> 초기화 (1)
git status --> 변화된 내용

git add 파일명 --> stage area에 담기 (특정파일만 버전업대기걸기)
git add -A --> stage area에 모든파일담기

git commit -m "과제1"(메세지넣기) --> stage area에 있던 파일 버전업


ver1(과제1) practice.sql

email
name 
오류나면 지정해줘야함

이메일,이름확인
git config --global user.email
git config --global user.name


넣기
git config --global user.email ""
git config --global user.name ""


소스트리 연동시 경로맞추기
git config --global --add safe.directory C:/javaStudy/workspace_sql/practice

cls --> 창 깨끗하게 청소하기


============================================
git 명령어들

…or create a new repository on the command line
echo "# practice" >> README.md
git init --> 감시자생성
git add README.md
git commit -m "first commit" --> 초기커밋한번 시도하세요
git branch -M main --> 핵심줄기 이름 '메인'으로 지정
git remote add origin https://github.com/sonddokki/practice.git --> 깃허브 방 주소
git push -u origin main --> 업로드

git pull 

…or push an existing repository from the command line
git remote add origin https://github.com/sonddokki/practice.git
git branch -M main
git push -u origin main

…or import code from another repository
You can initialize this repository with code from a Subversion, Mercurial, or TFS project.

================================================

파일 수정후
git add 로 파일 수정한것 깃 저장대기
git commit -m "과제1" 로 깃 버전업
git push -u origin main 깃허브에 업로드


=================================================

git remote add origin https://github.com/sonddokki/studyNotes.git
