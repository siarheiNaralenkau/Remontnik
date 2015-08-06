$(function() {
  $(".job-type-label").click(showOrgsForJob);

  function showOrgsForJob() {
    var jobId = $(this).attr("data-jobId");
    var url = "/remont/get_orgs_by_job_type?jobId=" + jobId;
        window.open(url, "_self");
  }
});