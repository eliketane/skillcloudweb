package com.skillcloud.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.skillcloud.models.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Integer> {
	
}
