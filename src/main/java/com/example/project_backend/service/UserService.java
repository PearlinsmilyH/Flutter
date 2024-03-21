package com.example.project_backend.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project_backend.entity.User;
import com.example.project_backend.repo.UserRepo;

@Service
public class UserService {

    @Autowired
    private UserRepo repo;

    public String saveUser(User user) {

        repo.save(user);
        return "User registered Successfully";
    }
}
