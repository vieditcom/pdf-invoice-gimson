TradoPdfInvoiceModule::Engine.routes.draw do

    scope '/admin' do
        resources :orders, only: [], controller: 'trado_pdf_invoice_module/admin/orders' do
            get :invoice_pdf, on: :member
        end
    end

    get "invoice/:token", to: 'trado_pdf_invoice_module/orders#invoice_pdf', as: 'invoice'
end