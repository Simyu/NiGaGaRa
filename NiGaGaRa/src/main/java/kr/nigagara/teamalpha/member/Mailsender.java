package kr.nigagara.teamalpha.member;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mailsender  {
	private static final String host = "smtp.gmail.com";
	private static final String username = "haveanicedream.noreply@gmail.com";
	private static final String password = "HaveANiceDream!";
		
	public static void sendMail(Mail mail) throws AddressException, MessagingException{
		        
        Properties props = new Properties();

        props.put("mail.smtps.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage msg = new MimeMessage(session);


        msg.setSubject(mail.getSubject());

        msg.setText(mail.getBody());

        msg.setFrom(new InternetAddress(username));

        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(mail.getRecipient()));

        Transport transport = session.getTransport("smtps");

        transport.connect(host, username, password);

        transport.sendMessage(msg, msg.getAllRecipients());

        transport.close();       


	}
}
