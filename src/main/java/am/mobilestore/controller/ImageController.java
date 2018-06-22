package am.mobilestore.controller;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

@Controller
public class ImageController {


    @Value(value = "${am.mobilestore.product.image.upload.path}")
    private String productImagPpath;


    @RequestMapping(value = "/category/image", method = RequestMethod.GET)
    public void getCategoryImageAsByteArray(HttpServletResponse response,
                                            @RequestParam("fileName") String fileName) {
        try {
            InputStream in = new FileInputStream("/home/karo/IdeaProjects/MobileStore/src/main/resources/static/images/" + fileName);
            response.setContentType(MediaType.ALL_VALUE);
            IOUtils.copy(in, response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/product/image", method = RequestMethod.GET)
    public void getProductImageAsByteArray(HttpServletResponse response,
                                           @RequestParam("fileName") String fileName) {
        try {
            InputStream in = new FileInputStream(productImagPpath + fileName);
            response.setContentType(MediaType.ALL_VALUE);
            IOUtils.copy(in, response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
