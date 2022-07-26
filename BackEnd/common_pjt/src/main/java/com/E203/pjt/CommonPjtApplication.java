package com.E203.pjt;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

@SpringBootApplication
public class CommonPjtApplication{
  public static void main(String[] args){
//    EntityManagerFactory emf = Persistence.createEntityManagerFactory("");
//    EntityManager em = emf.createEntityManager();

    SpringApplication.run(CommonPjtApplication.class, args);
  }
}