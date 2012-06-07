class MetricsController < ApplicationController
  before_filter :authorize, except: [:stats]

  # curl -s -d "value=Ola1c&metric_id=3" http://localhost:3000/api/stats
  def stats
    value = params[:value]
    metric = Metric.find(params[:metric_id])

    if metric.value_type == "integer"
      metric.update_attribute(:integer_value, value)
    elsif metric.value_type == "knob"
      metric.update_attribute(:integer_value, value)
    elsif metric.value_type == "line"
      metric.update_attribute(:decimal_value, value)
      value = metric.values.create(decimal_value: value)
    else # string and default
      metric.update_attribute(:string_value, value)
    end

    render xml: value
  end

  # GET /metrics
  # GET /metrics.json
  def index
    @metrics = Metric.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @metrics }
    end
  end

  # GET /metrics/1
  # GET /metrics/1.json
  def show
    @metric = Metric.find(params[:id])

    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.js { render partial: 'widget', locals: { object: @metric }, layout: nil }
    #   format.json { render json: @metric }
    # end
    render partial: 'widget', locals: { metric: @metric }#, layout: nil
  end

  # GET /metrics/new
  # GET /metrics/new.json
  def new
    @metric = Metric.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @metric }
    end
  end

  # GET /metrics/1/edit
  def edit
    @metric = Metric.find(params[:id])
  end

  # POST /metrics
  # POST /metrics.json
  def create
    @metric = Metric.new(params[:metric])

    respond_to do |format|
      if @metric.save
        format.html { redirect_to @metric, notice: 'Metric was successfully created.' }
        format.json { render json: @metric, status: :created, location: @metric }
      else
        format.html { render action: "new" }
        format.json { render json: @metric.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /metrics/1
  # PUT /metrics/1.json
  def update
    @metric = Metric.find(params[:id])

    respond_to do |format|
      if @metric.update_attributes(params[:metric])
        format.html { redirect_to metrics_path, notice: 'Metric was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @metric.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /metrics/1
  # DELETE /metrics/1.json
  def destroy
    @metric = Metric.find(params[:id])
    @metric.destroy

    respond_to do |format|
      format.html { redirect_to metrics_url }
      format.json { head :no_content }
    end
  end

  def sort
    position = params[:position].to_i + 1
    dashboard = Dashboard.find(params[:dashboard_id])
    dashboard.metrics.order(:position).each_with_index { |metric, i| metric.update_attribute(:position, i + 1) }
    dashboard.metrics.find(params[:metric_id]).insert_at(position)
    render nothing: true
  end

  def move_higher
    dashboard = Dashboard.find(params[:dashboard_id])
    dashboard.metrics.order(:position).each_with_index { |metric, i| metric.update_attribute(:position, i + 1) }
    dashboard.metrics.find(params[:id]).move_higher
    redirect_to dashboard_path(params[:dashboard_id])
  end

  def move_lower
    dashboard = Dashboard.find(params[:dashboard_id])
    dashboard.metrics.order(:position).each_with_index { |metric, i| metric.update_attribute(:position, i + 1) }
    dashboard.metrics.find(params[:id]).move_lower
    redirect_to dashboard_path(params[:dashboard_id])
  end

  def move_to_top
    dashboard = Dashboard.find(params[:dashboard_id])
    dashboard.metrics.order(:position).each_with_index { |metric, i| metric.update_attribute(:position, i + 1) }
    dashboard.metrics.find(params[:id]).move_to_top
    redirect_to dashboard_path(params[:dashboard_id])
  end

  def move_to_bottom
    dashboard = Dashboard.find(params[:dashboard_id])
    dashboard.metrics.order(:position).each_with_index { |metric, i| metric.update_attribute(:position, i + 1) }
    dashboard.metrics.find(params[:id]).move_to_bottom
    redirect_to dashboard_path(params[:dashboard_id])
  end

end
