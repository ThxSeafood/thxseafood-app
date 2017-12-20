# frozen_string_literal: true

class HomePage
  include PageObject

  page_url ThxSeafood::App.config.APP_URL

  
  table(:jobs_table, id: 'jobs_table')

  indexed_property(
    :job,
    [
      [:span, :owner,        { id: 'job[%s].name' }],
      [:a,    :name_link,    { id: 'job[%s].link' }],
      [:a,    :gh_url,       { id: 'job[%s].company' }]
      
    ]
  )

  def first_job
    job[0]
  end

  def second_job
    job[1]
  end

  def job_listed_count
    job_table_element.rows - 1
  end

  

  def listed_repo(job)
    {
      name: job.name,
      link: job.link,
      company: job.company,
      
    }
  end
end