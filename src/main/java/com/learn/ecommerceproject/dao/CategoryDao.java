package com.learn.ecommerceproject.dao;

import com.learn.ecommerceproject.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CategoryDao {

    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }

    public int saveCategoryDetails(Category cat) {
        Session session = this.factory.openSession();
        Transaction trx = session.beginTransaction();

        int catId = (int) session.save(cat);

        trx.commit();
        session.close();

        return catId;
    }

    public List<Category> getCategories() {
        Session session = this.factory.openSession();
        Query query = session.createQuery("from Category");
        List<Category> list = query.list();
        return list;

    }

    public Category getCategoryById(int cid) {
        Category cat=null;
        try {
            Session session = this.factory.openSession();
            cat = session.get(Category.class, cid);
            
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat;
    }
}
