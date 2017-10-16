def report_add_user(id = nil, email = nil, platform = nil, stage = nil, report_url = nil)
  ReportsUser.create(user_id: id, email: email, stage: stage, platform: platform, report: report_url, created_at: Time.now )
end

def report_add_partner(id = nil, email = nil, platform = nil, stage = nil, report_url = nil)
  ReportsPartner.create(user_id: id, email: email, stage: stage, platform: platform, report: report_url, created_at: Time.now )
end
