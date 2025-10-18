package br.com.jlgregorio.MyStore.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Entity
@Table(name = "categories")
public class CategoryModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "name", length = 100, nullable = false, unique = true)
    private String name;
    
    @Column(name = "created_at", nullable = false, updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date createdAt;
    
    @Column(name = "updated_at", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date updatedAt;
    
    @PrePersist
    protected void onCreate() {
        createdAt = updatedAt = new java.util.Date();
    }
    
    @PreUpdate
    protected void onUpdate() {
        updatedAt = new java.util.Date();
    }

}
