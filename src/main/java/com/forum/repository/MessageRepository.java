package com.forum.repository;

import com.forum.model.Message;
import com.forum.model.Topic;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MessageRepository extends JpaRepository<Message, Long> {
    List<Message> findMessageByTopicOrderByCreatedTimeAsc(Topic topic);
}
