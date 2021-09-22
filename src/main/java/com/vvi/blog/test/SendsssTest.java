package com.vvi.blog.test;

import com.vvi.blog.bean.Email;
import com.vvi.blog.service.SendEmailService;
import com.vvi.blog.service.SendEmailServiceImpl;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;

public class SendsssTest {

    @Autowired
    private SendEmailService sendEmailService;


    @Test
    @Async
    public void seTest(){
        //这是要异步发送邮件
        Email email = new Email();
        email.setAddressee("liuvvi@163.com");
        email.setSubject("测试邮件有一份");
        email.setContent("这个是内容html内容");
        sendEmailService.sendMailByAsynchronousMode(email);
    }
}
