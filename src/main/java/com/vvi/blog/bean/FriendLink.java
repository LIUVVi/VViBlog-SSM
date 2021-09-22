package com.vvi.blog.bean;

import org.springframework.stereotype.Component;

@Component
public class FriendLink {
    private int friend_id;
    private String friend_name;
    private String link;

    public int getFriend_id() {
        return friend_id;
    }

    public void setFriend_id(int friend_id) {
        this.friend_id = friend_id;
    }

    public String getFriend_name() {
        return friend_name;
    }

    public void setFriend_name(String friend_name) {
        this.friend_name = friend_name;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    @Override
    public String toString() {
        return "FriendLink{" +
                "friend_id=" + friend_id +
                ", friend_name='" + friend_name + '\'' +
                ", link='" + link + '\'' +
                '}';
    }
}
