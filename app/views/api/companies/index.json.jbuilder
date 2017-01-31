json.array!(@companies) do |company|
  json.partial! 'api/companies/company', company: company
end
