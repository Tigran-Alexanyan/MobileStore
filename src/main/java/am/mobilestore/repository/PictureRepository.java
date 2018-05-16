package am.mobilestore.repository;

import am.mobilestore.entity.Picture;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PictureRepository extends JpaRepository<Picture, Integer> {


    List<Picture> findPicturesByProductId(int i);
}
