# -*- encoding: utf-8 -*-

from remont.models import OrganizationProfile, PartnerRequest
from random import randrange
from operator import itemgetter
from datetime import datetime, date, time
import locale
import logging

logger = logging.getLogger('remont.default_logger')

def get_pending_partner_requests(user):
  response_data = []
  recipient = OrganizationProfile.objects.filter(account=user).first()
  partner_requests = PartnerRequest.objects.filter(org_to=recipient, approved=False)

  logger.info("Pending partner requests amount: {0}".format(len(partner_requests)))

  for pr in partner_requests:
    logo = get_org_logo(pr.org_from)
    response_data.append({"org_id": pr.org_from.id, "org_name": pr.org_from.name, "org_logo": logo})

  return response_data


# Метод получает 8 организаций с самым высоким рейтингом.
def get_top_orgs():
  top10_data = []
  orgs_list = OrganizationProfile.objects.all()
  index = 0
  for org in orgs_list:
    rating = get_org_rating(org)
    logo = get_org_logo(org)
    top10_data.append({"id": org.id, "name": org.name, "rating": rating, "logo": logo})
    index = index + 1
    if index == 8:
      break

  return sorted(top10_data, key=itemgetter("rating"), reverse=True)


def get_org_logo(org):
  if org.logo:
    logo_url = "/remont" + org.logo.url
    logger.info("Logo url: {0}".format(logo_url))
  else:
    logo_url = "/static/remont/images/info_empty.jpg"
  return logo_url


def get_org_rating(org):
  rating = randrange(1, 11) / 2
  return rating


def format_message_time(time_obj):
  cur_datetime = datetime.now()
  cur_date = cur_datetime.strftime("%d-%m-%Y")
  cur_time = cur_datetime.strftime("%H:%M")

  was_written_date = time_obj.strftime("%d-%m-%Y")
  was_written_time = time_obj.strftime("%H:%M")
  if was_written_date == cur_date:
    was_written = was_written_time
  else:
    was_written = was_written_date

  return was_written
