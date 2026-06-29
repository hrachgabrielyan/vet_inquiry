InquiryEvent.delete_all
Inquiry.delete_all
RoutingRule.delete_all
ServiceDesk.delete_all

edu = ServiceDesk.create!(name: "Education Service",       code: "EDU", description: "GI Bill, tuition, education benefits")
vha = ServiceDesk.create!(name: "Veterans Health Admin",   code: "VHA", description: "Healthcare, prescriptions, mental health")
vba = ServiceDesk.create!(name: "Veterans Benefits Admin", code: "VBA", description: "Disability claims, compensation, pension")
hsg = ServiceDesk.create!(name: "Housing Assistance",      code: "HSG", description: "VA home loans, homeless veteran programs")
gen = ServiceDesk.create!(name: "General Inquiries",       code: "GEN", description: "All other questions")

RoutingRule.create!([
  { category: "education",   service_desk: edu, priority: 1 },
  { category: "health_care", service_desk: vha, priority: 1 },
  { category: "benefits",    service_desk: vba, priority: 1 },
  { category: "housing",     service_desk: hsg, priority: 1 },
  { category: "general",     service_desk: gen, priority: 1 }
])

routed = Inquiry.create!(
  reference_number: "VA-2026-000001", first_name: "James", last_name: "Mitchell",
  email: "j.mitchell@example.com", category: "education", topic: "GI Bill payment delay",
  body: "My GI Bill payment is two weeks late. Who do I contact?",
  status: "routed", service_desk: edu, crm_ticket_id: "DYN-A3F9C1"
)
InquiryEvent.create!(inquiry: routed, event_type: "routed", from_status: "submitted", to_status: "routed")

in_progress = Inquiry.create!(
  reference_number: "VA-2026-000002", first_name: "Maria", last_name: "Santos",
  email: "m.santos@example.com", category: "health_care", topic: "Prescription refill",
  body: "I need to refill my prescription but the VA pharmacy isn't responding.",
  status: "in_progress", service_desk: vha, crm_ticket_id: "DYN-B7D2E4"
)
InquiryEvent.create!(inquiry: in_progress, event_type: "routed",         from_status: "submitted", to_status: "routed")
InquiryEvent.create!(inquiry: in_progress, event_type: "status_changed", from_status: "routed",    to_status: "in_progress")

resolved = Inquiry.create!(
  reference_number: "VA-2026-000003", first_name: "David", last_name: "Okafor",
  email: "d.okafor@example.com", category: "benefits", topic: "Disability rating appeal",
  body: "My disability rating was reduced without explanation. I want to appeal.",
  status: "resolved", service_desk: vba, crm_ticket_id: "DYN-C1A8F5"
)
InquiryEvent.create!(inquiry: resolved, event_type: "routed",         from_status: "submitted",  to_status: "routed")
InquiryEvent.create!(inquiry: resolved, event_type: "status_changed", from_status: "routed",     to_status: "in_progress")
InquiryEvent.create!(inquiry: resolved, event_type: "status_changed", from_status: "in_progress", to_status: "resolved")

puts "Seeded: #{ServiceDesk.count} desks, #{RoutingRule.count} rules, #{Inquiry.count} inquiries"
