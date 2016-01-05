Rails.application.routes.draw do
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
	resources :participants do
    get 'report'
		resources :enrollments 
	end


	resources :judges do
		resources :competitions_judges
	end

	
	
	resources :competitions do
    get 'add_part_to_round'
		resources :competitions_judges

		resources :enrollments
		resources :rounds do 
			resources :qualifications do
				resources :scores
				resources :comments
			end
      get 'save_part_score'
			resources :questions
		end
	end
  
  resources :rounds do
    resources :participant do
      resources :questions do
        resources :scores
      end
    end
  end

	resources :enrollments
	resources :qualifications
  # You can have the root of your site routed with "root"

   root 'welcome#index'
   get 'welcome/index'
   post 'welcome/index'
   post 'welcome/create'
   delete 'welcome/destroy'
   
	
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
