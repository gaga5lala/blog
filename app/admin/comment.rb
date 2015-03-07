ActiveAdmin.register Comment, as: "UserComment" do
  permit_params :post, :name, :body
  
  index do
    selectable_column
    id_column
    column :name
    column :body
    column "Post_title", :post_id  do |comment|
      link_to comment.post.title ,admin_post_path(comment.post_id)
    end

    actions
  end
end
