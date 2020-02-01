class StudentsController < ApplicationController
  before_action :set_student , only: [:show, :edit, :update, :destroy]
  def index
    @student = Student.all
  end

  def show
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Seu IDUFF foi devidamente gerado' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_path, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def edit
    redirect_to student_path() unless current_user.student.iduff.nil?
    @nomes = current_user.cria_opcao if current_user.student.iduff.nil?
    @student = Student.find(params[:id])

  end
  private
  def student_params
    params.require(:student).permit(:nome, :matricula, :email, :iduff)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end

