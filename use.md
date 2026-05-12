
```mermaid
usecaseDiagram
    actor "온라인 뱅킹 사용자" as Customer
    package "온라인 뱅킹 시스템" {
        usecase "출금" as Withdraw
        usecase "사용자 조회" as SearchUser
        usecase "잔액 확인" as CheckBalance
        usecase "잔액 계산" as ComputeBalance
    }
    Customer --> Withdraw
    Withdraw ..> SearchUser : <<include>>
    Withdraw ..> CheckBalance : <<include>>
    Withdraw ..> ComputeBalance : <<include>>
```
