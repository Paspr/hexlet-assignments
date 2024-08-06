require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  def setup
    Task.delete_all
    @task = Task.create(
      name: Faker::Name.name,
      description: Faker::Books::Dune.planet,
      status: 'new',
      creator: Faker::Name.unique.name,
      performer: Faker::Name.unique.name,
      completed: false
    )
  end
  test 'test_create' do
    @task = Task.new(
      name: Faker::Name.name,
      description: Faker::Books::Dune.planet,
      status: 'new',
      creator: Faker::Name.unique.name,
      performer: Faker::Name.unique.name,
      completed: false
    )
    assert_equal(@task.valid?, true)
  end

  test 'test_show' do
    get task_path(@task)
    assert_response :success
  end

  test 'test_update' do
    patch task_path(@task), params: { id: @task.id, task: { name: 'Task 3' } }
    @task.reload
    assert_equal 'Task 3', @task.name
  end

  test 'test_delete' do
    delete task_path(@task)
    assert_equal(0, Task.count)
  end
end
