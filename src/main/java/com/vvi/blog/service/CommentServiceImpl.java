package com.vvi.blog.service;

import com.vvi.blog.bean.Comment;
import com.vvi.blog.dao.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService{

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public int insertComment(Comment comment) {
        return commentMapper.insertComment(comment);
    }

    @Override
    public int insertCommentSon(Comment comment) {
        return commentMapper.insertCommentSon(comment);
    }

    @Override
    public int insertCommentGSon(Comment comment) {
        return commentMapper.insertCommentGSon(comment);
    }

    @Override
    public String selectCommentNum(Integer article_id) {
        return commentMapper.selectCommentNum(article_id);
    }

    @Override
    public List<Comment> selectCommentByArticleId(Integer article_id) {
        return commentMapper.selectCommentByArticleId(article_id);

    }

    @Override
    public List<Comment> selectComments() {
        return commentMapper.selectComments();
    }

    @Override
    public int deleteComment(Integer comment_id) {
        return commentMapper.deleteComment(comment_id);
    }
}
