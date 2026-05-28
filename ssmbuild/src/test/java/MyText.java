import org.example.pojo.Books;
import org.example.service.BooksService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MyText {
    @Test
    public void test(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        BooksService booksServiceImpl = (BooksService) context.getBean("BooksServiceImpl");
        for (Books books : booksServiceImpl.selectAllBook()) {
            System.out.println(books);
        }

    }
}
