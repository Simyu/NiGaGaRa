package kr.nigagara.teamalpha.sms;

public class sendTest {

	public static void main(String[] args) {
		SMSSendMethod test = new SMSSendMethod();

		// 테스트용도로
		String login_user_tel = "010-8455-4348";// 로그인 사용자(구매자) 세션의 dto에서 획득한 정보
		String enroll_user_tel = "010-3939-5012";// 물품 등록자(판매자) 등록한사람의 dto에서 획득한
													// 정보
		String rphone = login_user_tel + "," + enroll_user_tel;// 여러사람에게 문자전송가능
																// 핸드폰 번호는 ,로구분
		test.SMSSend(rphone, "테스트문자");// 보낼번호,입력할 문자내용: [구매번호 물품]이 정상적으로
										// 거래신청되었습니다. 거래포인트 : [4000]
		// [ 내용] DB정보값;

	}

}
