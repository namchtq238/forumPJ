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

import java.time.Instant;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.Optional;
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

    public List<Topic> getListTopic() {
        return topicRepository.findAllByCategory(getCategory()); // get the first message or null
    }
    public Topic getTopicByID(Long id){
        return getTopic(id);
    }
    private Topic getTopic(Long id){
        Optional<Topic> opt = topicRepository.findById(id);
        return opt.orElse(null);
    }
    public List<Message> getMessageOfTopic(Long idTopic){
        Topic topic = getTopic(idTopic);
        return messageRepository.findMessageByTopicOrderByCreatedTimeAsc(topic);
    }

    public Topic createNewTopic(Topic topic, User user) {
        topic.setCreator(user);
        topic.setCreatedTime(LocalDateTime.now());
        topic.setCategory(this.getCategory());
        return topicRepository.save(topic);
    }
}
