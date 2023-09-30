class Test

  def initialize(name)
    @name = name
  end

  def test_put_todo
    todo = Todo.find(1)
    todo.title_with_status
  end
end
