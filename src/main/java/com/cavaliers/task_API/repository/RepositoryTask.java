package com.cavaliers.task_API.repository;

import com.cavaliers.task_API.model.Task;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RepositoryTask extends JpaRepository<Task, Integer> {
    List<Task> getByActive(Boolean active);
}
