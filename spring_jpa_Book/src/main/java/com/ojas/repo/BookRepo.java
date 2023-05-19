package com.ojas.repo;

import org.springframework.data.repository.CrudRepository;

import com.ojas.entity.BookEntity;

public interface BookRepo extends CrudRepository<BookEntity, Integer> {

}
