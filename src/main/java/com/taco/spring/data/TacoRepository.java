package com.taco.spring.data;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.taco.spring.model.Taco;

@Repository
public interface TacoRepository extends JpaRepository<Taco, Long> {

}
