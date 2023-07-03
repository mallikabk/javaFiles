package com.securisk.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.securisk.entity.ClientEntity;
@Repository
public interface ClientRepo extends JpaRepository<ClientEntity, Integer> {

}
