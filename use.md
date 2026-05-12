flowchart LR
    Professor((교수))
    
    subgraph "성적 관리 시스템"
        UC1([성적입력])
        UC2([학점조회])
        UC3([교수체크])
    end
    
    Professor --- UC1
    Professor --- UC2
    
    UC1 -.->|include| UC3
    UC2 -.->|include| UC3
