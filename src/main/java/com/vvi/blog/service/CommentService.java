package com.vvi.blog.service;

import com.vvi.blog.bean.Comment;

import java.util.List;

public interface CommentService {

    int insertComment(Comment comment);

    int insertCommentSon(Comment comment);

    int insertCommentGSon(Comment comment);

    String selectCommentNum(Integer article_id);

    List<Comment> selectCommentByArticleId(Integer article_id);

    List<Comment> selectComments();

    int deleteComment(Integer comment_id);
}
