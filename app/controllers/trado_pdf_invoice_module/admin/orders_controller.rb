class TradoPdfInvoiceModule::Admin::OrdersController < ApplicationController
    before_action :authenticate_user!
    include TradoPdfInvoiceModule::Concerns::GeneratePdf

    def invoice_pdf
        set_order
        create_pdf
        download_pdf
    end

    private

    def set_order
        @order ||= Order.active.complete.find(params[:id])
    end
end