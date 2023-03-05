package todo.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import todo.models.Todo;
import todo.repos.TodoRepo;

@Controller
public class TodoController {
	@Autowired
	private TodoRepo todoRepo;

	@RequestMapping(value = "/")
	public String home(ModelMap model) {
		List<Todo> todos = todoRepo.getRecentTodos();
		model.addAttribute("todos", todos.stream().limit(5).toArray());
		return "home";
	}

	@RequestMapping(value = "add")
	public String add(ModelMap model) {
		Todo todo = new Todo();
		model.addAttribute("todo", todo);
		return "add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(ModelMap model, Todo todo) {
		try {
			todoRepo.save(todo);
			return "redirect:/";
		} catch (Exception ex) {
			System.out.println(ex);
			model.addAttribute("todo", todo);
			model.addAttribute("message", "Sorry! Could not add todo entry. Please try again!");
			return "add";
		}
	}

	@RequestMapping(value = "list")
	public String list(ModelMap model) {
		List<Todo> todos = todoRepo.getTodos();
		model.addAttribute("todos", todos);
		return "list";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(ModelMap model, @PathVariable("id") int id) {
		Todo todo = todoRepo.findById(id).get();
		todoRepo.delete(todo);
		return "redirect:/";
	}

	@RequestMapping(value = "edit/{id}")
	public String edit(ModelMap model, @PathVariable("id") int id) {
		Todo todo = todoRepo.findById(id).get();
		model.addAttribute("todo", todo);
		return "edit";
	}

	@RequestMapping(value = "edit/{id}", method = RequestMethod.POST)
	public String edit(ModelMap model, Todo todo, @PathVariable("id") int id) {
		try {
			Todo dbTodo = todoRepo.findById(id).get();
			dbTodo.setText(todo.getText());
			dbTodo.setCompleted(todo.getCompleted());
			dbTodo.setDueDate(todo.getDueDate());
			todoRepo.save(dbTodo);
			return "redirect:/";
		} catch (Exception ex) {
			System.out.println(ex);
			model.addAttribute("todo", todo);
			model.addAttribute("message", "Sorry! Could not update entry. Please try again!");
			return "edit";
		}
	}

	@RequestMapping(value = "searchform")
	public String search() {
		return "search";
	}

	@RequestMapping(value = "search")
	public String search(String text, ModelMap model) {
		System.out.println(text);
		List<Todo> todos = todoRepo.getTodosByText("%" + text.toUpperCase() + "%");
		if (todos.size() > 0)
			model.addAttribute("todos", todos);
		else
			model.addAttribute("message", "Sorry! No items found!");
		return "search";
	}

}
