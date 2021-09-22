package com.vvi.blog.service;

import com.vvi.blog.bean.Email;

public interface SendEmailService {

    void sendMailByAsynchronousMode(final Email email);
}
