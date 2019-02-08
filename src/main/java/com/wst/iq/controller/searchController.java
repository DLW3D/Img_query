package com.wst.iq.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wst.iq.pojo.PicNickname;
import com.wst.iq.pojo.PicType;
import com.wst.iq.pojo.Picture;
import com.wst.iq.service.*;
import com.wst.iq.util.ImageUtil;
import com.wst.iq.util.Page;
import com.wst.iq.util.UploadedImageFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
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

    @RequestMapping("addPicture")
    public String addPicture(){
        return "addPicture";
    }

    @RequestMapping("addPic")
    public String addPic(Picture picture, HttpSession session, UploadedImageFile uploadedImageFile){
        pictureService.add(picture);
        //构造地址
        String fileName = picture.getPid()+ ".jpg";
        String imageFolder= session.getServletContext().getRealPath("img/original");
        String imageFolder_small= session.getServletContext().getRealPath("img/small");
        String imageFolder_middle= session.getServletContext().getRealPath("img/middle");
        File f = new File(imageFolder, fileName);
        File f_small = new File(imageFolder_small, fileName);
        File f_middle = new File(imageFolder_middle, fileName);
        f.getParentFile().mkdirs();
        try {
            //格式化图片
            uploadedImageFile.getImage().transferTo(f);
            BufferedImage img = ImageUtil.change2jpg(f);
            ImageIO.write(img, "jpg", f);
            //生成缩略图
            ImageUtil.resizeImage(f, 56, 56, f_small);
            ImageUtil.resizeImage(f, 217, 190, f_middle);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:editPicture?pid="+picture.getPid();
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
    public String deleteNickname(int nid){
        int pid =picNicknameService.get(nid).getPid();
        picNicknameService.delete(nid);

        return "redirect:editPicture?pid="+pid;
    }

    @RequestMapping("deleteType")
    public String deleteType(int tid){
        int pid =picTypeService.get(tid).getPid();
        picTypeService.delete(tid);

        return "redirect:editPicture?pid="+pid;
    }

    @RequestMapping("addNickname")
    public String addNickname(PicNickname nickname){
        picNicknameService.add(nickname);

        return "redirect:editPicture?pid="+nickname.getPid();
    }

    @RequestMapping("addType")
    public String addType(PicType type){
        picTypeService.add(type);

        return "redirect:editPicture?pid="+type.getPid();
    }
}
