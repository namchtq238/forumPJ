package com.forum.repository;

import com.forum.model.Category;
import com.forum.model.Message;
import com.forum.model.Topic;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TopicRepository extends JpaRepository<Topic, Long> {
    List<Topic> findAllByCategory(Category category);

}
