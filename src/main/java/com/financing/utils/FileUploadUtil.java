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
//                    fileRealPath = servletContext.getRealPath("/upload/image");
                    fileRealPath = "/financing-uploadfile/image";
                    fileName = "cover_"+fileId+".jpg";
                    filePath = "/upload/image/"+fileName;
                    System.out.println("filePath = " + filePath);
                    System.out.println("fileRealPath = " + fileRealPath);
                }else if (type.equals("video/mp4")){
//                    fileRealPath = servletContext.getRealPath("/res/video_upload");
                    fileRealPath = "/financing-uploadfile/video";
                    fileName = "cover_"+fileId+".mp4";
                    filePath = "/upload/video/"+fileName;
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
