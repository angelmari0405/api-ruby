module Api
    module V1
        class ProductsController <ApplicationController
            before_action :set_product, only: %i[show update destroy]

            #GET /api/v1/products
            def index
                
                @products = Product.all
                render json: @products
            end
            
            #GET    /api/v1/products/:id
            def show
                if @product
                    render json: { message: 'Producto encontrado', data: @product }
                  else
                    render json: { message: 'Producto no encontrado', data: @product.errors }
                  end
            end

            #PATCH/PUT    /api/v1/products/:id
            def update
                if @product.update(product_params)
                    render json: { message: 'Producto actualizado correctamente', data: @product }
                  else
                    render json: { message: 'Fallo al actualizar el producto', data: @product.errors }
                  end
            end

            #POST   /api/v1/products
            def create
                
                @product = Product.new(product_params)
                if @product.save
                    render json: { message: 'Producto agregado satisfactoriamente', data: @product }
                else
                    render json: { message: 'Fallo al agregar producto', data: @product.errors }
                end
            end

            #DELETE /api/v1/products
            def destroy
                if @product.destroy
                    render json: { message: 'Producto borrado correctamente', data: @product }
                  else
                    render json: { message: 'Fallo al borrar producto', data: @product.errors }
                  end
                
            end

            private
            def set_product
                @product = Product.find(params[:id])
            end 

            def product_params
                params.require(:product).permit(:name, :description, :price)
            end
        end
    end
end