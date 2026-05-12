<%@ page language="java" contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
   
    public class 교수 {
        private String 교수id;

        public 교수(String 교수id) {
            this.교수id = 교수id;
        }

        public boolean 교수체크(String 입력id) {
            return "inha".equals(입력id);
        }
    }

    
    public class 성적 {
        public String 학생id;
        public int 자바;
        public int db;   
        public int 보안;
        public int 총점;
        public double 평균;
        public String 학점;

        public 성적() {}

        public boolean 성적입력(String 교수id, String 학생id, int 자바, int db, int 보안, 교수 교수객체) {
            if (교수객체.교수체크(교수id)) {
                this.학생id = 학생id;
                this.자바 = 자바;
                this.db = db;
                this.보안 = 보안;
                this.총점 = 자바 + db + 보안;
                
                this.평균 = Math.round((this.총점 / 3.0) * 10) / 10.0;
                
                return true;
            } else {
                return false;
            }
        }

        public boolean 학점조회(String 교수id, 교수 교수객체) {
            if (교수객체.교수체크(교수id)) {
                if (this.평균 >= 90) {
                    this.학점 = "A학점";
                } else if (this.평균 >= 80) {
                    this.학점 = "B학점";
                } else {
                    this.학점 = "C학점";
                }
                return true;
            } else {
                return false;
            }
        }
    }
%>

<%
   
    교수 inha교수 = new 교수("inha");
    성적 학생성적 = new 성적();

    out.println("성적 관리 시스템 실행 결과");
    
    if (학생성적.성적입력("inha", "STU_2026", 85, 95, 82, inha교수)) {
        out.println("성적 입력 완료");
        out.println("-------------------------------------------");
        out.println("학생 ID : " + 학생성적.학생id);
        out.println("총점    : " + 학생성적.총점);
        
        out.println("평균    : " + String.format("%.1f", 학생성적.평균));
    }

    if (학생성적.학점조회("inha", inha교수)) {
        out.println("최종학점 : " + 학생성적.학점);
    }
    
    out.println("===========================================");
%>
