package com.wst.iq.controller;

import com.github.pagehelper.PageHelper;
import com.wst.iq.pojo.Picture;
import com.wst.iq.service.PictureService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("")
public class searchController {

    PictureService pictureService;

    @RequestMapping("foresearch")
    public String search(String keyword, Model model){

        PageHelper.offsetPage(0,20);
        List<Picture> ps= pictureService.search(keyword);
        model.addAttribute("ps",ps);
        return "search";
    }

}
