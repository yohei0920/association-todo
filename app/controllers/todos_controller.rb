class TodosController < ApplicationController
    http_basic_authenticate_with name: 'you', password: 'secret', only: :destroy

    def create
        @category = Category.find(params[:category_id])
        @todo = @category.todos.create(todo_params)
        redirect_to category_path(@category)
    end

    def destroy
        @category = Category.find(params[:category_id])
        @todo = @category.todos.find(params[:id])
        @todo.destroy
        redirect_to category_path(@category)
    end

    private
    def todo_params
        params.require(:todo).permit(:body)
    end
end
