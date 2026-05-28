package org.example.mapper;

import org.apache.ibatis.annotations.Param;
import org.example.pojo.Books;

import java.util.List;

public interface BooksMapper {
    //增加一本书
    int addBook(Books books);
    //删除一本书
    int deleteBookById(@Param("bookId") int id);
    //更新一本书
    int updateBook(Books books);
    //查询一本书
    Books selectBookById(@Param("bookId") int id);
    //查询全部的书
    List<Books> selectAllBook();
//    搜索框查询
    Books selectBookByName(@Param("bookName") String bookName);
}
