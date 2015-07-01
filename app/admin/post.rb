ActiveAdmin.register Post do
  permit_params :title,
                :post_type,
                :email,
                :email_confirmation,
                :street,
                :city,
                :state,
                :postal_code,
                :country,
                :neighborhood,
                :description

  form do |f|
    f.semantic_errors(*f.object.errors.keys)
    f.inputs do
      f.input :title, as: :string
      f.input :description, as: :string
      f.input :street, as: :string
      f.input :city, as: :string
      f.input :state, as: :string
      f.input :postal_code, as: :string
      f.input :country, as: :string
      f.input :neighborhood, as: :string
      f.input :email, as: :email
      f.input :expiration
      f.input :validation
      f.input :show
      f.input :post_type, as: :select, collection: Post.post_types.keys
    end
    f.actions
  end
end
