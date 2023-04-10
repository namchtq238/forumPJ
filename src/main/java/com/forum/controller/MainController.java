package com.forum.controller;

import com.forum.model.Category;
import com.forum.model.User;
import com.forum.service.ForumService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@AllArgsConstructor
public class MainController {
    private ForumService forumService;

    @GetMapping("/login")
    public String login(){
        return "login";
    }
    @PostMapping("/login")
    @ResponseBody
    public ResponseEntity<?> handleLogin(HttpSession session,
                                         @RequestParam("username") String username,
                                         @RequestParam("password") String password){
        User user = forumService.checkUser(username, password);
        if(user != null){
            session.setAttribute("user", user);
            return ResponseEntity.ok("ok");
        }
        return ResponseEntity.badRequest().build();
    }
    @GetMapping("/test")
    public String test(HttpSession session){
        User user = (User) session.getAttribute("user");
        if (user == null){
            return "redirect:/login";
        }
        return "pro";
    }


    @PostMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/login";
    }

    @GetMapping("/home")
    public String listTopic(Model model){
        Category category = forumService.getCategory();
        model.addAttribute("category", category);
        model.addAttribute("topic", forumService.getListTopic(category));
        return "list-topic";
    }
    @PostMapping("/api/show-topic")
    @ResponseBody
    public ResponseEntity<?> handleShowTopic(){
//        User user = forumService.checkUser(username, password);
//        if(user != null){
//            session.setAttribute("user", user);
//            return ResponseEntity.ok("ok");
//        }
        return ResponseEntity.ok("ok");
    }
}
