package com.vvi.blog.service;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Properties;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import com.vvi.blog.bean.Email;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.task.TaskExecutor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class SendEmailServiceImpl implements SendEmailService{


    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private TaskExecutor taskExecutor;

    @Autowired
    private SimpleMailMessage preConfiguredMessage;

    /*同步发送邮件*/
    public void sendMailBySynchronizationMode(Email email) throws MessagingException, IOException {
        Session session=Session.getDefaultInstance(new Properties());
        MimeMessage mime= new MimeMessage(session);
        MimeMessageHelper helper = new MimeMessageHelper(mime, true, "utf-8");
        helper.setFrom("1053213227@qq.com");//发件人
        helper.setTo(InternetAddress.parse(email.getAddressee()));//收件人
        helper.setReplyTo("1053213227@qq.com");
        helper.setSubject(email.getSubject());//邮件主题
        helper.setText(email.getContent(), true);//true表示设定html格式

        mailSender.send(mime);
    }


    /*异步发送邮件*/
    @Override
    public void sendMailByAsynchronousMode(final Email email) {
        taskExecutor.execute(new Runnable(){
            public void run(){
                try {
                    sendMailBySynchronizationMode(email);
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }
        });

    }


}

