package am.mobilestore.repository;

import am.mobilestore.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
    Product findProductById(int id);
    Set<Product> findProductsByBrandNameContains(String name);
    Set<Product> findProductsByModelContains(String name);

}
