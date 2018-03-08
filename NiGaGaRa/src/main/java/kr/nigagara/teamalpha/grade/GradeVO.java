package kr.nigagara.teamalpha.grade;

import java.sql.Date;

public class GradeVO {

	private int grade_num;
	private int delivery_Num;
	private int grade;
	private String grade_content;
	private Date grade_date;
	
	public GradeVO() {
		// TODO Auto-generated constructor stub
	}

	public GradeVO(int grade_num, int delivery_Num, int grade, String grade_content, Date grade_date) {
		super();
		this.grade_num = grade_num;
		this.delivery_Num = delivery_Num;
		this.grade = grade;
		this.grade_content = grade_content;
		this.grade_date = grade_date;
	}

	public int getGrade_num() {
		return grade_num;
	}

	public void setGrade_num(int grade_num) {
		this.grade_num = grade_num;
	}

	public int getDelivery_Num() {
		return delivery_Num;
	}

	public void setDelivery_Num(int delivery_Num) {
		this.delivery_Num = delivery_Num;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getGrade_content() {
		return grade_content;
	}

	public void setGrade_content(String grade_content) {
		this.grade_content = grade_content;
	}

	public Date getGrade_date() {
		return grade_date;
	}

	public void setGrade_date(Date grade_date) {
		this.grade_date = grade_date;
	}

	@Override
	public String toString() {
		return "GradeVO [grade_num=" + grade_num + ", delivery_Num=" + delivery_Num + ", grade=" + grade
				+ ", grade_content=" + grade_content + ", grade_date=" + grade_date + "]";
	}
	
	

}