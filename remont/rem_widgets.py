# -*- coding: utf-8 -*-

from django import forms
from remont.models import WorkCategory, WorkType
from django.utils.html import format_html, escape, conditional_escape
from django.utils.safestring import mark_safe
from django.utils.encoding import force_unicode
from django.forms import ClearableFileInput, CheckboxInput, FileInput

# Custom widgets
class CustomCheckBoxSelectMultiple(forms.CheckboxSelectMultiple):

  items_pre_row = 1

  def render(self, name, value, attrs=None, choices=()):
    # Get job types grouped by categories.
    id_ = attrs.get(u'id', None)
    start_tag = format_html(u'<ul id="{0}" class="categories-list">', id_) if id_ else '<ul class="categories-list">'

    types_by_category = {}
    categories = WorkCategory.objects.all()
    for category in categories:
      types_by_category[category.name] = []

    output = [u"""
      <script type="text/javascript">
        function expand(categoryItem) {
          var typesList = categoryItem.childNodes[6];
          var isVisible = typesList.style.display;
          if(isVisible == 'none') {
            categoryItem.childNodes[1].innerHTML = '-';
            typesList.style.display = 'inline-block';
          }
          else {
            categoryItem.childNodes[1].innerHTML = '+';
            typesList.style.display = 'none';
          }
        }

        function stopProcessing(event) {
          event.stopPropagation();
        }
      </script>
      <style>
        .expand-state {
          margin-top: -7px;
          margin-right: 10px;
          font-size: 16px;
          border: 1px solid black;
          width: 24px;
          height: 24px;
          float: left;
          text-align: center;
        }
        .category-label {
          padding: 6px 6px 6px 6px;
          background-color: #c5c5c5;
          border-radius: 10px;
          box-shadow: 0 0 7px rgba(0,0,0,0.6);
        }
        .job-item-first {
          margin-top: 7px
        }
        .categories-list {
          margin-top: 10px !important;
        }
        .expandable {
          margin-top: 10px;
        }
        .job-item {
          width: 400px;
        }
        ul li {
          list-style-type: none !important;
        }
      </style>
    """]

    output.append(start_tag)

    for i, choice in enumerate(self.choices):
      choice_value, choice_label = choice
      work_type = WorkType.objects.get(pk=choice_value)
      types_by_category[work_type.category.name].append(work_type)

    # Forming the output.
    for category in types_by_category:
      types = types_by_category[category]
      output.append(format_html(u'<li onclick="expand(this)" style="margin-bottom: 20px">'))
      output.append(format_html(u'<div class="expand-state">+</div>'))
      output.append(format_html(u'<span class="category-label">{0}</span>'.format(category)))
      output.append(format_html(u'<br/><ul class="expandable" style="display: none">'))
      for job_type in types:
        output.append(format_html(u'<li onclick="stopProcessing(event)">'))
        output.append(format_html(u'<label for="id_{0}" class="job-item">'.format(job_type.id)))
        output.append(format_html(u'<input id="id_{0}" name="{1}" type="checkbox" value={2}'.format(job_type.id, name, job_type.id)))
        if value and job_type.id in value:
          output.append(format_html(u' checked="checked"'))
        output.append(format_html(u'/>{0}</label></li>'.format(job_type.name)))
        output.append(format_html(u'</li>'))
      output.append(format_html(u'</ul></li>'))

    output.append(u'</ul>')

    return mark_safe('\n'.join(output))

    # Selected job types are stored in "value" list.
    # To Override output rendering - see example at: http://stackoverflow.com/questions/3986757/how-can-i-render-a-custom-nested-checkbox-tree-view-in-django-admin
    # return super(CustomCheckBoxSelectMultiple, self).render(name, value, attrs, choices)
    # return mark_safe(output.replace(u'<ul>', u'').replace(u'</ul>', u'').replace(u'<li>', u'<p>').replace(u'</li>', u'</p>'))


class SingleImageInput(FileInput):

  def render(self, name, value, attrs=None,):
    preview_div_id = name + "PreviewDiv"
    output = list()

    output.append(
      u"""
      <style type="text/css">
        .file-form {
          background-color: #FFFFFF;
          border: 1px solid #CCCCCC;
          border-radius: 2px;
          cursor: pointer;
          height: 26px;
          overflow: hidden;
          padding: 2px;
          position: relative;
          text-align: left;
          vertical-align: middle;
          width: 230px;
        }
      """
    )
    output.append(
      u"""
        .file-form .select-button {
          background-color: #A2A3A3;
          border: 1px solid #939494;
          border-radius: 2px;
          color: #FFFFFF;
          float: right;
          font-size: 16px;
          height: 20px;
          line-height: 20px;
          overflow: hidden;
          padding: 2px 6px;
          text-align: center;
          vertical-align: middle;
          width: 50px;
        }"""
    )
    output.append(
      u"""
        .file-form .single-file-upload{
          position: absolute;
          top: 0;
          left: 0;
          width: 100%;
          -moz-opacity: 0;
          filter: alpha(opacity=0);
          opacity: 0;
          font-size: 150px;
          height: 30px;
          z-index: 20;
        }

        .thumb {
          height: 100px;
          width: 100px;
          border: 1px solid #000;
          margin: 10px 5px 0 0;
        }"""
    )
    output.append((u"\n#{0}".format(preview_div_id)))
    output.append(
      u"""
        {
          margin-left: 20px;
          margin-top: 10px;
          margin-bottom: 10px;
          display: inline-block;
        }
      </style>"""
    )
    output.append(u"""
      <script type="text/javascript">
      function handleFileSelect(evt) {
        var file = evt.target.files[0];
      """)
    output.append(u"""document.getElementById("{0}").innerHTML = '';""".format(preview_div_id))
    output.append(u"""
      if(file.type.match('image.*')) {
        var reader = new FileReader();
        reader.onload = (function(theFile) {
          return function(e) {
            var imgPreview = ['<img class="thumb" src="', e.target.result, '" title="', theFile.name, '"/>'].join('');
        """)
    output.append(u"""document.getElementById("{0}").innerHTML = imgPreview;""".format(preview_div_id))
    output.append(u"""
      }
    })(file);

    reader.readAsDataURL(file);
    }
    };
    </script>""")
    output.append(u"""
      <div class="file-form">
      <div class="select-button">Обзор</div>
      """)
    output.append(u"""<input class="single-file-upload" type="file" name="{0}" id="{1}"
      onchange="handleFileSelect(event);"/>""".format(name, attrs["id"]))
    if value:
      img_url = "/remont/media/" + value
    else:
      img_url = "/static/remont/images/info_empty.jpg"
    output.append(u"""</div><div id="{0}"><img class="thumb" src="{1}"/></div>""".format(preview_div_id, img_url))

    result = mark_safe(''.join(output))
    return result
