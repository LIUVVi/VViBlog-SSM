package com.vvi.blog.dao;

import com.vvi.blog.bean.FriendLink;

import java.util.List;

public interface FriendLinkMapper {
    List<FriendLink> selectAll();

    int deleteFriendLinkById(Integer id);

    FriendLink selectFriendLinkById(Integer id);

    int updateFriendLink(FriendLink friendLink);

    int insertFriendLink(FriendLink friendLink);
}
