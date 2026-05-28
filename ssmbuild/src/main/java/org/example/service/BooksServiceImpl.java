package org.example.service;

import org.example.mapper.BooksMapper;
import org.example.pojo.Books;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BooksServiceImpl implements BooksService {

    // service调mapper层；组合mapper
    @Autowired  // ← 添加这个注解，让Spring自动注入
    private BooksMapper booksMapper;

    // 如果使用setter注入，也需要加@Autowired
    // @Autowired
    // public void setBooksMapper(BooksMapper booksMapper) {
    //     this.booksMapper = booksMapper;
    // }

    @Override
    public int addBook(Books books) {
        return booksMapper.addBook(books);
    }

    @Override
    public int deleteBookById(int id) {
        return booksMapper.deleteBookById(id);
    }

    @Override
    public int updateBook(Books books) {
        return booksMapper.updateBook(books);
    }

    @Override
    public Books selectBookById(int id) {
        return booksMapper.selectBookById(id);
    }

    @Override
    public List<Books> selectAllBook() {
        return booksMapper.selectAllBook();
    }

    @Override
    public Books selectBookByName(String bookName) {
        return booksMapper.selectBookByName(bookName);
    }
}