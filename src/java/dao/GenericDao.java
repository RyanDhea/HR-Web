/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Transaction;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import tools.HibernateUtil;

/**
 *
 * @author JOE
 */
public class GenericDao<T> implements IGeneric<T> {

    private SessionFactory factory;

    public GenericDao() {
        this.factory = HibernateUtil.getSessionFactory();
    }

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
    @Override
    public List<T> manageData(T entity, String field, String keyword, Serializable id, boolean isGet, boolean isData) {
        Session session = factory.openSession();
        List<T> model = new ArrayList<>();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            if (isGet) {
                T data = (T) session.get(entity.getClass(), id);
                if (isData) {
                    session.delete(data);
                } else {
                    session.saveOrUpdate(entity);
                }
                transaction.commit();
                return model;
            } else {
                String hql = (isData) ? "FROM " + entity.getClass().getSimpleName() + " where Upper(" + field + ") like :keyword"
                        : "FROM " + entity.getClass().getSimpleName() + " where " + field + " = :keyword";
                Query query = session.createQuery(hql);
                query = (isData) ? query.setString("keyword", "%" + keyword.toUpperCase() + "%") : query.setString("keyword", keyword);
                model = query.list();
                if (model.isEmpty()) {
                    return null;
                }
                transaction.commit();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return model;
    }
}
