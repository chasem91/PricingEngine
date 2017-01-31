json.name company.name
json.plans do
  json.array!(company.plans) do |plan|
    json.partial! 'api/plans/plan', plan: plan
  end
end
