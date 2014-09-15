class CreateFeedbackMessages < ActiveRecord::Migration
  def change
    create_table :feedback_messages do |t|
      t.references :user, index: true
      t.text :message
      t.string :status
      t.string :ticket_number

      t.timestamps
    end
  end
end
