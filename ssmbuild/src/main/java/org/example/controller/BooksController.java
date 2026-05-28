package org.example.controller;

import org.example.pojo.Books;
import org.example.service.BooksService;
import org.example.service.BooksServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/books")
public class BooksController {
    @Autowired
//    @Qualifier("BooksServiceImpl")
    private BooksService booksService;
//    返回全部书籍
    @RequestMapping("/selectAllBook")
    public String selectAllBooks(Model model){
        List<Books> books1 = booksService.selectAllBook();
        model.addAttribute("selectAllBooks",books1);
        return "selectAllBook";
    }
//    跳转到增加书籍页面
@RequestMapping("/toaddBook")
public String toaddBook(){
        return "addBook";
    }
//    增加书籍功能
@RequestMapping("/addBook")
public String addBook(Books books){
        booksService.addBook(books);
        return "redirect:/books/selectAllBook";
    }
//    删除书籍功能
@RequestMapping("/deleteBook")
public String deleteBook(@RequestParam("bookId") int id){
        booksService.deleteBookById(id);
        return "redirect:/books/selectAllBook";
    }
//    跳转到修改书籍页面
@RequestMapping("/toupdateBook")
public String toupdateBook(@RequestParam("bookId") int id,Model model){
        Books books = booksService.selectBookById(id);
        model.addAttribute("books",books);
        return "updateBook";
    }
//    修改书籍页面
@RequestMapping("/updateBook")
public String updateBook(Books books){
        booksService.updateBook(books);
        return "redirect:/books/selectAllBook";
    }
//    搜索框查询
@RequestMapping("/selectBookByName")

public String selectBookByName(String bookName,Model model){
        Books booksList = booksService.selectBookByName(bookName);
        List<Books> books1 = new ArrayList<>();
        if (booksList != null) {
            books1.add(booksList);  // 添加所有查询结果
        }
        model.addAttribute("books1",books1);
        return "selectAllBook";

    }



}
