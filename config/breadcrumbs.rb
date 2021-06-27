crumb :root do
  link "Home", root_path
end

crumb :items do
  link "出品画面", new_item_path
  parent :root
end

crumb :show do |item|
  link "商品#{item.name}詳細", item_path(item)
  parent :root
end

crumb :edit do |item|
  link "商品#{item.name}編集", item_path(item)
  parent :root
end

crumb :order do |item|
  link "商品#{item.name}の購入"
  # link "#{item_id.name}", item_path(item)
  parent :show, item
end
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).