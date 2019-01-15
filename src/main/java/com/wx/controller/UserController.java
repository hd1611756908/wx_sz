package com.wx.controller;

import com.wx.entity.User;
import com.wx.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class UserController {

    private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @PostMapping("/addUser")
    public String addUser(@RequestBody User user){
        LOGGER.info("user={}",user);
        int row = userService.addUser(user);
        if(row>0){
            return "ok";
        }else {
            return "fail";
        }
    }

    @GetMapping("/deleteUserById")
    public String deleteUserById(Integer id){
        int row = userService.deleteUserById(id);
        if(row>0){
            return "ok";
        }else {
            return "fail";
        }
    }

    @PostMapping("/updateUser")
    public String updateUser(@RequestBody User user){
        LOGGER.info("user={}",user);
        int row = userService.updateUser(user);
        if(row>0){
            return "ok";
        }else {
            return "fail";
        }
    }

    @GetMapping("/queryUserList")
    public List<User> queryUserList(){
        return userService.queryUserList();
    }

    @GetMapping("/queryUserById")
    public User queryUserById(Integer id){
        return userService.queryUserById(id);
    }
}