class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      InquiryRoutingJob.perform_later(@inquiry.id)
      redirect_to @inquiry, notice: "Submitted. Reference: #{@inquiry.reference_number}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @inquiry = Inquiry.find_by!(reference_number: params[:id])
  end

  def lookup
    return unless params[:email].present?
    @inquiries = Inquiry.where("LOWER(email) = ?", params[:email].strip.downcase)
                        .order(created_at: :desc)
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:first_name, :last_name, :email, :category, :topic, :body)
  end
end
