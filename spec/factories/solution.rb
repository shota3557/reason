FactoryBot.define do
    factory :solution do
      content { 'solution1' }
      association :cause

    end
      # 作成するテストデータの名前を「second_task」とします
      # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
    factory :second_solution, class: Solution do
      content  { 'solution2' }
      association :cause
    end
  end