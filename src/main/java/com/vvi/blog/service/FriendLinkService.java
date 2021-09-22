package com.vvi.blog.service;

import com.vvi.blog.bean.FriendLink;

import java.util.List;

public interface FriendLinkService {
    List<FriendLink> selectAll();

    int deleteFriendLinkById(Integer id);

    FriendLink selectFriendLinkById(Integer id);

    int updateFriendLink(FriendLink friendLink);

    int insertFriendLink(FriendLink friendLink);
}
