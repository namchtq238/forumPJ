package com.forum.controller;

import com.forum.model.Category;
import com.forum.model.Message;
import com.forum.model.Topic;
import com.forum.model.User;
import com.forum.service.ForumService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

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

    @PostMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/login";
    }

    @GetMapping("/home")
    public String listTopic(Model model, HttpServletRequest request){
        if (!isUserLoggedIn(request)) return "redirect:/login";
        Category category = forumService.getCategory();
        model.addAttribute("category", category);
        return "list-topic";
    }
    @GetMapping("/api/list-topic")
    @ResponseBody
    public ResponseEntity<?> handleShowTopic(){
        return ResponseEntity.ok(forumService.getListTopic());
    }
    @GetMapping("/api/detail-topic")
    @ResponseBody
    public ResponseEntity<?> handleGetDetail(@RequestParam Long id){
        return ResponseEntity.ok(forumService.getMessageOfTopic(id) );
    }
    @GetMapping("/detail-topic")
    public String detail(@RequestParam Long id, Model model, HttpServletRequest request){
        if (!isUserLoggedIn(request)) return "redirect:/login";
        Topic topic = forumService.getTopicByID(id);
        List<Message> messsage = forumService.getMessageOfTopic(id);
        model.addAttribute("topic", topic);
        model.addAttribute("repCount", messsage.size());
        model.addAttribute("topMessage", messsage.get(0));
        return "detail-topic";
    }
    @GetMapping("/create-topic")
    public String createTopic(HttpServletRequest request){
        if (!isUserLoggedIn(request)) return "redirect:/login";
        return "new-topic";
    }
    @GetMapping("/reply-topic")
    public String replyTopic(Model model, @RequestParam Long id, HttpServletRequest request){
        if (!isUserLoggedIn(request)) return "redirect:/login";
        Topic topic = forumService.getTopicByID(id);
        model.addAttribute("title", "RE: " + topic.getTitle());
        model.addAttribute("id", topic.getId());
        return "new-message";
    }
    @PostMapping("/api/create-topic")
    @ResponseBody
    public ResponseEntity<?> handleCreateTopic(@RequestParam String title,
                                               @RequestParam String contentmsg,
                                               HttpServletRequest request){
        return ResponseEntity.accepted()
                .body(forumService.createNewTopic(title, contentmsg, getUser(request)));
    }
    @PostMapping("/api/reply-topic")
    @ResponseBody
    public ResponseEntity<?> handleReplyTopic(@RequestParam String title,
                                              @RequestParam String contentmsg,
                                              @RequestParam Long idTopic,
                                              HttpServletRequest request){
        return ResponseEntity.accepted()
                .body(forumService.replyTopic(title, contentmsg, getUser(request), idTopic));
    }

    private boolean isUserLoggedIn(HttpServletRequest request){
        return request.getSession(false).getAttribute("user") != null;
    }
    private User getUser(HttpServletRequest request){
        return (User) request.getSession(false).getAttribute("user");
    }

}
