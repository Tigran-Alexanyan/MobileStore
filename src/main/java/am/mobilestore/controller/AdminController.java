package am.mobilestore.controller;

import am.mobilestore.entity.Brand;
import am.mobilestore.entity.Category;
import am.mobilestore.entity.Product;
import am.mobilestore.repository.BrandRepository;
import am.mobilestore.repository.CategoryRepository;
import am.mobilestore.repository.OsRepository;
import am.mobilestore.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private BrandRepository brandRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private OsRepository osRepository;

    @GetMapping("")
    public String homepage() {
        return "WEB-INF/index";
    }

    @GetMapping("/forms")
    public String formsPage(ModelMap map) {
        map.addAttribute("product", new Product());
        map.addAttribute("allBrands", brandRepository.findAll());
        map.addAttribute("allCcategories", categoryRepository.findAll());
        map.addAttribute("allOs" ,osRepository.findAll());
        return "WEB-INF/form-showcase";
    }

    @RequestMapping(value = "/saveProduct", method = RequestMethod.POST)
    public String saveProduct(@RequestParam(value = "image") MultipartFile multipartFile, @ModelAttribute(value = "product") Product product) {

        String path = "/home/karo/IdeaProjects/MobileStore/Picture/";
        File folder = new File(path);
        if (!folder.exists()) {
            folder.mkdir();
        }
        String fileName = System.currentTimeMillis() + "_" + multipartFile.getOriginalFilename();
        File file = new File(path + fileName);
        try {
            multipartFile.transferTo(file);
        } catch (IOException e) {
            return "redirect:/admin/forms";
        }
        product.setPicUrl(path + fileName);
        System.out.println(product);
        productRepository.save(product);
        return "redirect:/admin/forms";
    }

}
