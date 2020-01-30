class StudentsController < ApplicationController
  before_action :set_student , only: [:show, :edit, :update, :destroy]
  def index
    @student = Student.all
  end

  def show
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_path, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def edit
    @nomes = current_user.cria_opcao if current_user.student.iduff.nil?
    @student = current_user.student
  end
  private
  def student_params
    params.require(:student).permit(:nome, :matricula, :email)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end

