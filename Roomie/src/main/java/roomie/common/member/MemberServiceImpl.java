package roomie.common.member;

import java.util.Map;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Resource(name = "memberDAO")
	private MemberDAO memberDAO;


	// org.springframework.mail.javamail.JavaMailSender
	@Autowired
	JavaMailSender javaMailSender;

	public void setJavaMailSender(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}

	@Override
	public boolean emailCodeSend(String subject, String text, String from, String to) {
		// javax.mail.internet.MimeMessage
		MimeMessage message = javaMailSender.createMimeMessage();
		System.out.println("message의 값 : " + message);
 
		try {
			// org.springframework.mail.javamail.MimeMessageHelper
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setSubject(subject);
			helper.setText(text, true);
			helper.setFrom(from);
			helper.setTo(to);

			javaMailSender.send(message);
			return true;

		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public void insertEmailMember(Map<String, Object> map) throws Exception {
		memberDAO.insertEmailMember(map);
	}
	
	@Override
	public void insertKakaoMember(Map<String, Object> map) throws Exception {
		memberDAO.insertKakaoMember(map);
	}

	@Override
	public Map<String, Object> selectMemberId(Map<String, Object> map) throws Exception {
		return memberDAO.selectMemberId(map);
	}
	
	@Override
	public Map<String, Object> selectMemberUser(Map<String, Object> map) throws Exception {
		return memberDAO.selectMemberUser(map);
	}
	
	 //이메일 확인
		@Override
		public Map<String, Object> emailcheck(String mail) throws Exception {
			// TODO Auto-generated method stub
			return memberDAO.emailcheck(mail);
		}


	    //비밀번호 재설정
		@Override
		public void passwordreset(Map<String, Object> map) throws Exception {
			
			memberDAO.passwordreset(map);
		}
}
