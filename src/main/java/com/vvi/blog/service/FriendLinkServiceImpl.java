package com.vvi.blog.service;

import com.vvi.blog.bean.FriendLink;
import com.vvi.blog.dao.FriendLinkMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class FriendLinkServiceImpl implements FriendLinkService {

    @Autowired
    FriendLinkMapper friendLinkMapper;

    @Override
    public List<FriendLink> selectAll() {
        List<FriendLink> friendLinks = friendLinkMapper.selectAll();
        return  friendLinks;
    }

    @Override
    public int deleteFriendLinkById(Integer id) {
        int i = friendLinkMapper.deleteFriendLinkById(id);
        return i;
    }

    @Override
    public FriendLink selectFriendLinkById(Integer id) {
        FriendLink friendLink = friendLinkMapper.selectFriendLinkById(id);
        return friendLink;
    }

    @Override
    public int updateFriendLink(FriendLink friendLink) {
        int i = friendLinkMapper.updateFriendLink(friendLink);
        return i;
    }

    @Override
    public int insertFriendLink(FriendLink friendLink) {
        int i = friendLinkMapper.insertFriendLink(friendLink);
        return i;
    }
}
