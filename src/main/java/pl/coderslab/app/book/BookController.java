package pl.coderslab.app.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.coderslab.app.author.Author;
import pl.coderslab.app.author.AuthorDao;
import pl.coderslab.app.publisher.Publisher;
import pl.coderslab.app.publisher.PublisherDao;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/books")
public class BookController {

    @Autowired
    private BookDao bookDao;

    @Autowired
    private PublisherDao publisherDao;

    @Autowired
    private AuthorDao authorDao;


    @GetMapping("/create")
    @ResponseBody
    public String create() {
        Book book = new Book();
        book.setTitle("Thinking in Java");

        Publisher publisher = new Publisher();
        publisher.setName("Wydawca 1");
        book.setPublisher(publisher);

        List<Author> list = new ArrayList<>();
        Author author = new Author();
        author.setFirstName("Bruce");
        author.setLastName("Eckel");

        list.add(author);
        book.setAuthors(list);

        authorDao.create(author);
        publisherDao.create(publisher);
        bookDao.create(book);
        return "Dodano książkę";
    }

    @GetMapping("/read/{id}")
    @ResponseBody
    public String read(@PathVariable Long id) {
        Book book = bookDao.read(id);
        if (book == null) {
            return "Brak danych";
        }
        return book.toString();
    }

    @GetMapping("/update/{id}")
    @ResponseBody
    public String update(@PathVariable Long id) {
        Book book = bookDao.read(id);
        if (book == null) {
            return "Brak danych";
        }
        book.setTitle("Thinking in Java 2");
        bookDao.update(book);
        return "Ksiazka zmodyfikowana";
    }

    @GetMapping("/delete/{id}")
    @ResponseBody
    public String delete(@PathVariable Long id) {
        bookDao.delete(id);
        return "Ksiazka usunieta";
    }


    @GetMapping
    @ResponseBody
    public String list() {
        List<Book> books = bookDao.findAll();
        return books.toString();
    }

}
