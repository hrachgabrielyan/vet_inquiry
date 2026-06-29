class InquiryRoutingJob < ApplicationJob
  queue_as :default
  retry_on StandardError, attempts: 3, wait: :polynomially_longer

  def perform(inquiry_id)
    inquiry = Inquiry.find(inquiry_id)
    InquiryRouter.new(inquiry).route
  rescue => e
    inquiry&.update(status: "routing_failed")
    raise
  end
end
