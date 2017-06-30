
class ContractPdf < Prawn::Document
  def initialize(service)
    super(top_margin:10, left_margin:30)
    @service = service
    header(@service.laboratory.header_image.url)
    footer
    body
  end

  def header(header_logo_url)
    repeat :all do
      bounding_box [bounds.left, bounds.top], :width  => bounds.width do
        begin
          File.join(Rails.root, "public", header_logo_url)
          image header_logo, :width => bounds.width
        rescue
          puts 'Error in inserting logo image in header'
        end
        stroke_horizontal_rule
      end
    end
  end

  def body
    bounding_box([bounds.left, bounds.top - 150], :width  => bounds.width, :height => bounds.height - 400) do                 
        text "Lima, #{Date.today.day} de #{month_in_spanish} del #{Date.today.year}", :size => 11, :align => :left
        move_down(20)
        text "Acuerdo por Prestación de Servicios", :size =>13, :style => :bold, :align => :center
        move_down(30)
        service_info
        move_down(10)
        service_description
        move_down(100)
        signatures

      end
  end

  def service_info
    text "Referencia: Solicitud de Servicio Nro. #{@service.id}", :size => 11, :align => :right
    move_down 30
    text "Mediante este documento se hace efectiva la aceptación del servicio de <b>#{@service.subject}</b> solicitada por el cliente <b>#{@service.client.name}</b> con RUC/DNI <b>#{@service.client.ruc}</b> al <b>#{@service.laboratory.name}</b> por el monto de <b>#{@service.total} Nuevos Soles</b> . El detalle del servicio se muestra a continuación:</b>", :align => :justify, :inline_format => true
    move_down 20

  end

  def service_description
    data=[[ "Descripción de Muestra", "Categoría de Muestra", "Método de Ensayo", "Acreditado"]]
    @service.sample_preliminaries.each { |x| 
      data+=[["#{x.description}", "#{SampleCategory.find(x.sample_category_id).name}","#{SampleMethod.find(x.sample_method_id).name}", "#{acreditted(SampleMethod.find(x.sample_method_id).accredited?)}"]] 
    }
    table data, :header => true, :position => :center, :cell_style => {:size => 11, :border_width => 1.5}
    
  end

  def signatures
    stroke do
        stroke_color '000000'
        dash(1, space: 2, phase: 0)
        line_width 2
        move_down 15
        horizontal_line(bounds.right-180, bounds.right)
        horizontal_line(bounds.left, bounds.left + 180)
    end
    move_down(5)
    @cursor_firs_set=cursor
    bounding_box [bounds.right-180, @cursor_firs_set], :width  => 180 do
      text "Responsable #{@service.laboratory.name}", :align => :center, :size => 11
      text "#{@service.laboratory.users.find_by_role_id(Role.find_by_name("Jefe de Laboratorio").id).name}", :align => :center, :size => 11
    end
    bounding_box [bounds.left, @cursor_firs_set], :width  => 180 do
      text "Responsable #{@service.client.name}", :align => :center, :size => 11
      text "#{@service.client.contact_person}", :align => :center, :size => 11
    end
  end

  def footer
    repeat :all do
      bounding_box [bounds.left, bounds.bottom + 25], :width  => bounds.width do
              font "Helvetica"
              stroke_horizontal_rule
              move_down(5)
              @cursor_firs_set=cursor
              text "#{@service.laboratory.name}", :size => 10
          end
      end
  end

  def page_counter
    
    page_count.times do |i|
      go_to_page(i+1)
      bounding_box([bounds.right-65, bounds.bottom + 20], :width => 65, :align => :right) {
      text "Página #{i+1} de #{page_count}", :size => 10
    }
   end
  end

  def month_in_spanish
    @months_in_spanish =['', 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Setiembre', 'Octubre', 'Noviembre', 'Diciembre']
    @months_in_spanish[Date.today.month]
  end

  def acreditted(value)
    if value
      "Si"
    else
      "No"
    end
  end

  def total_price(samples)
    total = 0
    samples.each { |x| 
      total += x.subtotal_cost 
    }
  end
end