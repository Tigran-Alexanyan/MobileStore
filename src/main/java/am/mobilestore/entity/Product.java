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
    @Column
    private int date;
    @ManyToOne
    private Os os;
    @Column(name = "os_version")
    private double osVersion;
    @Column(name = "display_type")
    private String displayType;
     @Column(name = "display_resolution")
    private String displayResolution;
    @Column(name = "display_size")
    private double displaySize;
    @Column
    private int camera;
    @Column(name = "front_camera")
    private int frontCamera;
    @Column
    private String cpu;
    @Column
    private int ram;
    @Column(name = "sd_card_slot")
    private String sdCardSlot;
    @Column
    private int memory;
    @Column
    private String internet;
    @Column
    private String gps;
    @Column
    private String bluetooth;
    @Column(name = "3g")
    private String g3;
    @Column(name = "4g")
    private String g4;
    @Column
    private String nfc;
    @Column
    private String charging;
    @Column(name = "battery_type")
    private String batteryType;
    @Column(name = "battery_capasity")
    private int batteryCapasity;
    @Column
    private int weight;
    @Column
    private double thickness;
    @Column
    private double height;
    @Column
    private double width;
    @Column
    private String audio;
    @Column
    private String sim;
    @ManyToOne
    private Category category;
    @ManyToOne
    private Brand brand;
    @Column(name = "pic_url")
    private String picUrl;


}