package am.mobilestore.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "picture")
public class Picture {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;
    @Column(name = "pic_url")
    private String picUrl;
    @ManyToOne
    private Product product;

    public Picture(String picUrl, Product product) {
        this.picUrl = picUrl;
        this.product = product;
    }
}

