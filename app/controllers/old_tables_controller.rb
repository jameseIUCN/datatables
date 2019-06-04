class OldTablesController < ApplicationController
  before_action :set_old_table, only: [:show, :edit, :update, :destroy]
  # GET /old_tables
  # GET /old_tables.json
  def index
    @old_tables = OldTable.all
    @old_tables = OldTable.paginate(page: params[:page], per_page: 10)
  end

  # GET /old_tables/1
  # GET /old_tables/1.json
  def show
  end

  # GET /old_tables/new
  def new
    @old_table = OldTable.new
  end

  def get_proccessed_old_data_table
    
    length = params[:length].to_i
    # length = 20
    start = params[:start].to_i
    draw = params[:draw].to_i
    columns = params[:columns]
    recordsFiltered = params[:recordsFiltered]
    
    # @old_tables = OldTable.take(length)
    recordsTotal = OldTable.count  
    # render json: { old_table: @old_tables(only: [:title, :username, :name, :email, :hometown] )}
    @old_tables = OldTable.limit(length)
    # respond_to do |format|
    #   format.json { render json: @old_tables.as_json(only: [:title, :username, :name, :email, :hometown]) }
    # end

    # respond_to do |format|
    #   format.json { render json: @old_tables.as_json(only: [:title, :username, :name, :email, :hometown])
    #   # draw: params['draw'].to_i
    #   # recordsTotal = OldTable.count,
    #   # recordsFiltered = OldTables.all
    # }
    
=begin      
      respond to JSON
      build the JSON manually and inserting dynamic values in from params above 
=end
    
    respond_to do |format|
      # { render json: @old_tables.as_json(only: [:title, :username, :name, :email, :hometown]) }
      format.json do
        
          # output = @old_tables.as_json(only: [:title, :username, :name, :email, :hometown])
          # response = ({draw: params['draw'], recordsTotal: OldTable.count})
          config = { 
            "draw": draw,
            # "columns": @old_tables.as_json(only: [:title, :username, :name, :email, :hometown]) },
            # columns = @old_tables.as_json
            "columns":{ 
              "data":  @old_tables.as_json(only: [:title]),
              "name": "name",
              "searchable": "true", 
              "orderable": "true",
              "search":{
                "value": "", 
                "regex": "false"
                },
                draw: draw,
            }
          }
          
       # "test": @old_tables.as_json(only: [:title, :username, :name, :email, :hometown])
           render json: config 
      end
    end

  end
  # GET /old_tables/1/edit
  def edit
  end

  # POST /old_tables
  # POST /old_tables.json
  def create
    @old_table = OldTable.new(old_table_params)

    respond_to do |format|
      if @old_table.save
        format.html { redirect_to @old_table, notice: 'Old table was successfully created.' }
        format.json { render :show, status: :created, location: @old_table }
      else
        format.html { render :new }
        format.json { render json: @old_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /old_tables/1
  # PATCH/PUT /old_tables/1.json
  def update
    respond_to do |format|
      if @old_table.update(old_table_params)
        format.html { redirect_to @old_table, notice: 'Old table was successfully updated.' }
        format.json { render :show, status: :ok, location: @old_table }
      else
        format.html { render :edit }
        format.json { render json: @old_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /old_tables/1
  # DELETE /old_tables/1.json
  def destroy
    @old_table.destroy
    respond_to do |format|
      format.html { redirect_to old_tables_url, notice: 'Old table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_old_table
      @old_table = OldTable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def old_table_params
      params.require(:old_table).permit(:title, :name, :username, :email, :hometown)
    end
end
