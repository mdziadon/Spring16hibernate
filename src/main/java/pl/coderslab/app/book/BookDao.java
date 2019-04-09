package pl.coderslab.app.book;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
@Transactional
public class BookDao {

    @PersistenceContext
    private EntityManager entityManager;


    public void create(Book book) {
        entityManager.persist(book);
    }

    public Book read(Long id) {
        return entityManager.find(Book.class, id);
    }

    public void update(Book book) {
        entityManager.merge(book);
    }

    public void delete(Long id) {
        Book book = read(id);
        if (book != null) {
            entityManager.remove(book);
        }
    }

    public List<Book> findAll() {
        Query query = entityManager.createQuery("select b from Book b join fetch b.authors");
        List<Book>  books = query.getResultList();
        return books;
    }

}
