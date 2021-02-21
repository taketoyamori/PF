class ChangeReportToReports < ActiveRecord::Migration[5.2]
  def change
    rename_table :report, :reports
  end
end
