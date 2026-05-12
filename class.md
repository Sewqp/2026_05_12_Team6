classDiagram

class 교수 {
    -String 교수id
    +교수(String 교수id)
    +교수체크(String 교수id) boolean [cite: 5]
}

class 성적 {
    -String 학생id
    -int 자바
    -int db
    -int 보안
    -int 총점
    -double 평균
    -String 학점

    +성적(String 학생id, int 자바, int db, int 보안, 교수 교수)
    +성적입력(String 교수id) void
    +학점조회(String 교수id) void [cite: 5]
}

class Add_Sungjuk_UI {
    <<bound>>
    +main(String[] args) void [cite: 5]
}

class search_sungjuk_ui {
    +main(String[] args) void [cite: 5, 6]
}

성적 --> 교수 : uses (Dependency) [cite: 6]
Add_Sungjuk_UI ..> 성적 : uses (Dependency) [cite: 6]
search_sungjuk_ui ..> 성적 : uses (Dependency) [cite: 6]