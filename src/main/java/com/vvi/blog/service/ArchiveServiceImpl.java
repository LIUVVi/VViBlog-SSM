package com.vvi.blog.service;

import com.vvi.blog.bean.Archive;
import com.vvi.blog.bean.Article;
import com.vvi.blog.dao.ArchiveMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ArchiveServiceImpl implements ArchiveService{

    @Autowired
    ArchiveMapper archiveMapper;

    @Override
    public List<Archive> countByYear() {
        List<Archive> archives = archiveMapper.countByYear();
        return archives;
    }

    @Override
    public List<Article> selectByYear(String year) {
        List<Article> articles = archiveMapper.selectByYear(year);
        return articles;
    }
}
