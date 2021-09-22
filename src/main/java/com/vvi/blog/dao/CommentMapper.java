package com.vvi.blog.dao;

import com.vvi.blog.bean.Comment;

import java.util.List;

public interface CommentMapper {
    int insertComment(Comment comment);

    int insertCommentSon(Comment comment);

    int insertCommentGSon(Comment comment);

    String selectCommentNum(Integer article_id);

    List<Comment> selectCommentByArticleId(Integer article_id);

    List<Comment> selectComments();

    int deleteComment(Integer comment_id);
}
