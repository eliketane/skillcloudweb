package com.skillcloud.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillcloud.models.Product;
import com.skillcloud.repositories.ProductRepository;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepository repo;
	
	public Iterable<Product> getAll() {
		return repo.findAll();
	}

}
