from remont.models import OrganizationProfile, PartnerRequest

def get_pending_partner_requests(user):
  response_data = []
  recipient = OrganizationProfile.objects.filter(account=user).first()
  partner_requests = PartnerRequest.objects.filter(org_to=recipient, approved=False)

  print("Pending partner requests amount: {0}".format(len(partner_requests)))

  for pr in partner_requests:
    if pr.org_from.logo:
      logo = pr.org_from.logo.url
    else:
      logo = "/remont/static/remont/images/info_empty.jpg"
    response_data.append({"org_id": pr.org_from.id, "org_name": pr.org_from.name, "org_logo": logo})

  return response_data