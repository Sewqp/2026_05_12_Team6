usecaseDiagram
    actor "온라인 뱅킹 사용자" as Customer [cite: 7]

    package "온라인 뱅킹 시스템" {
        usecase "출금" as Withdraw
        usecase "사용자 조회" as SearchUser
        usecase "잔액 확인" as CheckBalance
        usecase "잔액 계산" as ComputeBalance [cite: 7]
    }

    Customer --> Withdraw [cite: 7]
    Withdraw ..> SearchUser : <<include>> [cite: 7]
    Withdraw ..> CheckBalance : <<include>> [cite: 7]
    Withdraw ..> ComputeBalance : <<include>> [cite: 7]