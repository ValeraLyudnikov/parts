package com.test.parts.dao;

import com.test.parts.model.Parts;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

@Repository
public class PartsDaoImpl implements PartsDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void save(Parts parts) {
        sessionFactory.getCurrentSession().save(parts);
    }

    @Override
    public List<Parts> getAllFromParts() {
        @SuppressWarnings("unchecked")
        TypedQuery<Parts> query = sessionFactory.getCurrentSession().createQuery("from Parts");
        return query.getResultList();
    }

    @Override
    public List<Parts> getAllFromPartsLimited(int pageNumber) {
        @SuppressWarnings("unchecked")
        TypedQuery<Parts> query = sessionFactory.getCurrentSession().createQuery("from Parts");
        query.setFirstResult(pageNumber * 10 - 10);
        query.setMaxResults(10);
        return query.getResultList();
    }

    @Override
    public List<Parts> getPartsByFilter(String filter) {
        @SuppressWarnings("unchecked")
        List<Parts> parts = new ArrayList<>();
        switch (filter) {
            case "all":
                parts = getAllFromParts();
                break;
            case "necessary": {
                Session session = sessionFactory.getCurrentSession();
                CriteriaBuilder cb = session.getCriteriaBuilder();
                CriteriaQuery<Parts> cr = cb.createQuery(Parts.class);
                Root<Parts> root = cr.from(Parts.class);
                cr.select(root).where(cb.equal(root.get("necessity"), 1));
                Query<Parts> query = session.createQuery(cr);
                parts = query.getResultList();
                break;
            }
            case "unnecessary": {
                Session session = sessionFactory.getCurrentSession();
                CriteriaBuilder cb = session.getCriteriaBuilder();
                CriteriaQuery<Parts> cr = cb.createQuery(Parts.class);
                Root<Parts> root = cr.from(Parts.class);
                cr.select(root).where(cb.equal(root.get("necessity"), 0));
                Query<Parts> query = session.createQuery(cr);
                parts = query.getResultList();
                break;
            }
        }

        return parts;
    }

    @Override
    public List<Parts> getSearchingParts(String text) {
        @SuppressWarnings("unchecked")
        List<Parts> parts = new ArrayList<>();
        System.out.println(text);
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder cb = session.getCriteriaBuilder();
        CriteriaQuery<Parts> cr = cb.createQuery(Parts.class);
        Root<Parts> root = cr.from(Parts.class);
        cr.select(root).where(cb.like(root.get("name"), "%" + text + "%"));
        Query<Parts> query = session.createQuery(cr);
        parts = query.getResultList();
        return parts;
    }

    @Override
    public int countAllParts() {
        @SuppressWarnings("unchecked")
        TypedQuery<Parts> query = sessionFactory.getCurrentSession().createQuery("from Parts");
        return query.getResultList().size();
    }

    @Override
    public Parts getPartById(Integer partId) {
        @SuppressWarnings("unchecked")
        Parts part = sessionFactory.getCurrentSession().get(Parts.class, partId);
        return part;
    }

    @Override
    public void updatePart(Parts part) {
    @SuppressWarnings("unchecked")
        Parts partUpdate = sessionFactory.getCurrentSession().get(Parts.class, part.getId());
        if(partUpdate.getId().equals(part.getId())) {
            partUpdate.setName(part.getName());
            partUpdate.setNecessity(part.getNecessity());
            partUpdate.setQuantity(part.getQuantity());
        }
        sessionFactory.getCurrentSession().update(partUpdate);
    }

    @Override
    public void deletePart(Integer partId) {
        Parts deletePart = sessionFactory.getCurrentSession().get(Parts.class, partId);
        if(deletePart != null && deletePart.getId().equals(partId)) {
            sessionFactory.getCurrentSession().delete(deletePart);
        }
    }

    @Override
    public int countPossibleComputers(List<Parts> parts) {
        int count = Integer.MAX_VALUE;
        for(Parts part : parts) {
            if(part.getNecessity()) {
                count = (part.getQuantity() < count) ? part.getQuantity() : count;
            }
        }

        count = (count == Integer.MAX_VALUE) ? 0 : count;

        return count;
    }

}
