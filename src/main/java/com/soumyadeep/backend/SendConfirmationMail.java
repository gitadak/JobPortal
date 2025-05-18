package com.soumyadeep.backend;

import java.util.Properties;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class SendConfirmationMail
{
    public static void sendConfirmationMail(String to_email, String subject, String message)
    {
        String from_email="xxxxxxxxx@gmail.com";
        String mail_password="xxxx xxxx xxxx xxxx";
        // 1. Create an instance of Properties class
        Properties props=new Properties();
        
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        
        Session session=Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from_email, mail_password);
            }
        });
        
        try
        {
            MimeMessage mimemsg=new MimeMessage(session);
            mimemsg.setFrom(new InternetAddress(from_email));
            mimemsg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
            mimemsg.setSubject(subject);
            mimemsg.setText(message);
            
            Transport.send(mimemsg);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
