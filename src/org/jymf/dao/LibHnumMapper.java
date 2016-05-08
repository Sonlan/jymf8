package org.jymf.dao;

import java.util.List;

import org.jymf.entity.LibHnum;

public interface LibHnumMapper {
   
    List<LibHnum> findAll();
 
    void insertHnum(LibHnum libHnum);
    
}