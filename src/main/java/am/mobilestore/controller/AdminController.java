package am.mobilestore.controller;

import am.mobilestore.entity.Brand;
import am.mobilestore.entity.Category;
import am.mobilestore.entity.Picture;
import am.mobilestore.entity.Product;
import am.mobilestore.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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

    @Value(value = "${am.mobilestore.category.image.upload.path}")
    private String categoryImagPpath;

    @Value(value = "${am.mobilestore.product.image.upload.path}")
    private String productImagPpath;

    @Autowired
    private BrandRepository brandRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private OsRepository osRepository;

    @Autowired
    private PictureRepository pictureRepository;

    @GetMapping("")
    public String homepage(ModelMap map) {
        map.addAttribute("products", productRepository.findAll().size());
        map.addAttribute("brands", brandRepository.findAll().size());
        map.addAttribute("os", osRepository.findAll().size());
        map.addAttribute("categories", categoryRepository.findAll().size());
        return "WEB-INF/index";
    }

    @GetMapping("/forms")
    public String formsPage(ModelMap map) {
        map.addAttribute("product", new Product());
        map.addAttribute("catehory", new Category());
        map.addAttribute("allBrands", brandRepository.findAll());
        map.addAttribute("allCcategories", categoryRepository.findAll());
        map.addAttribute("allOs", osRepository.findAll());
        return "WEB-INF/form-showcase";
    }

    private void exists(String path) {
        File folder = new File(path);
        if (!folder.exists()) {
            folder.mkdir();
        }
    }

    @RequestMapping(value = "/saveProduct", method = RequestMethod.POST)
    public String saveProduct(@RequestParam(value = "image") MultipartFile[] multipartFile, @ModelAttribute(value = "product") Product product) {
        exists(productImagPpath);
        String fileName = "";
        product.setPicUrl(fileName);
        productRepository.save(product);
        for (MultipartFile file : multipartFile) {
            fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
            File file1 = new File(productImagPpath + fileName);
            try {
                pictureRepository.save(new Picture(fileName, product));
                file.transferTo(file1);
            } catch (IOException e) {
                return "redirect:/admin/forms";
            }
        }
        product.setPicUrl(fileName);
        productRepository.save(product);
        return "redirect:/admin/forms";
    }

    @RequestMapping(value = "/saveBrand", method = RequestMethod.POST)
    public String save(@RequestParam(value = "image") MultipartFile multipartFile, @ModelAttribute("category") Category category) {
        exists(categoryImagPpath);
        String fileName = System.currentTimeMillis() + "_" + multipartFile.getOriginalFilename();
        File file = new File(categoryImagPpath + fileName);
        try {
            category.setPicName(fileName);
            categoryRepository.save(category);
            multipartFile.transferTo(file);
        } catch (IOException e) {
            return "redirect:/admin/forms";
        }
        return "redirect:/admin/forms";
    }
}
