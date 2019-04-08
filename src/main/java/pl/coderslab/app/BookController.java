package pl.coderslab.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/books")
public class BookController {

    private final BookDao bookDao;

    @Autowired
    public BookController(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    @GetMapping("/create")
    @ResponseBody
    public String create() {
        Book book = new Book();
        book.setAuthor("Bruce Eckel");
        book.setTitle("Thinking in Java");
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
}
