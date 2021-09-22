package com.vvi.blog.service;

import com.vvi.blog.bean.Archive;
import com.vvi.blog.bean.Article;

import java.util.List;

public interface ArchiveService {
    List<Archive> countByYear();

    List<Article> selectByYear(String year);
}
