package am.mobilestore.controller;

import am.mobilestore.entity.Product;
import am.mobilestore.repository.CategoryRepository;
import am.mobilestore.repository.PictureRepository;
import am.mobilestore.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

@Controller
@RequestMapping("/mobile-store.am")
public class MainController {

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private PictureRepository pictureRepository;

    @RequestMapping("")
    public String homepage(ModelMap map) {
        List<Product> products = productRepository.findAll();
        map.addAttribute("products4", products.subList(products.size()-4,products.size()));
        map.addAttribute("categories", categoryRepository.findAll());
        map.addAttribute("products", productRepository.findAll());
        return "index";
    }

    @RequestMapping("/product")
    public String productPage(@RequestParam(value = "id") int id, ModelMap map) {
        map.addAttribute("allCategories", categoryRepository.findAll());
        map.addAttribute("pictures", pictureRepository.findPicturesByProductId(id));
        map.addAttribute("product", productRepository.findProductById(id));
        return "product";
    }

    @RequestMapping("/collection")
    public String collectionPage() {
        return "collection";
    }


    @RequestMapping("/search")
    public String searchPage(@RequestParam(value = "name") String name, ModelMap map) {
        Set<Product> searchProducts = productRepository.findProductsByBrandNameContains(name);
        for (Product product : productRepository.findProductsByModelContains(name)) {
            searchProducts.add(product);
        }
        map.addAttribute("products", searchProducts);
        map.addAttribute("allCategories", categoryRepository.findAll());
        return "search";
    }

}
