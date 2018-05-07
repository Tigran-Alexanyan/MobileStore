package am.mobilestore.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "product")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column
    private int id;
    @Column
    private String name;
    @ManyToOne
    private Brand brand;
    @ManyToOne
    private Category category;
    @Column
    private String technologyl;
    @Column
    private String dimensions;
    @Column
    private String weight;
    @Column
    private String display;
    @Column
    private String resultion;
    @Column
    private String os;
    @Column
    private String chipset;
    @Column
    private String cpu;
    @Column
    private String internal;
    @Column
    private String camera;
    @Column
    private String color;
    @Column(name = "pic_url")
    private String picUrl;

}