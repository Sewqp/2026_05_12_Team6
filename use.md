usecaseDiagram

actor "교수" as Professor

rectangle "성적 관리 시스템" {

    usecase "성적입력" as UC1
    usecase "학점조회" as UC2
    usecase "교수체크" as UC3

}

Professor --> UC1
Professor --> UC2

UC1 ..> UC3 : <<include>>
UC2 ..> UC3 : <<include>>