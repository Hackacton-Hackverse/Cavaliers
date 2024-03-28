package com.cavaliers.task_API.controller;

import com.cavaliers.task_API.model.Task;
import com.cavaliers.task_API.service.ServiceTask;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping
@CrossOrigin("*")
public class ControllerTask {
    @Autowired
    private ServiceTask serviceTask;

    @PostMapping(path = "/task/create")
    public Task create(@RequestBody Task task){
        return serviceTask.createTask(task);
    }
    @GetMapping(path = "/task/{id}")
    public Task getTaskById(@PathVariable Integer id){
        return serviceTask.getById(id);
    }
    @GetMapping(path = "/task/active")
    public List<Task> getActiveTask(){
        return serviceTask.getByActive(true);
    }
    @GetMapping(path = "/task/deactivate")
    public List<Task> getDeactivateTask(){
        return serviceTask.getByActive(false);
    }
    @GetMapping(path = "/task")
    public List<Task> getAllTask(){
        return serviceTask.getAllTask();
    }
    @PutMapping(path = "/task/{id}")
    public Task updateTask(@PathVariable Integer id,@RequestBody Task task){
        return serviceTask.updateTask(id, task);
    }

    @PutMapping(path = "/task/action/{id}")
    public Task activate_or_deactivateTask(@PathVariable Integer id){
        return serviceTask.activeOrDisactivate(id);
    }
    @DeleteMapping(path = "/task/{id}")
    public String deleteTask(@PathVariable Integer id){
        serviceTask.deleteTask(id);
        return "DELETE TASK SUCCESSFUL";
    }
}