/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.Serializable;
import java.util.List;

/**
 * This Interface used for Generic Type to All Dao
 * 
 * @author JOE
 * @param <T> is DataType to all Dao
 */
public interface IGeneric<T> {

    /**
     * This function used for save, update, delete, get data from table include
     * get all, search and getById by : Bootcamp34
     *
     * @param entity is Object datatype
     * @param field is String datatype
     * @param keyword is String datatype
     * @param id is Serializable datatype
     * @param isGet is boolean datatype
     * @param isData is boolean datatype
     * @return to list
     */
    public List<T> manageData(T entity, String field, String keyword, Serializable id, boolean isGet, boolean isData);

}
