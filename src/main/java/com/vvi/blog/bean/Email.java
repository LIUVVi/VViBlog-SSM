package com.vvi.blog.bean;

import org.springframework.stereotype.Component;

import java.io.Serializable;

@Component
public class Email implements Serializable {

    /**收件人**/
    private String addressee;
    /**抄送给**/
    private String cc;
    /**邮件主题**/
    private String subject;
    /**邮件内容**/
    private String content;

    public String getAddressee() {
        return addressee;
    }

    public void setAddressee(String addressee) {
        this.addressee = addressee;
    }

    public String getCc() {
        return cc;
    }

    public void setCc(String cc) {
        this.cc = cc;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
