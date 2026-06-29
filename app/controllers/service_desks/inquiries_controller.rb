module ServiceDesks
  class InquiriesController < ApplicationController
    def index
      @inquiries = Inquiry.includes(:service_desk).order(created_at: :desc)
    end

    def update_status
      @inquiry = Inquiry.find(params[:id])
      if @inquiry.update(status: params[:status])
        InquiryEvent.create!(
          inquiry: @inquiry, event_type: "status_changed",
          from_status: @inquiry.status_before_last_save, to_status: params[:status]
        )
        render turbo_stream: turbo_stream.replace(
          "inquiry_#{@inquiry.id}",
          partial: "service_desks/inquiries/inquiry_card",
          locals: { inquiry: @inquiry }
        )
      end
    end
  end
end
