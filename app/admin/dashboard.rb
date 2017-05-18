ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do

         column do
           panel "Recent Courses" do
             table_for Course.order('id desc').limit(10) do
               column("Course Code")   {|co| link_to(co.code, admin_course_path(co)) }
               column("Course Name")  {|co| co.name }
               column("Department Name"){|co| co.department }
               column("Course Poster")  {|co| co.user }

             end
           end
         end
    end # columns
columns do
    column do
      panel "Recent Reviews" do
        table_for Review.order('id desc').limit(10) do
          column("Review Title")   {|co| co.title }
          column("Course Rating")  {|co| co.rating }
          column("Review"){|co| link_to(co.review, admin_review_path(co.title, co)) }
          column("Review Author")  {|co| co.user }

        end
      end
    end
end

  end # content
end
