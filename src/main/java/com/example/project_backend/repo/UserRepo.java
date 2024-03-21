package com.example.project_backend.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.project_backend.entity.User;

public interface UserRepo extends JpaRepository<User, Integer>{


}
