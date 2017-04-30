class Product < ActiveRecord::Base
  has_many :detail_purchase_receipts
  has_many :purchase_receipts, through: :detail_purchase_receipts
  belongs_to :category

  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  private # ensure
    def ensure_not_referenced_by_any_line_item
     if line_items.empty?
      return true
      else errors.add(:base, 'Line Items present' )
      return false

    end
    end



  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end

    def self.import(file)
      accessible_attributes= ['nombre','cantidad','valor_unitario','valor_total_curso']
      spreadsheet =open_spreadsheet(file)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do|i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
      product = find_by_id(row["id"]) || new
      product.attributes = row.to_hash.slice(*accessible_attributes)
      product.save!

    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, file_warning: :ignore)
      when ".xls" then Roo::Excel.new(file.path, file_warning: :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, file_warning: :ignore)
    else raise  "Extension desconocida: #{file.original_filename}"
    end
  end
end
