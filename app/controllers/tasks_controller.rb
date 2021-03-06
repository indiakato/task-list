class TasksController < ApplicationController
    def index
        @tasks = Task.all 
    end

    def show
        task_id = params[:id]
        @task = Task.find_by(id: task_id)
        if @task.nil?
            redirect_to tasks_path
            return
        end
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(name: params[:task][:name], description: params[:task][:description], completed_at: params[:task][:completed_at])
        if @task.save
            redirect_to task_path(@task)
            return
        else
            render :new
            return
        end
    end

    def edit
        @task = Task.find_by(id: params[:id])

        if @task.nil?
            redirect_to tasks_path
            return
        end
    end

    def update
        @task = Task.find_by(id: params[:id])
        if @task.nil?
            redirect_to tasks_path
            return
        elsif @task.update(
            name: params[:task][:name],
            description: params[:task][:description],
            completed_at: params[:task][:completed_at]
        )
            redirect_to task_path(@task)
            return
        else
            render :edit
            return
        end
    end

    def destroy
        task_id = params[:id]
        @task = Task.find_by(id: task_id)

        if @task.nil?
            head :not_found
            return
        end

        @task.destroy

        redirect_to tasks_path
        return
    end

    def complete
        task_id = params[:id]
        @task = Task.find_by(id: task_id)

        if @task.nil?
            redirect_to tasks_path
            return
        else
            time = Time.now
            @task.update(completed_at: time)
            redirect_to tasks_path
            return
        end
    end
end
