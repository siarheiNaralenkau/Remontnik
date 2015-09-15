# -*- encoding: utf-8 -*-

from remont.models import OrganizationProfile, PartnerRequest
from random import randrange
from operator import itemgetter

def get_pending_partner_requests(user):
  response_data = []
  recipient = OrganizationProfile.objects.filter(account=user).first()
  partner_requests = PartnerRequest.objects.filter(org_to=recipient, approved=False)

  print("Pending partner requests amount: {0}".format(len(partner_requests)))

  for pr in partner_requests:
    if pr.org_from.logo:
      logo = pr.org_from.logo.url
    else:
      logo = "/static/remont/images/info_empty.jpg"
    response_data.append({"org_id": pr.org_from.id, "org_name": pr.org_from.name, "org_logo": logo})

  return response_data


# Метод получает 8 организаций с самым высоким рейтингом.
def get_top_orgs():
  top8_data = []
  orgs_list = OrganizationProfile.objects.all()
  index = 0
  for org in orgs_list:
    rating = randrange(1, 11) / 2
    logo = get_org_logo(org)
    top8_data.append({"id": org.id, "name": org.name, "rating": rating, "logo": logo})
    index = index + 1
    if index == 8:
      break

  return sorted(top8_data, key=itemgetter("rating"), reverse=True)


def get_org_logo(org):
  if org.logo:
    logo_url = "/remont/" + org.logo.url
  else:
    logo_url = "/static/remont/images/info_empty.jpg"
  return logo_url