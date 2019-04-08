package pl.coderslab.app;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
@Transactional
public class AuthorDao {

    @PersistenceContext
    private EntityManager entityManager;


    public void create(Author author) {
        entityManager.persist(author);
    }

    public Author read(Long id) {
        return entityManager.find(Author.class, id);
    }

    public void update(Author author) {
        entityManager.merge(author);
    }

    public void delete(Long id) {
        Author author = read(id);
        if (author != null) {
            entityManager.remove(author);
        }
    }
    
}
