class ReferenceNumberGenerator
  def self.generate
    year = Date.current.year
    sequence = Inquiry.where("reference_number LIKE ?", "VA-#{year}-%").count + 1
    "VA-#{year}-#{sequence.to_s.rjust(6, '0')}"
  end
end
