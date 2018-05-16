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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;
    @Column
    private String model;
    @ManyToOne
    private Os os;
    @Column(name = "os_version")
    private double osVersion;
    @Column
    private int camera;
    @Column
    private String cpu;
    @Column
    private int ram;
    @Column
    private int memory;
    @ManyToOne
    private Category category;
    @ManyToOne
    private Brand brand;
    @Column(name = "pic_url")
    private String picUrl;


}