package com.wst.iq.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wst.iq.pojo.Picture;
import com.wst.iq.service.PicCommentService;
import com.wst.iq.service.PicNicknameService;
import com.wst.iq.service.PictureService;
import com.wst.iq.service.UserService;
import com.wst.iq.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("")
public class searchController {

    @Autowired
    private PictureService pictureService;
    @Autowired
    private PicCommentService picCommentService;
    @Autowired
    private PicNicknameService picNicknameService;
    @Autowired
    private UserService userService;

    @RequestMapping("search")
    public String search(String keyword, Model model, Page page){

        PageHelper.offsetPage(0,20);
        List<Picture> ps = pictureService.search(keyword);

        int total = (int) new PageInfo<Picture>(ps).getTotal();
        page.setTotal(total);

        picCommentService.fill(ps);
        picNicknameService.fill(ps);
        userService.fillThrow(ps);

        model.addAttribute("ps",ps);
        model.addAttribute("page", page);
        return "search";
    }

}
