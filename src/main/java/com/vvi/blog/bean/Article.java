package com.vvi.blog.bean;

import org.springframework.stereotype.Component;

@Component
public class Article {
    private int article_id;
    private String title;
    private String author;
    private String tag;
    private String summary;
    private String create_time;
    private String update_time;
    private String content;
    private int watch;
    private int star;
    private String is_delete;

    public Article() {
        super();
    }

    public Article(String title, String author, String tag, String create_time, String update_time, String content) {
        this.title = title;
        this.author = author;
        this.tag = tag;
        this.create_time = create_time;
        this.update_time = update_time;
        this.content = content;
    }

    public int getArticle_id() {
        return article_id;
    }

    public void setArticle_id(int article_id) {
        this.article_id = article_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(String update_time) {
        this.update_time = update_time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getWatch() {
        return watch;
    }

    public void setWatch(int watch) {
        this.watch = watch;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public String getIs_delete() {
        return is_delete;
    }

    public void setIs_delete(String is_delete) {
        this.is_delete = is_delete;
    }

    @Override
    public String toString() {
        return "Article{" +
                "article_id=" + article_id +
                ", title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", tag='" + tag + '\'' +
                ", summary='" + summary + '\'' +
                ", create_time='" + create_time + '\'' +
                ", update_time='" + update_time + '\'' +
                ", content='" + content + '\'' +
                ", watch=" + watch +
                ", star=" + star +
                ", is_delete='" + is_delete + '\'' +
                '}';
    }
}
