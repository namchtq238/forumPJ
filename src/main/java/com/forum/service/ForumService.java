package com.forum.service;

import com.forum.model.Category;
import com.forum.model.Message;
import com.forum.model.Topic;
import com.forum.model.User;
import com.forum.repository.CategoryRepository;
import com.forum.repository.MessageRepository;
import com.forum.repository.TopicRepository;
import com.forum.repository.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class ForumService {
    private UserRepository userRepository;
    private CategoryRepository categoryRepository;
    private MessageRepository messageRepository;
    private TopicRepository topicRepository;

    public User checkUser(String username, String password){
        User user = userRepository.findUserByUsername(username);
        if (user != null && password.equals(user.getPassword())) {
            return user;
        }
        return null;
    }

    public Category getCategory() {
        return categoryRepository.findFirstBy();
    }

    public List<Topic> getListTopic(Category category) {
        return topicRepository.findAllByCategory(category); // get the first message or null
    }
}
