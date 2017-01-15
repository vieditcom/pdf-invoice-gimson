module TradoPdfInvoiceModule::Concerns::GeneratePdf
    extend ActiveSupport::Concern

    included do
        def create_pdf
            @pdf = WickedPdf.new.pdf_from_string(
                render_to_string(
                    template: "themes/#{Store.settings.theme.name}/emails/orders/completed.pdf.erb",
                    layout: "../themes/#{Store.settings.theme.name}/layout/email.pdf.erb"
                )
            )
        end

        def download_pdf
            send_data(@pdf,
                filename: "#{Store.settings.name.parameterize}-invoice-#{@order.invoice_id}.pdf",
                type: 'application/pdf',
                disposition: 'attachment'
            )
        end
    end
end