package com.ojas;

import java.util.Optional;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

import com.ojas.entity.BookEntity;
import com.ojas.repo.BookRepo;

@SpringBootApplication
public class SpringJpaBookApplication {

	public static void main(String[] args) {
		ConfigurableApplicationContext ctx = SpringApplication.run(SpringJpaBookApplication.class, args);
		BookRepo daoimpl = ctx.getBean(BookRepo.class);
		BookEntity be = new BookEntity();
		be.setBid(100);
		be.setBname("testing");
		be.setAuthor("james Gosling");
		be.setPrice(1000);
		// save() method to save and update the details
		// return type is entity
		BookEntity book = daoimpl.save(be);
		if (book != null) {
			System.out
					.println(book.getBid() + "\t" + book.getBname() + "\t" + book.getAuthor() + "\t" + book.getPrice());
		} else {
			System.out.println("Not added....");
		}
		Iterable<BookEntity> allbooks = daoimpl.findAll();
		System.out.println("--------------All books Details-----------");
		for (BookEntity bk : allbooks) {
			System.out.println(bk.getBid() + "\t" + bk.getBname() + "\t" + bk.getPrice() + bk.getAuthor());

		}
		// existById method it returns boolean value
		boolean b = daoimpl.existsById(100);
		System.out.println("---------------existById--------------");
		if (b) {
			System.out.println("Book is present in the list");
		} else {
			System.out.println("No book with this id...");
		}
		// Optional<T> findById(ID id);
		// findById method gets book by id
		Optional<BookEntity> bk = daoimpl.findById(100);
		System.out.println("------------findById------------------");

		System.out.println(bk);
	}

}
