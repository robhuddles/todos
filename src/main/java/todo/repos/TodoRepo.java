package todo.repos;

import java.util.List;
 
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import todo.models.Todo;

public interface TodoRepo  extends CrudRepository<Todo,Integer> {

	 @Query("SELECT t FROM Todo t")
	 List<Todo> getTodos();
	 
	 @Query("SELECT t FROM Todo t order by id desc")
	 List<Todo> getRecentTodos();
	 
	 @Query("SELECT t FROM Todo t WHERE upper(t.text) like ?1 order by id desc")
	 List<Todo> getTodosByText(String text);

}
