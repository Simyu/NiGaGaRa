package kr.nigagara.teamalpha.grade;

import java.sql.Date;

public class GradeVO {

    private Integer gradeNum;

    private String deliveryNum;

    private Integer grade;

    private String gradeContent;

    private Date gradeDate;
    
    public GradeVO() {
		// TODO Auto-generated constructor stub
	}

	public GradeVO(Integer gradeNum, String deliveryNum, Integer grade, String gradeContent, Date gradeDate) {
		super();
		this.gradeNum = gradeNum;
		this.deliveryNum = deliveryNum;
		this.grade = grade;
		this.gradeContent = gradeContent;
		this.gradeDate = gradeDate;
	}

	public Integer getGradeNum() {
		return gradeNum;
	}

	public void setGradeNum(Integer gradeNum) {
		this.gradeNum = gradeNum;
	}

	public String getDeliveryNum() {
		return deliveryNum;
	}

	public void setDeliveryNum(String deliveryNum) {
		this.deliveryNum = deliveryNum;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public String getGradeContent() {
		return gradeContent;
	}

	public void setGradeContent(String gradeContent) {
		this.gradeContent = gradeContent;
	}

	public Date getGradeDate() {
		return gradeDate;
	}

	public void setGradeDate(Date gradeDate) {
		this.gradeDate = gradeDate;
	}

	@Override
	public String toString() {
		return "GradeVO [gradeNum=" + gradeNum + ", deliveryNum=" + deliveryNum + ", grade=" + grade + ", gradeContent="
				+ gradeContent + ", gradeDate=" + gradeDate + "]";
	}
    
    
}