# To change this template, choose Tools | Templates
# and open the template in the editor.

authorization do
  role :admin do
    has_permission_on [:bid_items], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end
end

def role_symbols
  roles.map do |role|
    role.name.underscore.to_sym
  end

authorization do
  role :admin do
    has_permission_on [:bid_items], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end

  role :guest do
    has_permission_on :bid_items, :to => [:index, :show]
  end
end

end  