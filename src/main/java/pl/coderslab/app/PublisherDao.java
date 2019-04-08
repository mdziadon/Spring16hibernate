package pl.coderslab.app;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
@Transactional
public class PublisherDao {

    @PersistenceContext
    private EntityManager entityManager;


    public void create(Publisher publisher) {
        entityManager.persist(publisher);
    }

    public Publisher read(Long id) {
        return entityManager.find(Publisher.class, id);
    }

    public void update(Publisher publisher) {
        entityManager.merge(publisher);
    }

    public void delete(Long id) {
        Publisher publisher = read(id);
        if (publisher != null) {
            entityManager.remove(publisher);
        }
    }
    
}
