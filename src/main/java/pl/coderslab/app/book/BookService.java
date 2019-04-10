package pl.coderslab.app.book;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class BookService {

    @Autowired
    private BookDao bookDao;

    public void create(Book book) {
        bookDao.create(book);
    }

    public Book read(Long id) {
        return bookDao.read(id);
    }

    public Book readWithAuthors(Long id) {
        Book book = bookDao.read(id);
        Hibernate.initialize(book.getAuthors());
        return book;
    }

    public void update(Book book) {
        bookDao.update(book);
    }

    public void delete(Long id) {
        bookDao.delete(id);
    }

    public List<Book> findAll() {
        return bookDao.findAll();
    }

    public List<Book> findAllPropositions() {
        return bookDao.findAllPropositions();
    }

}
