package kr.nigagara.teamalpha.member;

public class Mail {
	// "받는사람주소"
	private String recipient;
	// 제목
	private String subject;
	// 본문
	private String body;
	
	
	public Mail() {
	
	}

	public Mail(String recipient, String subject, String body) {
		super();
		this.recipient = recipient;
		this.subject = subject;
		this.body = body;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	@Override
	public String toString() {
		return "Mail [recipient=" + recipient + ", subject=" + subject + ", body=" + body + "]";
	}
	
	
}
