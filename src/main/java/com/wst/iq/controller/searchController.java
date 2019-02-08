package com.wst.iq.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wst.iq.pojo.PicNickname;
import com.wst.iq.pojo.PicType;
import com.wst.iq.pojo.Picture;
import com.wst.iq.service.*;
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
    private PicTypeService picTypeService;
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
        picTypeService.fill(ps);
        picNicknameService.fill(ps);
        userService.fillThrow(ps);

        model.addAttribute("ps",ps);
        model.addAttribute("page", page);
        return "search";
    }

    @RequestMapping("editPicture")
    public String editPicture(int pid, Model model){
        Picture picture = pictureService.get(pid);
        picNicknameService.fill(picture);
        picTypeService.fill(picture);

        model.addAttribute("p",picture);
        return "editPicture";
    }

    @RequestMapping("deleteNickname")
    public String deleteNickname(int nid, Model model){
        int pid =picNicknameService.get(nid).getPid();
        picNicknameService.delete(nid);

        return "redirect:editPicture?pid="+pid;
    }

    @RequestMapping("deleteType")
    public String deleteType(int tid, Model model){
        int pid =picTypeService.get(tid).getPid();
        picTypeService.delete(tid);

        return "redirect:editPicture?pid="+pid;
    }

    @RequestMapping("addNickname")
    public String addNickname(PicNickname nickname, Model model){
        picNicknameService.add(nickname);

        return "redirect:editPicture?pid="+nickname.getPid();
    }

    @RequestMapping("addType")
    public String addType(PicType type, Model model){
        picTypeService.add(type);

        return "redirect:editPicture?pid="+type.getPid();
    }
}
