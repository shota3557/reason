FactoryBot.define do
    factory :cause do
      content { 'test1' }
      association :task

    end
      # 作成するテストデータの名前を「second_task」とします
      # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
    factory :second_cause, class: Cause do
      content  { 'test2' }
      association :task
    end
  end
  