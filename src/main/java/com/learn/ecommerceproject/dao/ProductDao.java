package com.learn.ecommerceproject.dao;

import com.learn.ecommerceproject.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ProductDao {

    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveProduct(Product product) {
        boolean f = false;
        try {
            Session session = this.factory.openSession();
            Transaction trx = session.beginTransaction();

            session.save(product);

            trx.commit();
            session.close();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
            f = false;
        }
        return f;
    }

    public List<Product> getAllProducts() {
        Session session = this.factory.openSession();
        Query query = session.createQuery("from Product");
        List<Product> list = query.list();
        session.close();
        return list;
    }

//    get Product By CategoryId
    public List<Product> getProductByCategoryId(int cId) {
        Session session = this.factory.openSession();
        Query query = session.createQuery("from Product as p where p.category.categoryId =: id");
        query.setParameter("id", cId);
        List<Product> list = query.list();
        return list;
    }
}
