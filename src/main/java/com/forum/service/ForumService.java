package com.forum.service;

import com.forum.model.*;
import com.forum.repository.CategoryRepository;
import com.forum.repository.MessageRepository;
import com.forum.repository.TopicRepository;
import com.forum.repository.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
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

    public List<TopicDTO> getListTopic() {
        List<Topic> lst =  topicRepository.findAllByCategory(getCategory()); // get the first message or null
        return lst.stream().map(topic -> {
            TopicDTO dto = new TopicDTO();
            dto.setId(topic.getId());
            dto.setCategory(topic.getCategory());
            dto.setCreator(topic.getCreator());
            dto.setContent(topic.getContent());
            dto.setTitle(topic.getTitle());
            dto.setCreatedTime(topic.getCreatedTime());
            List<Message> msg = messageRepository.findMessageByTopicOrderByCreatedTimeAsc(topic);
            dto.setMessages(msg);
            return dto;
        }).collect(Collectors.toList());
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

    public Topic createNewTopic(String title, String content, User user) {
        Topic topic = new Topic();
        topic.setTitle(title);
        topic.setContent(content);
        topic.setCreator(user);
        topic.setCreatedTime(LocalDateTime.now());
        topic.setCategory(this.getCategory());
        return topicRepository.save(topic);
    }
    public Message replyTopic(String title, String content, User user, Long id) {
        Message msg = new Message();
        msg.setTitle(title);
        msg.setContent(content);
        msg.setCreator(user);
        msg.setCreatedTime(LocalDateTime.now());
        msg.setTopic(this.getTopicByID(id));
        return messageRepository.save(msg);
    }

}
