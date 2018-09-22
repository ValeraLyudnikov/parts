package com.test.parts.model;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@Entity
@Table(name = "parts")
public class Parts {

   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   @Column(updatable = false, nullable = false)
   private Integer id;

   @Column(name = "part_name", nullable = false, unique = true)
   @Size(max = 255, min = 3)
   private String name;

   @Column(name = "necessity", columnDefinition = "TINYINT(1)")
   @NotNull
   private Boolean necessity;

   @Column(name = "quantity")
   @NotNull
   @Min(value = 0)
   private Integer quantity;

   public Integer getId() {
      return id;
   }

   public void setId(Integer id) {
      this.id = id;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public Boolean getNecessity() {
      return necessity;
   }

   public void setNecessity(Boolean necessity) {
      this.necessity = necessity;
   }

   public Integer getQuantity() {
      return quantity;
   }

   public void setQuantity(Integer quantity) {
      this.quantity = quantity;
   }

   @Override
   public String toString() {
      return "Parts{" +
              "id=" + id +
              ", name='" + name + '\'' +
              ", necessity=" + necessity +
              ", quantity=" + quantity +
              '}';
   }
}
