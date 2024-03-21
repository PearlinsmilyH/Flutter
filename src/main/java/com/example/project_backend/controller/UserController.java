package com.example.project_backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.project_backend.entity.User;
import com.example.project_backend.service.UserService;

@RestController
@CrossOrigin
public class UserController {


    @Autowired
    private UserService service;

    @PostMapping("/register")
    private ResponseEntity<String> registerUser(@RequestBody User user){
        //save the user
        String msg = service.saveUser(user);

        return new ResponseEntity<String>(msg,HttpStatus.OK);
    }





}
