package kr.nigagara.teamalpha.evaluation;

import java.sql.Date;

public class EvaluationVO {

	private String grade_num;
	private String delivery_Num;
	private String grade;
	private String grade_content;
	private Date grade_date;
	private String goods_Num;
	private String delivery_man;

	public EvaluationVO() {
		super();
	}

	public EvaluationVO(String grade_num, String delivery_Num, String grade, String grade_content, Date grade_date,
			String goods_Num, String delivery_man) {
		super();
		this.grade_num = grade_num;
		this.delivery_Num = delivery_Num;
		this.grade = grade;
		this.grade_content = grade_content;
		this.grade_date = grade_date;
		this.goods_Num = goods_Num;
		this.delivery_man = delivery_man;
	}

	public String getGrade_num() {
		return grade_num;
	}

	public void setGrade_num(String grade_num) {
		this.grade_num = grade_num;
	}

	public String getDelivery_Num() {
		return delivery_Num;
	}

	public void setDelivery_Num(String delivery_Num) {
		this.delivery_Num = delivery_Num;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
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

	public String getGoods_Num() {
		return goods_Num;
	}

	public void setGoods_Num(String goods_Num) {
		this.goods_Num = goods_Num;
	}

	public String getDelivery_man() {
		return delivery_man;
	}

	public void setDelivery_man(String delivery_man) {
		this.delivery_man = delivery_man;
	}

	@Override
	public String toString() {
		return "EvaluationVO [grade_num=" + grade_num + ", delivery_Num=" + delivery_Num + ", grade=" + grade
				+ ", grade_content=" + grade_content + ", grade_date=" + grade_date + ", goods_Num=" + goods_Num
				+ ", delivery_man=" + delivery_man + "]";
	}

}
