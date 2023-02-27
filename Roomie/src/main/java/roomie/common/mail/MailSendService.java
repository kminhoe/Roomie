package roomie.common.mail;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Service
public class MailSendService {
	
    @Autowired   //context-mail에서 빈 등록했기 때문에 주입받을 수 있다. Spring에서 제공하는 MailSender. 
    private JavaMailSenderImpl mailSender;
    
    @Bean
    public JavaMailSenderImpl mailSender() {
        JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();

        javaMailSender.setProtocol("smtp");
        javaMailSender.setHost("127.0.0.1");
        javaMailSender.setPort(8090);

        return javaMailSender;
    }
    

    
    public String sendAuthMail(String mail, String key)  throws MessagingException{
    	
    	
        String authKey = key;
        
        MimeMessage mailMessage = mailSender.createMimeMessage();
        
        String mailContent = "인증번호:   "+authKey ;     //보낼 메시지 
            mailMessage.setSubject("[Roomie] 비밀번호 재설정 안내 메일", "utf-8"); 
            mailMessage.setText(mailContent, "utf-8", "html");  
            mailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(mail));
            mailSender.send(mailMessage);
        
          return authKey;
    }
    

}
