class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
    respond_to do |format|
      format.html
      format.json do
        filter_people
        sort_people
        paginate_people
        render json: { data: @some_people, draw: params[:draw], recordsTotal: @people.count, recordsFiltered: @people.count }
     end
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:first_name, :last_name, :salary, :country, :birth_date, :pincode)
    end

    def filter_people
      if params[:search][:value].present?
        query = params[:search][:value]
        @people = @people.where("first_name LIKE ? OR last_name LIKE ? OR salary LIKE ? OR pincode LIKE ? OR birth_date LIKE ? OR country LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%","%#{query}%")
      end

      # filter by salary
      if params[:columns]['3'][:search][:value].present? && params[:columns]['3'][:search][:value] != 'all'
        query = params[:columns]['3'][:search][:value].split(' - ').map(&:to_i)
        @people = @people.where('salary > ? AND salary < ?', query.first, query.last)
      end

      # filter by region
      if params[:columns]['4'][:search][:value].present? && params[:columns]['4'][:search][:value] != 'all'
        @people = @people.where(region: params[:columns]['4'][:search][:value])
      end
    end

    def sort_people
      if params[:order]['0']
        direction = params[:order]['0'][:dir]
        case params[:order]['0'][:column]
        when '2'
          @people = @people.order(birth_date: direction)
        when '3'
          @people = @people.order(salary: direction)
        else
          @people = @people.order(created_at: :asc)
        end
      end
    end

    def paginate_people
      @some_people = []
      @some_people = @people.limit(params[:limit] || params[:length] || 10).offset(params[:offset] || params[:start] || 0)
    end
end
