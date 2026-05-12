<%@ page language="java" contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
    // 교수 클래스
    public class 교수 {
        public String 교수id;

        public boolean 교수체크(String 입력id) {
            this.교수id = 입력id;
            return "inha".equals(this.교수id);
        }
    }

    // 성적 클래스
    public class 성적 {
        public String 학생id;
        public int 자바;
        public int DB;
        public int 보안;
        public int 총점;
        public double 평균;
        public String 학점;

        public boolean 성적입력(String 입력교수id, String 학생id, int 자바, int DB, int 보안, 교수 교수객체) {
            if (교수객체.교수체크(입력교수id)) {
                this.학생id = 학생id;
                this.자바 = 자바;
                this.DB = DB;
                this.보안 = 보안;
                this.총점 = 자바 + DB + 보안;
                this.평균 = Math.round((this.총점 / 3.0) * 100) / 100.0;
                return true;
            } else {
                return false;
            }
        }

        public boolean 학점조회(String 입력교수id, 교수 교수객체) {
            if (교수객체.교수체크(입력교수id)) {
                if (this.평균 >= 90) {
                    this.학점 = "A학점";
                } else if (this.평균 >= 80) {
                    this.학점 = "B학점";
                } else {
                    this.학점 = "C학점";
                }
                return true;
            } else {
                this.학점 = "조회 불가";
                return false;
            }
        }
    }
%>
<%
    교수 inha교수 = new 교수();
    성적 학생성적 = new 성적();

    out.println("========== [정상 케이스: inha] ==========");
    
    // 성적입력
    if (학생성적.성적입력("inha", "STU_2026", 85, 95, 82, inha교수)) {
        out.println("성적 입력 완료");
        out.println("학생 ID: " + 학생성적.학생id);
        out.println("총점: " + 학생성적.총점);
        out.println("평균: " + 학생성적.평균);
    }

    // 학점조회
    if (학생성적.학점조회("inha", inha교수)) {
        out.println("부여된 학점: " + 학생성적.학점);
    }

    out.println("\n========== [실패 케이스: other] ==========");
    
    // 권한 없는 성적입력
    if (!학생성적.성적입력("other", "STU_9999", 100, 100, 100, inha교수)) {
        out.println("성적 입력 실패: 교수 ID 불일치");
    }
    
    // 권한 없는 학점조회
    if (!학생성적.학점조회("other", inha교수)) {
        out.println("학점 조회 실패: 교수 ID 불일치");
    }
%>