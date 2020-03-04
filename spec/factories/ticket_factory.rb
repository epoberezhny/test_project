FactoryBot.define do
  factory :ticket do
    sequence(:request_number) { |i| '09252012-' + i.to_s.reverse[0..4].reverse.rjust(5, '0') }
    sequence(:sequence_number)
    request_type { 'Normal' }
    response_due_date_time { Time.current }
    sequence(:primary_service_area_code) do |i|
      'ZZGL' + i.to_s.reverse[0..2].reverse.rjust(3, '0')
    end
    sequence(:additional_service_area_codes) do |i|
      Array.new(2) { |j| 'ZZGL' + (i + j).to_s.reverse[0..2].reverse.rjust(3, '0') }
    end
    well_known_text do
      points = Array.new(3) { [rand(90), rand(90)] }
      points << points.first
      points = points.map { |pair| pair.join(' ') }.join(',')
      "POLYGON((#{points}))"
    end
  end
end
