package com.chumeng.springboot.controller;

import com.chumeng.springboot.dao.UsesDao;
import com.chumeng.springboot.entity.StatusCodeAndMessage;
import com.chumeng.springboot.entity.Uses;
import com.chumeng.springboot.service.UsesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindException;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author chumeng
 * @date 2022/7/29 11:08
 */
@RestController
public class UsesController {
    private UsesDao usesDao;
    private UsesService usesService;

    public UsesService getUsesService() {
        return usesService;
    }

    @Autowired
    public void setUsesService(UsesService usesService) {
        this.usesService = usesService;
    }

    public UsesDao getUsesDao() {
        return usesDao;
    }

    @Autowired
    public void setUsesDao(UsesDao usesDao) {
        this.usesDao = usesDao;
    }

    @GetMapping("getAllUses")
    public List<Uses> getAll(){
        return usesDao.findAll();
    }

//    @PostMapping("addUses")
//    public StatusCodeAndMessage<Uses> addUses(@Valid Uses uses, BindingResult bindingResult) {
//        if (bindingResult.hasErrors()) {
////            System.out.println(bindingResult.getFieldError().getDefaultMessage());
//            System.out.println(bindingResult.getAllErrors().get(0).getDefaultMessage());
////            return null;
//            return new StatusCodeAndMessage<>(0, bindingResult.getAllErrors().get(0).getDefaultMessage(), null);
//        }
//        return new StatusCodeAndMessage<>(1, "success", usesDao.save(uses));
//    }

    @PostMapping("addUses")
    public StatusCodeAndMessage<Uses> addUses(@Validated Uses uses) {
        return new StatusCodeAndMessage<>(1, "success", usesDao.save(uses));
    }

    @ExceptionHandler(BindException.class)
    public StatusCodeAndMessage<Uses> testExceptionHandler(BindException e){
        System.out.println("exceptionHandler");
        return new StatusCodeAndMessage<>(0, e.getAllErrors().get(0).getDefaultMessage(), null);
    }


    @GetMapping("uses/{id}")
    public Uses usesFindOne(@PathVariable("id") Integer id) {
        return usesDao.findById(id).orElse(null);
    }

    @PutMapping("uses/{id}")
    public Uses update(@PathVariable("id") Integer id,String name,int age) {
        return usesDao.save(new Uses(id,name,age));
    }

    @DeleteMapping("/delete/{id}")
    public void delete(@PathVariable("id") Integer id) {
        usesDao.deleteById(id);
    }

    @GetMapping("uses/age/{age}")
    public List<Uses> findById(@PathVariable("age") int age) {
        return usesDao.findByAge(age);
    }

    @PostMapping("uses/two")
    public void insertTwo(){
        usesService.insertTwo();
    }
}
