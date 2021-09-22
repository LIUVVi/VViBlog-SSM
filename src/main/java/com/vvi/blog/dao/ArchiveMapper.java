package com.vvi.blog.dao;

import com.vvi.blog.bean.Archive;
import com.vvi.blog.bean.Article;

import java.util.List;

public interface ArchiveMapper {
    List<Archive> countByYear();

    List<Article> selectByYear(String year);
}
