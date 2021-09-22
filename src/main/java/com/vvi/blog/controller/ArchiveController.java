package com.vvi.blog.controller;

import com.vvi.blog.bean.Archive;
import com.vvi.blog.bean.Article;
import com.vvi.blog.service.ArchiveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class ArchiveController {

    @Autowired
    ArchiveService archiveService;

    @RequestMapping("/ArchiveList")
    public String ArchiveList(Model model) {

        List<Archive> archives = archiveService.countByYear();
        model.addAttribute("yearcount", archives);
        for (int i = 0; i < archives.size(); i++) {
            List<Article> articles = archiveService.selectByYear(archives.get(i).getYear());
            archives.get(i).setArticles(articles);
        }
        model.addAttribute("arch", archives);
        return "article/article_archive";
    }
}
