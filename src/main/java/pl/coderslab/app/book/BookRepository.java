package pl.coderslab.app.book;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookRepository extends JpaRepository<Book, Long> {

    List<Book> findByProposition(boolean proposition);

    List<Book> findByTitle(String title);

    List<Book> findByCategoryId(Long id);

    List<Book> findByAuthorsId(Long id);

    List<Book> findByPublisherId(Long id);

    List<Book> findByRating(double rating);

    Book findFirstByCategoryIdOrderByTitle(Long id);
}
