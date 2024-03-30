package com.cavaliers.task_API.service;

import com.cavaliers.task_API.model.Task;
import com.cavaliers.task_API.repository.RepositoryTask;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServiceTask {
    @Autowired
    private RepositoryTask repositoryTask;

    public ServiceTask(RepositoryTask repositoryTask) {
        this.repositoryTask = repositoryTask;
    }

    public Task createTask(Task task){
        task.setActive(true);
        return repositoryTask.save(task);
    }
    public Task getById(Integer id){
        return repositoryTask.findById(id).get();
    }
    public List<Task> getAllTask(){
        return repositoryTask.findAll();
    }
    public void deleteTask(Integer id){
        repositoryTask.deleteById(id);
    }
    public Task updateTask(Integer id, Task task){
        Task up = repositoryTask.findById(id).get();
        up.setDescription(task.getDescription());
        up.setTitre(task.getTitre());
        return repositoryTask.save(up);
    }
    public Task activeOrDisactivate(Integer id){
        Task up = repositoryTask.findById(id).get();
        up.setActive(!up.isActive());
        return repositoryTask.save(up);
    }
    public List<Task> getByActive(Boolean active){
        return repositoryTask.getByActive(active);
    }
}
