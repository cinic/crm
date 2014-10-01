class FeedbackMessagesController < ApplicationController
  before_action :set_feedback_message, only: [:show, :edit, :update, :destroy]

  def index
    @feedback_messages = FeedbackMessage.all
  end

  def show
  end

  def new
    @feedback_message = FeedbackMessage.new
  end

  def edit
  end

  def create
    @feedback_message = FeedbackMessage.new(feedback_message_params)
    @feedback_message.user_id = current_user.id
    @feedback_message.ticket_number = rand(5..30)
    @feedback_message.status = 'new'

    respond_to do |format|
      if @feedback_message.save
        format.html { redirect_to @feedback_message, notice: "Сообщение отправлено и ему присвоен тикет #{@feedback_message.ticket_number}." }
        format.json { render action: 'show', status: :created, location: @feedback_message }
      else
        format.html { render action: 'new' }
        format.json { render json: @feedback_message.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @feedback_message.update(feedback_message_params)
        format.html { redirect_to @feedback_message, notice: 'Сообщение отправлено и ему присвоен тикет.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @feedback_message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @feedback_message.destroy
    respond_to do |format|
      format.html { redirect_to feedback_messages_url }
      format.json { head :no_content }
    end
  end

  private
    def set_feedback_message
      @feedback_message = FeedbackMessage.find(params[:id])
    end

    def feedback_message_params
      params.require(:feedback_message).permit(:user_id, :message, :status, :ticket_number)
    end
end
