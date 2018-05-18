package com.financing.utils;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

/**
 * @author Penny
 */
public class FileUploadUtil {

    /**
     * 上传头像，通过用户修改个人信息调用
     * 上传封面，通过用户发布项目调用
     * @param fileUpload
     * @param session
     * @return
     * @author Penny
     */
    public static String uploadFile(MultipartFile fileUpload, HttpSession session){
        try {
            String filePath = "";
            if (fileUpload!=null&&!fileUpload.isEmpty()){
                ServletContext servletContext = session.getServletContext();
                String type = fileUpload.getContentType();
                String fileRealPath = "";
                String fileName = "";
                String fileId = DateUtil.dateIDGenerator();
                if (type.equals("image/jpeg")){
                    fileRealPath = servletContext.getRealPath("/res/image_upload");
                    fileName = "cover_"+fileId+".jpg";
                    filePath = "/image_upload/"+fileName;
                }else if (type.equals("video/mp4")){
                    fileRealPath = servletContext.getRealPath("/res/video_upload");
                    fileName = "cover_"+fileId+".mp4";
                    filePath = "/video_upload/"+fileName;
                }else {
                    return "file format error";
                }
                File fileFolder = new File(fileRealPath);
                if (!fileFolder.exists()){
                    fileFolder.mkdirs();
                }
                System.out.println(fileRealPath+"/"+fileName);
                File file = new File(fileFolder,fileName);
                fileUpload.transferTo(file);
            }
            return filePath;
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

}
