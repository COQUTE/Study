KH Study Repogitory
===================
KH 정보교육원 스터디 및 협업을 위한 레포지토리

<br>

준비사항
--------

> ### 먼저 Repogitory를 clone해서 본인 local에 저장!
- 협업해서 작업하기 위해 원격 Repogitory에만 저장되어 있는 코드를 Local Repogitory로 가져오는 과정
```bash
git clone (Repogitory 주소)
```
- clone 이후에는 아래 주의사항을 참고하여 함께 협업 진행!

<br>
<br>

주의사항
--------

> ### master branch에서 절대! 작업이나 push를 하지 않는다. (가장 중요)
- master는 항상 배포 가능해야 하기 때문에, 안정적인 관리를 위한 develop branch를 따로 운영한다.

<br>

> ### develop branch에서도 직접 작업하지 않고 feature branch를 만든 후 merge한다.
- develop 또한 많은 작업들이 동시에 이뤄지기 때문에, 
- feature branch 작명 규칙은 feature/기능명 (ex. feature/login)

<br>

```bash
// 'feature' 브랜치(feature/login)를 'develop' 브랜치에서 분기
$ git checkout -b feature/login develop

/**  새로운 기능에 대한 작업 수행 + (add, commit) **/

// 'develop' 브랜치로 이동
$ git checkout develop

// 'develop' 브랜치에 'feature/login' 브랜치 내용을 병합
// 여기서 --no-ff 는 feature 브랜치에 존재하는 커밋 이력을 모두 합쳐서 새로운 커밋을 만드는 것.
$ git merge --no-ff feature/login

// `feature/login` 브랜치 삭제
$ git branch -d feature/login

// 'develop' 브랜치를 원격 중앙 저장소에 올린다.
$ git push origin develop
```

<br>

> ### merge시 코드가 최신화(pull)되어 있지 않으면 충돌(conflict) 발생
- conflict 발생시, 코드 충돌이 발생한 팀원과의 소통 이후 merge
```bash
// 'develop' 브랜치로 이동해서 최신화된 'develop' 브랜치를 받아옴
$ git pull origin develop

// 'feature' 브랜치로 돌아감
$ git checkout feature/(기능명)
// 직전 작업하던 브랜치로 돌아감
$ git checkout -

// 수정된 코드들 모두 merge
$ git merge develop

/** 협의를 통해 수정된 코드들 반영 & 코드 실행 테스트 완료 + (add, commit) **/

// 수정 코드를 반영해서 'feature' 브랜치에 올림
$ git push -u origin feature/(기능명)

/** 본인 'feature' 브랜치에서 다시 develop에 Pull Request **/
```
